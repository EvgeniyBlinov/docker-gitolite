# Docker image for Gitolite

This image allows you to run a git server in a container with OpenSSH and [Gitolite](https://github.com/sitaramc/gitolite#readme).

Based on Alpine Linux.

### Install

Generate dirs and keys

```
make
```

Up docker-compose

```
docker-compose up -d
```

Clone gitolite-admin

```
make gitolite-admin
```
