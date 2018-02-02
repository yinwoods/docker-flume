# FROM [mrwilson/docker-flume](https://github.com/mrwilson/docker-flume)

# docker-flume

  Self-contained Docker image containing Java and [Apache Flume](https://flume.apache.org/) and Hadoop jars

## Usage

    $ docker pull yinwoods/flume
    $docker run \
     --net host \
     --name flume \
      --env FLUME_AGENT_NAME=agent \
      --volume flume.conf:/opt/flume/conf/flume.conf \
      --detach \
      yinwoods/flume:latest

Note: the `FLUME_AGENT_NAME` environment variable and presence of `/opt/flume/config/flume.conf` on the image are **required**.
  
## Building your own

Build and run image

    $ docker build -t my-flume-image .
    $ docker run --detch my-flume-image
