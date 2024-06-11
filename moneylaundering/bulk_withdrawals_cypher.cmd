@echo off

set USER=neo4j
set PASSWORD=password


echo "Deleting withdrawals ..."

docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "DROP INDEX ON :withdrawal(time)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (n:withdrawal) DETACH DELETE (n)"


echo "Importing ... withdrawals[id,time,atm,debit_card,amount]"

docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/co_01_withdrawals.csv\" AS rec CREATE (n:withdrawal {id:rec['id'],time:toInteger(rec['time']),atm:rec['atm'],debit_card:rec['debit_card'],amount:toInteger(rec['amount']),criminal:true}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/co_02_withdrawals.csv\" AS rec CREATE (n:withdrawal {id:rec['id'],time:toInteger(rec['time']),atm:rec['atm'],debit_card:rec['debit_card'],amount:toInteger(rec['amount']),criminal:true}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/co_03_withdrawals.csv\" AS rec CREATE (n:withdrawal {id:rec['id'],time:toInteger(rec['time']),atm:rec['atm'],debit_card:rec['debit_card'],amount:toInteger(rec['amount']),criminal:true}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/co_04_withdrawals.csv\" AS rec CREATE (n:withdrawal {id:rec['id'],time:toInteger(rec['time']),atm:rec['atm'],debit_card:rec['debit_card'],amount:toInteger(rec['amount']),criminal:true}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/co_05_withdrawals.csv\" AS rec CREATE (n:withdrawal {id:rec['id'],time:toInteger(rec['time']),atm:rec['atm'],debit_card:rec['debit_card'],amount:toInteger(rec['amount']),criminal:true}) RETURN count(n)"


docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/users_01_withdrawals.csv\" AS rec CREATE (n:withdrawal {id:rec['id'],time:toInteger(rec['time']),atm:rec['atm'],debit_card:rec['debit_card'],amount:toInteger(rec['amount'])}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/users_02_withdrawals.csv\" AS rec CREATE (n:withdrawal {id:rec['id'],time:toInteger(rec['time']),atm:rec['atm'],debit_card:rec['debit_card'],amount:toInteger(rec['amount'])}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/users_03_withdrawals.csv\" AS rec CREATE (n:withdrawal {id:rec['id'],time:toInteger(rec['time']),atm:rec['atm'],debit_card:rec['debit_card'],amount:toInteger(rec['amount'])}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/users_04_withdrawals.csv\" AS rec CREATE (n:withdrawal {id:rec['id'],time:toInteger(rec['time']),atm:rec['atm'],debit_card:rec['debit_card'],amount:toInteger(rec['amount'])}) RETURN count(n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/generated/users_05_withdrawals.csv\" AS rec CREATE (n:withdrawal {id:rec['id'],time:toInteger(rec['time']),atm:rec['atm'],debit_card:rec['debit_card'],amount:toInteger(rec['amount'])}) RETURN count(n)"


docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "CREATE INDEX ON :withdrawal(time)"


echo "Done"