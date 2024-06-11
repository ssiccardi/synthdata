@echo off

set USER=neo4j
set PASSWORD=myneo4jPwd


echo "Deleting phone_calls ..."

docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "DROP INDEX ON :phone_call(time)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (n:phone_call) DETACH DELETE (n)"


echo "Importing ... phone_calls[id,calltime,from_cell_tower,from_number,to_cell_tower,to_number,call_length]"

python bulk_phone_calls.py


docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "CREATE INDEX ON :phone_call(calltime)"

echo "Done"