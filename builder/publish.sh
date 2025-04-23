npm install && \
    docker build -t azure-kusto-data -f builder/Dockerfile.publish . && \
    docker rm -f publishKusto && \
    docker create --name publishKusto azure-kusto-data && \
    docker cp publishKusto:/usr/app .

cd app && \
    npm publish

cd .. && \
    rm -rf app