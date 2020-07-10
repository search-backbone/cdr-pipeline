# bulk insert json file.
# json file has some special format !

source .elk.env

curl -H 'Content-Type: application/x-ndjson' \
     -XPOST 'http://localhost:9200/${INDEX_NAME}/_bulk?pretty' \
     --data-binary '@data/call_records_bulk.json'

echo "On UI, create index patern, test, to see UI discovery"

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