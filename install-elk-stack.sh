
source .elk.env

echo "create a COS image instance on GCP"

# handle permissions
chmod 777 ~/cdr-pipeline/data
chmod 777 ~/cdr-pipeline/pipelines

echo ${ELASTIC_DOCKER_PRIVATE_IP}

docker run -itd --name ${ELASTIC_NAME} \
           -p 9200:9200 \
           -p 9300:9300 \
           -e ES_JAVA_OPTS="-Xms16g -Xmx16g" \
           -e discovery.type="single-node" \
           --ulimit nofile=65535:65535 \
           docker.elastic.co/elasticsearch/elasticsearch:7.8.0

docker run -itd --name ${KIBANA_NAME} \
           --link ${ELASTIC_NAME}:elasticsearch \
           -p 5601:5601 \
           docker.elastic.co/kibana/kibana:7.8.0

docker run -itd --name ${LOGSTASH_NAME} \
           -e LS_JAVA_OPTS="-Xms4g -Xmx8g" \
           -e xpack.monitoring.enabled="false" \
           -e xpack.monitoring.elasticsearch.hosts="http://${ELASTIC_DOCKER_PRIVATE_IP}:9200” \
           -v ~/cdr-pipeline/pipelines/:/usr/share/logstash/pipeline/ \
           -v ~/cdr-pipeline/data:/usr/share/logstash/data/ \
           docker.elastic.co/logstash/logstash:7.8.0

echo "Use, docker logs CONTAINER_NAME, to see errors"
echo "Check scenarios to test" 
echo "to test bulk data ingestion, Run: sh load-bulk.sh"  

echo "Use, docker start abidindenyo kibos ketenpere, once you have started !!!"
