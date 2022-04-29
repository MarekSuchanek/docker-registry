#/bin/bash
set -e

echo "Checking current data/ size"
du -sh data

echo "----------------------------------"

echo "Running garbage collection"
docker exec -it -u root registry-registry-1 bin/registry garbage-collect --delete-untagged /etc/docker/registry/config.yml

echo "----------------------------------"

echo "Checking current data/ size"
du -sh data
