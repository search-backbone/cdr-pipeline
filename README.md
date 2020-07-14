# elasticsearch-sandbox

Importing *.csv to elasticsearch

- [x] Preparations
    - `git clone https://github.com/search-backbone/cdr-pipeline.git` to get files on COS instance
        - to install ELK `bash install-elk-stack.sh` inside COS instance
- Scenarios
    - [ ] One record
    - [x] Bulk => Use **1.0.0-BULK-LOAD** tag
    - [x] Ingestion w/ Kibana UI => Just upload the file, check mappings etc.    
    - [x] Pipeline w/ Logstash
        - Run `bash install-elk-stack.sh`, to install dockers, index creations and pipelines
    - [ ] Pipeline w/ Client Libraries
        - ..


