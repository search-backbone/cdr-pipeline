
source .elk.env

docker run -itd--name ${KIBANA_NAME} \
           --link ${ELASTIC_NAME}:elasticsearch \
           -p 5601:5601 \
           docker.elastic.co/kibana/kibana:7.8.0

echo "Run ./install-kibana-docker.sh"           