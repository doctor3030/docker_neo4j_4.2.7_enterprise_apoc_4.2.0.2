# syntax=docker/dockerfile:1

FROM 4.2.7-enterprise
ENV NEO4J_ACCEPT_LICENSE_AGREEMENT=yes
ENV APOC_VERSION=4.2.0.2
ENV APOC_URI=https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/${APOC_VERSION}/apoc-${APOC_VERSION}-all.jar
ADD --chown=neo4j:neo4j ${APOC_URI} plugins

CMD ["neo4j"]
