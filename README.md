# Base CircleCI image for testing Cumulus Core

### Local Build

     $ docker build . -t cumuluss/circleci:node-6.10

### Local Test

     $ docker run --rm -it -p 20:20 -p 21:21 -p 47400-47470:47400-47470 -p 3030:3030 -p 2222:2222 cumuluss/circleci:6.10 /bin/bash

## Credit

- [Bogem FTP Docker Image](https://github.com/bogem/dockerfiles/tree/master/ftp)
- [atmoz SFTP Docker Image](https://github.com/atmoz/sftp)