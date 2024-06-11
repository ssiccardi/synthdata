# loads the basic data into the neo4j database, if cypher load cannot be used
import csv
from neo4j import GraphDatabase
us_pwd = ("neo4j","myneo4jPwd") # dell
uri = "neo4j://localhost:7687"
source=open("atm_cell_tower_rels.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("MATCH (a:atm),(ct:cell_tower) WHERE a.id=$idatm AND ct.id=$idcell CREATE (a)-[r:NEAR_TO]->(ct)",
                     idatm=row[1], idcell=row[2])
driver.close()
source.close()
print("Atm - tower relations loaded into the database")
