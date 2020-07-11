source .elk.env


curl -X PUT "${ELASTIC_IP}:9200/${INDEX_NAME}?pretty" \
     -H 'Content-Type: application/json' \
     --data-binary '@mappings/call_records_mapping.json'

# check
curl "localhost:9200/call-records?pretty"