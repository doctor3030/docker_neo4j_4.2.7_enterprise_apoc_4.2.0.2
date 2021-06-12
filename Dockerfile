# syntax=docker/dockerfile:1

FROM neo4j:4.2.7-enterprise
ENV NEO4J_ACCEPT_LICENSE_AGREEMENT=yes
ENV APOC_VERSION=4.2.0.2
ENV APOC_URI=https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/${APOC_VERSION}/apoc-${APOC_VERSION}-all.jar
ADD --chown=neo4j:neo4j ${APOC_URI} plugins

ENV NEO4J_dbms_directories_data="/data"
ENV NEO4J_dbms_directories_logs="/logs"
ENV NEO4J_dbms_directories_import="/import"

ENV NEO4J_dbms_security_procedures_unrestricted="jwt.security.*,apoc.*"
ENV NEO4J_dbms_security_procedures_allowlist="apoc.coll.*,apoc.load.*,gds.*,apoc.*"

CMD ["neo4j"]
