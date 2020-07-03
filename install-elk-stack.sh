
source .elk.env

echo "create a COS image instance on GCP"

docker run -itd --name ${ELASTIC_NAME} \
           -p 9200:9200 -p 9300:9300 \
           --ulimit nofile=65535:65535 \
           -e ES_JAVA_OPTS="-Xms16g -Xmx16g" \
           -e "discovery.type=single-node" \
           docker.elastic.co/elasticsearch/elasticsearch:7.8.0

docker run -itd--name ${KIBANA_NAME} \
           --link ${ELASTIC_NAME}:elasticsearch \
           -p 5601:5601 \
           docker.elastic.co/kibana/kibana:7.8.0

echo "Check scenarios to test" 
echo "to test bulk data ingestion, Run: sh load-bulk.sh"            
