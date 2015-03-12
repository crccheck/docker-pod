Based on https://registry.hub.docker.com/_/mysql/

Specifically: https://github.com/docker-library/mysql/blob/master/5.6

Modified to get running again and to store data and logs in one volume for
developer convenience


#### Starting a new container

```
docker run --name=to_mysql \
  -e "MYSQL_ROOT_PASSWORD=docker" \
  -e "MYSQL_USER=docker" \
  -e "MYSQL_PASSWORD=hunter2" \
  -v ~/volumes/to_mysql:/data
  crccheck/mysql
```
