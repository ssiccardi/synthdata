@echo off

set USER=neo4j
set PASSWORD=myneo4jPwd

echo "Deleting relations ..."

docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (from)-[r]->(t) DELETE r"


echo "Creating relations ..."

echo "debit_card -> bank_office"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (dc:debit_card),(bo:bank_office) WHERE dc.bank_office = bo.id CREATE (dc)-[r:EMITTED_BY]->(bo) RETURN count(r)"

echo "debit_card -> phone"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (dc:debit_card),(ph:phone) WHERE dc.phone_number = ph.id CREATE (dc)-[r:OWNER_OF]->(ph) RETURN count(r)"

echo "bank_office -> phone"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (bo:bank_office),(ph:phone) WHERE bo.phone_number = ph.id CREATE (bo)-[r:HAS_NUMBER]->(ph) RETURN count(r)"

echo "withdrawal -> atm"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (wd:withdrawal),(a:atm) WHERE wd.atm = a.id CREATE (wd)-[r:FROM_ATM]->(a) RETURN count(r)"

echo "withdrawal -> debit_card"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (wd:withdrawal),(dc:debit_card) WHERE wd.debit_card = dc.id CREATE (wd)-[r:USING]->(dc) RETURN count(r)"

echo "phone_call -[from]-> cell_tower"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (pc:phone_call),(ct:cell_tower) WHERE pc.from_cell_tower = ct.id CREATE (ct)-[r:FROM_TOWER]->(pc) RETURN count(r)"

echo "phone_call -[to]-> cell_tower"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (pc:phone_call),(ct:cell_tower) WHERE pc.to_cell_tower = ct.id CREATE (pc)-[r:TO_TOWER]->(ct) RETURN count(r)"

echo "phone_call -[from]-> phone"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (pc:phone_call),(ph:phone) WHERE pc.from_number = ph.id CREATE (ph)-[r:FROM_NUMBER]->(pc) RETURN count(r)"

echo "phone_call -[to]-> phone"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "MATCH (pc:phone_call),(ph:phone) WHERE pc.to_number = ph.id CREATE (pc)-[r:TO_NUMBER]->(ph) RETURN count(r)"

echo "atm -> cell_tower"
docker exec --interactive --tty testneo4j cypher-shell -a bolt://localhost:7687 -u %USER% -p %PASSWORD% --non-interactive ^
    "LOAD CSV WITH HEADERS FROM \"file:///MinisteroGiustizia/atm_cell_tower_rels.csv\" AS rec MATCH (a:atm),(ct:cell_tower) WHERE a.id=rec['atm'] AND ct.id=rec['cell_tower'] CREATE (a)-[r:NEAR_TO]->(ct) RETURN count(r)"

echo "Done"
