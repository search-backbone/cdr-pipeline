# bulk insert json file.
# json file has some special format !

source .elk.env
echo "Play ------- Load Bulk data -------"

echo "Step 1 ------- Create Index -------"

curl -X PUT "${ELASTIC_IP}:9200/${INDEX_NAME}?pretty" \
     -H 'Content-Type: application/json' \
     --data-binary '@mappings/call_records_mapping.json'


echo "Step 2 ------- Load bulk data -------"
curl -H 'Content-Type: application/x-ndjson' \
     -XPOST "http://localhost:9200/${INDEX_NAME}/_bulk?pretty" \
     --data-binary '@data/call_bulk.json'

# query
echo "Step 3 ------- Check data -------"
curl -XGET "http://localhost:9200/${INDEX_NAME}/_search?q=sira_no:37&pretty"
curl -XGET "http://localhost:9200/${INDEX_NAME}/_search?q=hedef_numara:5529991111&pretty"

echo "On UI, create index patern, to see on Kibana UI discovery"

# w/ pipeline: -XPOST 'http://localhost:9200/test/_bulk?pretty or
#              -XPOST 'http://localhost:9200/_bulk?pretty



# partial update, use POST
#  below expects only 1 record=line inside the file!
# curl -H 'Content-Type: application/x-ndjson' \
#      -XPOST 'http://localhost:9200/test/_doc?pretty' \
#      --data-binary '@y.json'

# full update or creation, use PUT
# expects only 1 record !
# curl -H 'Content-Type: application/json' \
#      -XPUT 'http://localhost:9200/test/_doc?pretty' \
#      -d '{"numara":"5397654888","tip":"Gprs","hedef_numara":""}'