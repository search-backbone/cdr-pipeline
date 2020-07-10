# elasticsearch-sandbox

Importing *.csv to elasticsearch

- [x] Preparations
    - to create COS instance on GCP `bash create-instance.sh`
        - to install ELK `bash install-elk-stack.sh`

- [x] Conversions
    - xslx to csv
    - csv to json, then bulk-elastic-json
        - `npm i -g csvtojson`, then
        - `csvtojson data/call.csv --delimiter=";" > data/call_bulk.json`, then
        - Edit file and remove [ and ] and ,

- Scenarios
    - [ ] One record
    - [x] Bulk 
        - (json to bulk-elastic-json) format change must.
        - create an index `bash create-index.sh`
        - load bulk to that index `bash load-bulk.sh`
        - to query
            - use curl commands, or
            - create _index pattern_ manually for Kibana UI
    - [ ] Ingestion
        - ..


