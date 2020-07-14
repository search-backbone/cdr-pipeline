# elasticsearch-sandbox

Importing *.csv to elasticsearch

- [x] Preparations
    - `git clone https://github.com/search-backbone/cdr-pipeline.git` to get files on COS instance
        - to install ELK `bash install-elk-stack.sh` inside COS instance

- [x] Conversions
    - xslx to csv
    - csv to json, then bulk-elastic-json format
        - `npm i -g csvtojson`, then
        - `csvtojson data/call.csv --delimiter=";" > data/call_2.json`, then Edit file and remove _[_, _]_ and _,_ chars, then
        - `cat data/call_2.json | jq -c '. | {"index": {}}, .' > data/call_bulk.json`

- Scenarios
    - [ ] One record
    - [x] Bulk 
        - json to bulk-elastic-json is must. Uses `data/call_bulk.json` file
        - load bulk to the index `bash load-bulk.sh`

    - Ingestion
        - [x] Ingestion w/ Kibana UI
            - Just upload the file, check mappings etc. Not scalable.    
        - [ ] ..
    - [ ] Pipeline w/ Logstash
        - ..
    - [ ] Pipeline w/ Client Libraries
        - ..


