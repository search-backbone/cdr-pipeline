# elasticsearch-sandbox

Importing *.csv to elasticsearch

- [x] Preparations
    - to create COS instance on GCP `bash create-instance.sh`
        - to install ELK `bash install-elk-stack.sh`

- [ ] Conversions
    - xslx to csv
    - csv to json

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


