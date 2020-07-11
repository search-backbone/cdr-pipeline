# elasticsearch-sandbox

Importing *.csv to elasticsearch

- [x] Preparations
    - to create COS instance on GCP `bash create-instance.sh`
        - to install ELK `bash install-elk-stack.sh`

- [x] Conversions
    - xslx to csv
    - csv to json, then bulk-elastic-json
        - `npm i -g csvtojson`, then
        - `csvtojson data/call.csv --delimiter=";" > data/call_2.json`, then Edit file and remove _[_, _]_ and _,_ chars, then
        - `cat data/call_2.json | jq -c '. | {"index": {}}, .' > data/call_bulk.json`

- Scenarios
    - [ ] One record
    - [x] Bulk 
        - json to bulk-elastic-json is must. Uses `data/call_bulk.json` file
        - create an index `bash create-index.sh`
        - load bulk to that index `bash load-bulk.sh`
        - to query
            - use curl commands 
                - lucene syntax: `curl -XGET "http://34.90.132.81:9200/call-records/_search?q=hedef_numara:5529991111&pretty"`, or
                - ..
            - create _index pattern_ manually for Kibana UI

    - Ingestion
        - [x] Ingestion w/ Kibana UI
            - Just upload the file, check mappings etc. Not scalable.    
        - [ ] ..
    - [ ] Pipeline w/ Logstash
        - ..
    - [ ] Pipeline w/ Client Libraries
        - ..


