#!/bin/bash

fileid="1gljMckWjZ_ovGb_qRwEjC33sSTIPMUgJBvHDy-Z3Cuw"

basedir=$(git rev-parse --show-toplevel)

#https://stackoverflow.com/a/48515341/263449
$( echo "$values" | jq -r 'keys[] as $k | "export \($k)=\(.[$k])"' $basedir/_secrets.json)

echo $google_api_key

curl -L -o _converted_bibliography.docx \
	"https://www.googleapis.com/drive/v3/files/${fileid}/export?mimeType=application/vnd.openxmlformats-officedocument.wordprocessingml.document&key=${google_api_key}" \
	--header 'Accept: application/json' \
  	--compressed


