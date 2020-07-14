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
    - [x] Bulk => Use **1.0.0-BULK-LOAD** tag
    - Ingestion
        - [x] Ingestion w/ Kibana UI
            - Just upload the file, check mappings etc. Not scalable.    
        - [ ] ..
    - [x] Pipeline w/ Logstash
        - Run `bash install-elk-stack.sh`, to install dockers, index creations and pipelines
    - [ ] Pipeline w/ Client Libraries
        - ..


