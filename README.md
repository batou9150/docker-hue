# batou9150/hue

![Docker Pulls](https://img.shields.io/docker/pulls/batou9150/hue.svg)
![Docker Stars](https://img.shields.io/docker/stars/batou9150/hue.svg)
[Docker Hub](https://hub.docker.com/r/batou9150/hue/) 

**A docker image to run [Hue](http://gethue.com)**

> Hue on github : [cloudera/hue](https://github.com/cloudera/hue)

## Environment Variables

Hue
* `CONFIG_HUE_BIND_HOST` : Webserver listens on this address. (default "0.0.0.0")
* `CONFIG_HUE_PORT` : Webserver listens on this port. (default "8888")
* `CONFIG_HUE_APP_BLACKLIST` : Comma separated list of apps to not load at server startup. (Optionnal)
* `CONFIG_DJANGO_DEBUG_MODE` : Enable or disable debug mode. (default "true")
* `CONFIG_TIME_ZONE` : Time zone name. (default "America/Los_Angeles")
* `CONFIG_ENABLE_PROMETHEUS` : Turn on Prometheus metrics end point /metrics. (default "false")

Hue Database
* `CONFIG_DATABASE_ENGINE` : Database engine, such as mysql, postgres, oracle or sqlite3 (default sqlite3")
* `CONFIG_DATABASE_HOST` : Database host. (default "")
* `CONFIG_DATABASE_PORT` : Database port. (default "")
* `CONFIG_DATABASE_USER` : Database username. (default "")
* `CONFIG_DATABASE_PASSWORD` : Database password. (default "")
* `CONFIG_DATABASE_NAME` : Database name, or path to DB if using sqlite3. (default desktop/desktop.db")
* `CONFIG_DATABASE_SCHEMA` : Database schema, to be used only when public schema is revoked in postgres. (default public")

SMTP (Optionnal)
* `CONFIG_SMTP_HOST` : SMTP server
* `CONFIG_SMTP_PORT` : SMTP port (default "25")

SPARK with LIVY (Optionnal)
* `CONFIG_LIVY_HOST` : The host of the livy server
* `CONFIG_LIVY_PORT` : The port of the livy server (default "8998")

HDFS
* `CONFIG_HDFS_DEFAULTFS` : The filesystem uri. (default "hdfs://localhost:8020")
* `CONFIG_HDFS_WEBHDFS` : Domain should be the NameNode or HttpFs host. (default "http://localhost:50070/webhdfs/v1")

YARN
* `CONFIG_YARN_HOST` : The host on which you are running the ResourceManager. (default "localhost")
* `CONFIG_YARN_PORT` : The port where the ResourceManager IPC listens on. (default "8032")
* `CONFIG_YARN_API` : URL of the ResourceManager API. (default "http://localhost:8088")
* `CONFIG_YARN_PROXI_API` : URL of the ProxyServer API. (default "http://localhost:8088")

MAPRED
* `CONFIG_MAPRED_JOBHISTORY` : URL of the MapRed HistoryServer API. (default "http://localhost:19888")

SPARK HISTORY when using YARN (Optionnal)
* `CONFIG_SPARK_HISTORY` : URL of the Spark History Server.

HIVE (Optionnal)
* `CONFIG_HIVE_HOST` : Host where HiveServer2 is running.
* `CONFIG_HIVE_PORT` : Port where HiveServer2 Thrift server runs on. (default "10000")

OOZIE (Optionnal)
* `CONFIG_OOZIE_URL` : The URL where the Oozie service runs on.
* `CONFIG_OOZIE_REMOTE_DEPLOYEMENT_DIR` : Location on HDFS where the workflows/coordinator are deployed when submitted.
