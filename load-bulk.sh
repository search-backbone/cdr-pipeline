# bulk insert json file.
# json file has some special format !

source .elk.env

curl -s \
     -H 'Content-Type: application/x-ndjson' \
     -XPOST 'http://localhost:9200/${INDEX_NAME}/_bulk?pretty' \
     --data-binary '@data/call_records_bulk.json'

echo "On UI, create index patern, test, to see UI discovery"

# w/ pipeline: -XPOST 'http://localhost:9200/test/_bulk?pretty or
#              -XPOST 'http://localhost:9200/_bulk?pretty