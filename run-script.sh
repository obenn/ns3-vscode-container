SCRIPT_NAME=$1
docker run  \
    -it \
    --volume $PWD/scratch:/workspace/ns-3-allinone/ns-3.36.1/scratch \
    ns3:3.36.1 \
    ./ns3 run \
    $SCRIPT_NAME