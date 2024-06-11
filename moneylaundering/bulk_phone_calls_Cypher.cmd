@echo off

set USER=neo4j
set PASSWORD=password


echo "Deleting phone_calls ..."

docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "DROP INDEX ON :phone_call(time)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (n:phone_call) DETACH DELETE (n)"


echo "Importing ... phone_calls[id,time,from_cell_tower,from_number,to_cell_tower,to_number,call_length]"

docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/co_01_phone_calls.csv\" AS rec CREATE (n:phone_call {id:rec['id'],time:toInteger(rec['time']),from_cell_tower:rec['from_cell_tower'],from_number:rec['from_number'],to_cell_tower:rec['to_cell_tower'],to_number:rec['to_number'],call_length:toInteger(rec['call_length']),criminal:true}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/co_02_phone_calls.csv\" AS rec CREATE (n:phone_call {id:rec['id'],time:toInteger(rec['time']),from_cell_tower:rec['from_cell_tower'],from_number:rec['from_number'],to_cell_tower:rec['to_cell_tower'],to_number:rec['to_number'],call_length:toInteger(rec['call_length']),criminal:true}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/co_03_phone_calls.csv\" AS rec CREATE (n:phone_call {id:rec['id'],time:toInteger(rec['time']),from_cell_tower:rec['from_cell_tower'],from_number:rec['from_number'],to_cell_tower:rec['to_cell_tower'],to_number:rec['to_number'],call_length:toInteger(rec['call_length']),criminal:true}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/co_04_phone_calls.csv\" AS rec CREATE (n:phone_call {id:rec['id'],time:toInteger(rec['time']),from_cell_tower:rec['from_cell_tower'],from_number:rec['from_number'],to_cell_tower:rec['to_cell_tower'],to_number:rec['to_number'],call_length:toInteger(rec['call_length']),criminal:true}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/co_05_phone_calls.csv\" AS rec CREATE (n:phone_call {id:rec['id'],time:toInteger(rec['time']),from_cell_tower:rec['from_cell_tower'],from_number:rec['from_number'],to_cell_tower:rec['to_cell_tower'],to_number:rec['to_number'],call_length:toInteger(rec['call_length']),criminal:true}) RETURN count(n)"


docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/users_01_phone_calls.csv\" AS rec CREATE (n:phone_call {id:rec['id'],time:toInteger(rec['time']),from_cell_tower:rec['from_cell_tower'],from_number:rec['from_number'],to_cell_tower:rec['to_cell_tower'],to_number:rec['to_number'],call_length:toInteger(rec['call_length'])}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/users_02_phone_calls.csv\" AS rec CREATE (n:phone_call {id:rec['id'],time:toInteger(rec['time']),from_cell_tower:rec['from_cell_tower'],from_number:rec['from_number'],to_cell_tower:rec['to_cell_tower'],to_number:rec['to_number'],call_length:toInteger(rec['call_length'])}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/users_03_phone_calls.csv\" AS rec CREATE (n:phone_call {id:rec['id'],time:toInteger(rec['time']),from_cell_tower:rec['from_cell_tower'],from_number:rec['from_number'],to_cell_tower:rec['to_cell_tower'],to_number:rec['to_number'],call_length:toInteger(rec['call_length'])}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/users_04_phone_calls.csv\" AS rec CREATE (n:phone_call {id:rec['id'],time:toInteger(rec['time']),from_cell_tower:rec['from_cell_tower'],from_number:rec['from_number'],to_cell_tower:rec['to_cell_tower'],to_number:rec['to_number'],call_length:toInteger(rec['call_length'])}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/users_05_phone_calls.csv\" AS rec CREATE (n:phone_call {id:rec['id'],time:toInteger(rec['time']),from_cell_tower:rec['from_cell_tower'],from_number:rec['from_number'],to_cell_tower:rec['to_cell_tower'],to_number:rec['to_number'],call_length:toInteger(rec['call_length'])}) RETURN count(n)"


docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "CREATE INDEX ON :phone_call(time)"

echo "Done"