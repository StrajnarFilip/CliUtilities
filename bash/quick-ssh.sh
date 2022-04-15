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

ssh-keygen -t ed25519 -f ~/.ssh/ed25519 -N ""
public_key="$(cat ~/.ssh/ed25519.pub)"
echo "
Copy the line below into ~/.ssh/authorized_keys on target device:"
echo $public_key
echo "
Alternatively, use this script with bash:"
echo 'echo "'$public_key'" >> ~/.ssh/authorized_keys'
echo "
Or this script with powershell:"
echo 'Add-Content -Path "~/.ssh/authorized_keys" -Value "'$public_key'"'
echo "
On a Windows machine for Administrator accout:"
echo 'Set-Content -Path "${env:ProgramData}\ssh\administrators_authorized_keys" -Value "'$public_key'"'