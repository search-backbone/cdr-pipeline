
export ELASTIC_NAME=abidindenyo

docker run -itd --name ${ELASTIC_NAME} \
           -p 9200:9200 -p 9300:9300 \
           --ulimit nofile=65535:65535 \
           -e ES_JAVA_OPTS="-Xms16g -Xmx16g" \
           -e "discovery.type=single-node" \
           docker.elastic.co/elasticsearch/elasticsearch:7.8.0
