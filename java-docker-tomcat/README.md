# Docker Java and TomCat


* Spring Boot v.3.0.1;
    * Java v.17;
* Docker v.18.09.1;
* Maven v.3.8.7;
* TomCat v.8.0.53


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

### Access container
```
docker exec -it javawar bash

```
### Init
```
http://localhost:8080

```

### Filtro
init
```
docker images -f "dangling=true" -q
```