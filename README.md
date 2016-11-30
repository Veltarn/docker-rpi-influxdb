# docker-rpi-influxdb
Dockerfile for running InfluxDB (https://www.influxdata.com/) on the Raspberry Pi

## Install Docker (on raspbian)

Since Docker is now officially supported on the Raspberry Pi, here is the best way to get the last version of docker on it.

```
sudo curl -sSL https://get.docker.com | sh
```

This command will download and execute docker installation scripts.

### Enable service
```
sudo systemctl enable docker
```

### Start Docker
```
sudo systemctl start docker
```

### Check if everything is working
```
sudo docker info
```

## Build the docker image (Image is not on the hub yet)
### Clone github repository
```bash
git clone https://github.com/Veltarn/docker-rpi-influxdb.git
cd docker-rpi-influxdb
# Run build script
./build.sh
```

## Run docker container
```bash
./run.sh
```
