curl -X PUT "localhost:9200/call_records?pretty" \
     -H 'Content-Type: application/json' \
     -d'
{
    "settings" : {
        "number_of_shards" : 1
    },
    "mappings" : {
        "properties" : {
            "@timestamp": {
                "type": "date"
            },
            "baz_istasyonu": {
                "type": "text"
            },
            "gonderme_miktari": {
                "type": "long"
            },
            "hedef_numara": {
                "type": "keyword"
            },
            "hedef_numara_adres": {
                "type": "text"
            },
            "hedef_numara_dogum": {
                "type": "keyword"
            },
            "hedef_numara_ebevyn": {
                "type": "keyword"
            },
            "hedef_numara_il": {
                "type": "keyword"
            },
            "hedef_numara_isim": {
                "type": "text"
            },
            "imei": {
                "type": "long"
            },
            "indirme_miktari": {
                "type": "long"
            },
            "kaynak_ip": {
                "type": "ip"
            },
            "numara": {
                "type": "long"
            },
            "sure": {
                "type": "keyword"
            },
            "tarih": {
                "type": "date",
                "format": "dd.MM.yyyy HH:mm:ss"
            },
            "tip": {
                "type": "keyword"
            }
        }
    }
}
'