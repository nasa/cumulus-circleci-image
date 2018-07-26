# Base CircleCI image for testing Cumulus Core

[![CircleCI](https://circleci.com/gh/nasa/cumulus-circleci-image.svg?style=svg)](https://circleci.com/gh/nasa/cumulus-circleci-image)

### Local Build

     $ docker build . -t cumuluss/circleci:node-8.11

### Local Test

     $ docker run --rm -it -p 20:20 -p 21:21 -p 47400-47470:47400-47470 -p 3030:3030 -p 2222:2222 cumuluss/circleci:8.11 /bin/bash

### Provider Server

To run this image as a provider server with the test data:

    $ docker run -it -e ON_AWS=true -p 20:20 -p 21:21 -p 47400-47470:47400-47470 -p 3030:3030 cumuluss/circleci:node-8.11 start

In the above example the test-data is loaded from the latest version of @cumulus/test-data package on npm.

If you need to load test-data other than the ones published to npm make sure to set `TEST_DATA_S3_PATH` and point to the location of test files. For example:

    $ docker run -it -e ON_AWS=true -e TEST_DATA_S3_PATH=s3://cumulus-data-shared/@cumulus/test-data/ -p 20:20 -p 21:21 -p 47400-47470:47400-47470 -p 3030:3030 cumuluss/circleci:node-8.11 start

## Credit

- [Bogem FTP Docker Image](https://github.com/bogem/dockerfiles/tree/master/ftp)
- [atmoz SFTP Docker Image](https://github.com/atmoz/sftp)