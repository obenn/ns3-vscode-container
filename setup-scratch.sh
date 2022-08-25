docker run -d --name temp ns3:3.36.1
docker cp temp:/workspace/ns-3-allinone/ns-3.36.1/scratch .
docker stop temp
docker rm temp
echo "scratch directory should now be available"