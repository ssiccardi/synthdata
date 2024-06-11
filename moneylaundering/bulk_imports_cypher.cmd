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
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///../../../atms.csv\" AS rec CREATE (n:atm {id:rec['id'],rg:rec['rg'],longitude:toFloat(rec['lon']),latitude:toFloat(rec['lat'])}) RETURN count(n)"

echo "Importing ... bank_offices[id,bank,office,lon,lat,phone_number,send_sms]"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///bank_offices.csv\" AS rec CREATE (n:bank_office {id:rec['id'],bank:rec['bank'],office:rec['office'],longitude:toFloat(rec['lon']),latitude:toFloat(rec['lat']), phone_number:rec['phone_number'],send_sms:toBoolean(rec['send_sms'])}) RETURN count(n)"

echo "Importing ... debit_cards[id,bank_office,phone_number]"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///debit_cards.csv\" AS rec CREATE (n:debit_card {id:rec['id'],bank_office:rec['bank_office'],phone_number:rec['phone_number']}) RETURN count(n)"

echo "Importing ... phones[id,imei,imsi,iccid]"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///phones.csv\" AS rec CREATE (n:phone {id:rec['id'],imei:rec['imei'],imsi:rec['imsi'],iccid:rec['iccid']}) RETURN count(n)"

echo "Importing ... cell_towers[id,operator,rat,lon,lat]"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///towers_tim_vodafone.csv\" AS rec CREATE (n:cell_tower {id:rec['id'],operator:rec['operator'],rat:rec['rat'],longitude:toFloat(rec['lon']),latitude:toFloat(rec['lat'])}) RETURN count(n)"


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
