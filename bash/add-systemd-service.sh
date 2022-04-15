#!/bin/bash
#    Collection of useful CLI utilities
#    Copyright (C) 2022  Filip Strajnar
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
if test $(whoami) != "root"
then
    "You must run this script as root. Exiting."
    exit
fi

service_name=$1
bash_script_path=$2

if test ${bash_script_path:0:1} != "/"
then
    "The path to bash script needs to be absolute. Exiting."
    exit
fi

service_path="/etc/systemd/system/${1}.service"

echo "[Service]
ExecStart=bash $bash_script_path

[Install]
WantedBy=multi-user.target" >> $service_path

systemctl enable $service_name
systemctl start $service_name
systemctl status $service_name