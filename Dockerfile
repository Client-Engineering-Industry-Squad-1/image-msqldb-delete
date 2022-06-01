FROM mcr.microsoft.com/mssql-tools:latest

RUN useradd -u 1010 sqluser

COPY drop_tables_scc_db_b2bidb.sql .

COPY deleteDB.sh .

RUN chmod a+x ./deleteDB.sh 

RUN chown -R sqluser:sqluser /opt
RUN chown sqluser:sqluser deleteDB.sh
RUN chown sqluser:sqluser drop_tables_scc_db_b2bidb.sql

USER 1010

ENV PATH="/opt/mssql-tools/bin:${PATH}"