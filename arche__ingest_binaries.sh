#/bin/bash

echo "ingest binaries for ${TOPCOLID} into ${ARCHE}"
docker run --rm \
  -v ${PWD}/img:/data \
  --network="host" \
  --entrypoint arche-import-binary \
  acdhch/arche-ingest \
  /data ${TOPCOLID}/ ${ARCHE} ${ARCHE_USER} ${ARCHE_PASSWORD} --skip not_exist