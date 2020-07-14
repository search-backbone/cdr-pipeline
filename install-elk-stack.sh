
source .elk.env
echo "Play ------- Install ELK on COS image instance on GCP -------"

# handle permissions
echo "Step 0 ------- Adjust data and pipelines for logstash -------"
chmod 777 ~/cdr-pipeline/data
chmod 777 ~/cdr-pipeline/pipelines


echo "Step 1 ------- Install elastic on docker -------"
docker run -itd --name ${ELASTIC_NAME} \
           -p 9200:9200 \
           -p 9300:9300 \
           -e ES_JAVA_OPTS="-Xms16g -Xmx16g" \
           -e discovery.type="single-node" \
           --ulimit nofile=65535:65535 \
           docker.elastic.co/elasticsearch/elasticsearch:7.8.0

echo "Step 2 ------- Install kibana on docker -------"
docker run -itd --name ${KIBANA_NAME} \
           --link ${ELASTIC_NAME}:elasticsearch \
           -p 5601:5601 \
           docker.elastic.co/kibana/kibana:7.8.0

# check
echo "Step 3 ------- Check elasticsearch server -------"
curl "localhost:9200"





echo "Run, bash load-bulk.sh, to create index and load bulk data"
echo "Use, docker start abidindenyo kibos, once you have started !!!"
