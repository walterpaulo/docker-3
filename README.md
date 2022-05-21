# Treinamento de Devops


* [Docker](./0.1-ec2-docker/README.md)


## Commands

### start

```
./start
```

### destroy
```
./destroy
```

## Commandos dockers

### start container
```
docker start id_container
```

### off container
```
docker stop id_container
```
### Show up
```
docker ps
```
### Show down
```
docker ps -a
```

## Advanced Commands

### destroy all container
```
docker rm $(docker ps -a --quiet)
```

### new image
```
docker build -t walterpaulo/my_image -f Dockerfile 
```
