@echo off

set USER=neo4j
set PASSWORD=myneo4jPwd


echo "Deleting withdrawals ..."

docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "DROP INDEX ON :withdrawal(time)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (n:withdrawal) DETACH DELETE (n)"


echo "Importing ... withdrawals[id,time,atm,debit_card,amount]"

python bulk_withdrawals.py

docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "CREATE INDEX ON :withdrawal(time)"


echo "Done"