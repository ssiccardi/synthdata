@echo off

set USER=neo4j
set PASSWORD=myneo4jPwd


echo "Deleting objects ..."

docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "DROP INDEX ON :atm(id)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "DROP INDEX ON :bank_office(id)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "DROP INDEX ON :cell_tower(id)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "DROP INDEX ON :debit_card(id)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "DROP INDEX ON :phone(id)"


docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (n:atm) DETACH DELETE (n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (n:bank_office) DETACH DELETE (n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (n:debit_card) DETACH DELETE (n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (n:phone) DETACH DELETE (n)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (n:cell_tower) DETACH DELETE (n)"


echo "Importing ... atms[id,rg,lon,lat]"
echo "Importing ... bank_offices[id,bank,office,lon,lat,phone_number,send_sms]"
echo "Importing ... debit_cards[id,bank_office,phone_number]"
echo "Importing ... phones[id,imei,imsi,iccid]"
echo "Importing ... cell_towers[id,operator,rat,lon,lat]"
python bulk_import.py

echo "Creating indices ..."
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "CREATE INDEX ON :atm(id)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "CREATE INDEX ON :bank_office(id)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "CREATE INDEX ON :cell_tower(id)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "CREATE INDEX ON :debit_card(id)"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "CREATE INDEX ON :phone(id)"


echo "Done"
