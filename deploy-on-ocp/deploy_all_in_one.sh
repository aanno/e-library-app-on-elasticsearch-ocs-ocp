#!/bin/bash
OC_PROJECT="e-library"

# this must be done as Administrator
oc create -f 1_create_ns_ocs_pvc.yaml -p OC_PROJECT=${OC_PROJECT}

# this can be done as developer
oc create -f 2_deploy_elasticsearch.yaml -p OC_PROJECT=${OC_PROJECT}
oc create -f 3_deploy_backend_api.yaml -p OC_PROJECT=${OC_PROJECT}
echo "env = {BACKEND_URL: 'http://$(oc get route -n e-library -o=jsonpath="{.items[0]['spec.host']}")'}" > env.js
oc create configmap -n e-library env.js --from-file=env.js
oc create -f 4_deploy_frontend_app.yaml -p OC_PROJECT=${OC_PROJECT}

echo "Ingesting dataset (100 classic novels) on to Elasticsearch ..... "
sleep 10

kubectl exec -it e-library-backend-api  -n e-library -- curl -X POST http://localhost:3000/load_data
oc get route frontend -n e-library

