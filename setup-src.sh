docker run -d --name temp ns3:3.36.1
docker cp temp:/workspace/ns-3-allinone/ns-3.36.1/src .
docker stop temp
docker rm temp
echo "src directory should now be available"