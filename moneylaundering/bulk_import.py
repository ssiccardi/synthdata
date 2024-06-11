# loads the basic data into the neo4j database, if cypher load cannot be used
import csv
from neo4j import GraphDatabase
us_pwd = ("neo4j","myneo4jPwd") # dell
uri = "neo4j://localhost:7687"
source=open("atms.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:atm {id: $id, rg: $name, longitude: $lon, latitude: $lat})",
                    id=row[0], name=row[1], lon=float(row[2]), lat=float(row[3]))
driver.close()
source.close()
print("Atms loaded into the database")
source=open("bank_offices.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:bank_office {id: $id, bank: $bank, office: $office, longitude: $lon, latitude: $lat,  \
                    phone_number: $phone, send_sms: $sms})",
                    id=row[0], bank=row[1], office=row[2], lon=float(row[3]), lat=float(row[4]), phone=row[5], sms=(lambda x: True if x == "true" else False)(row[6]))
driver.close()
source.close()
print("Bank offices loaded into the database")
source=open("debit_cards.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:debit_card {id: $id, bank_office: $bank, phone_number: $phone})",
                    id=row[0], bank=row[1], phone=row[2])
driver.close()
source.close()
print("Debit cards loaded into the database")
source=open("phones.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:phone {id: $id, imei: $imei, imsi: $imsi, iccid: $iccid})",
                    id=row[0], imei=row[1], imsi=row[2], iccid=row[3])
driver.close()
source.close()
print("Phones loaded into the database")
source=open("towers_tim_vodafone.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:cell_tower {id: $id, operator: $operator, rat: $rat, longitude: $lon, latitude: $lat})",
                    id=row[0], operator=row[1], rat=row[2], lon=float(row[3]), lat=float(row[4]))
driver.close()
source.close()
print("Towers loaded into the database")
