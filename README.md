# spark_image_build
用于docker创建spark镜像, standalone
http://spark.apache.org/docs/latest/spark-standalone.html

spark下载地址: https://spark.apache.org/downloads.html

step1: 下载仓库到本地

step2: 下载目标版本的spark(默认spark3.0.1版本, 如下载其他版本, 请同时修改材料中的dockerfile), 并解压到仓库目录

step3: 使用仓库中的docker build脚本即可创建镜像