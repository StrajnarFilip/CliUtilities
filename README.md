## Generate SSH key and conveniently include it to authorized keys:
```sh
curl https://raw.githubusercontent.com/StrajnarFilip/CliUtilities/master/bash/quick-ssh.sh | bash
```

## Add bash script as a systemd service
```sh
curl https://raw.githubusercontent.com/StrajnarFilip/CliUtilities/master/bash/add-systemd-service.sh > add-systemd-service.sh
bash add-systemd-service.sh "serviceName" "/absolute/path/to/script"
```
