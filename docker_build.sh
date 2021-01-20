
version='3.0.1'
tag='spark'

docker rmi ${tag}:${version}
docker build -t ${tag}:${version} -f ./Spark.dockerfile .

echo ${tag}:${version}

read -n 1 -p "Press any key to continue..."