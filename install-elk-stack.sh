
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

sleep 60s

# check
echo "Step 3 ------- Check elasticsearch server -------"
curl "localhost:9200"

echo "Step 4 ------- Install logstash -------"
docker run -itd --name ${LOGSTASH_NAME} \
           -e LS_JAVA_OPTS="-Xms4g -Xmx8g" \
           -e xpack.monitoring.enabled="false" \
           -e xpack.monitoring.elasticsearch.hosts="http://${ELASTIC_DOCKER_PRIVATE_IP}:9200" \
           -v ~/cdr-pipeline/pipelines/:/usr/share/logstash/pipeline/ \
           -v ~/cdr-pipeline/data:/usr/share/logstash/data/ \
           docker.elastic.co/logstash/logstash:7.8.0

sleep 90s

echo "Step 5 ------- Check data -------"
curl -XGET "http://localhost:9200/${INDEX_NAME[0]}/_search?q=numara:5529990000&pretty"
curl -XGET "http://localhost:9200/${INDEX_NAME[1]}/_search?q=numara:5529990000&pretty"

echo "Use, docker logs ${LOGSTASH_NAME} | tail &, to see logstash logs"
echo "Use, docker start abidindenyo kibos ketenpere, once you have started !!!"
