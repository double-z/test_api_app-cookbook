#payload='\"tag_name\":\"0.0.10\"'
    #-H "Authorization: token 23d05f65bd694c2ab64f23d5ca581d6116dd6569" \
payload=$(printf '{"tag_name": "0.0.31"}')
echo $payload
#curl -u 4ce1fe81d3eb03a258e4dcb453ac65fc12f7b0ce:x-oauth-basic https://api.github.com/user
curl -s -S -X POST -A "create-release" -H "Accept: application/vnd.github.v3+json" -H "Authorization: token 4ce1fe81d3eb03a258e4dcb453ac65fc12f7b0ce" -H "Content-Type: application/json" -d "$payload" https://api.github.com/repos/double-z/test_api_app-cookbook/releases 
#-A create-release -H Accept: application/vnd.github.v3+json -H Authorization: token 4ce1fe81d3eb03a258e4dcb453ac65fc12f7b0ce -H Content-Type: application/json -d $payload
