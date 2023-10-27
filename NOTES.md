# e-library

* https://blog.patricktriest.com/
* https://search.patricktriest.com/
* https://blog.patricktriest.com/text-search-docker-elasticsearch/

## Debugging

* [CORS and curl](https://reqbin.com/req/c-taimahsa/curl-cors-request)
* https://stackoverflow.com/questions/45975135/access-control-origin-header-error-using-axios

### ES server

curl -v -H "Origin: https://example.reqbin.com" -X POST http://10.131.10.63:9200/_search

curl -v -H "Origin: https://example.reqbin.com" -X POST http://elasticsearch:9200/book/_search -d '{ "query": { "match_all": {} } }' -H 'Content-Type: application/json'

curl -v -H "Origin: https://example.reqbin.com" -X POST http://elasticsearch:9200/library/book/_search -d '{ "query": { "match_all": {} } }' -H 'Content-Type: application/json'

* https://mindmajix.com/elasticsearch/curl-syntax-with-examples
* [no mappings in es >=7](https://logz.io/blog/elasticsearch-mapping/)

### backend

curl -v -H "Origin: https://example.reqbin.com" -X POST   http://e-library-backend-api-route-aanno-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com/

curl -g -v -H "Origin: http://e-library-frontend-aanno-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com" -XGET  http://e-library-backend-api-route-aanno-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com/search


curl -G -v -H "Origin: http://e-library-frontend-aanno-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com" http://e-library-backend-api-route-aanno-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com/search -d "term=hello"

Im Browser: http://e-library-backend-api-route-aanno-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com/search?term=hello&offset=0

### frontent 

$ oc expose service e-library-frontend
route.route.openshift.io/e-library-frontend exposed


