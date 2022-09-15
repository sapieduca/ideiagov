#!/bin/sh

DATASETS=`cat metadata.json | jq 'keys[]' | tr -d "\"" | tr "\n" " "`

cmd_and_log () {
	echo "[`date -u`][get_all.sh] $ $1"
	bash -c "$1"
}

rm -rf datasets/

for DATASET in $DATASETS; do
	echo "[`date -u`][get_all.sh] Dataset $DATASET started extraction!"
	cmd_and_log "rm -rf datasets/$DATASET"
	cmd_and_log "mkdir -p datasets/$DATASET"

	DATASET_BASE_URIS=`cat metadata.json | jq ".$DATASET" | tr -d "\""`
	bash get_dataset.sh $DATASET "$DATASET_BASE_URIS"
done
