#!/bin/sh

DATASET_NAME=$1
DATASETS_BASE_URIS=$2

# Iterate the string variable using for loop
for BASE_URI in $DATASETS_BASE_URIS; do
	echo "[`date -u`][extract_files_uris.py][$DATASET_NAME] Extracting files URIs to download..."
	DATASETS_URIS=`python3 extract_files_uris.py $BASE_URI`
	echo "[`date -u`][extract_files_uris.py][$DATASET_NAME] Extraction done!"
	for URI in $DATASETS_URIS; do
		RESOURCE=`echo $URI | awk -F "/" '{print $NF}'`
		echo "[`date -u`][get_dataset.sh][$DATASET_NAME] Downloading $RESOURCE..."
		rm -f $RESOURCE
		curl -silent $URI \
			-H 'Connection: keep-alive' \
			-H 'Upgrade-Insecure-Requests: 1' \
			-H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36' \
			-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
			-H 'Sec-GPC: 1' \
			-H 'Sec-Fetch-Site: same-origin' \
			-H 'Sec-Fetch-Mode: navigate' \
			-H 'Sec-Fetch-User: ?1' \
			-H 'Sec-Fetch-Dest: document' \
			-H 'Accept-Language: pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7' \
			-H 'Cookie: has_js=1' \
			--compressed -o datasets/$DATASET_NAME/$RESOURCE
		echo "[`date -u`][get_dataset.sh][$DATASET_NAME] $RESOURCE downloaded!"
	done
done
