# loads the basic data into the neo4j database, if cypher load cannot be used
import csv
from neo4j import GraphDatabase
us_pwd = ("neo4j","myneo4jPwd") # dell
uri = "neo4j://localhost:7687"
source=open("co_01_phone_calls.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:phone_call {id: $id, calltime: $calltime, from_cell_tower: $ftc, from_number: $fnb, \
                    to_cell_tower: $ttc, to_number: $tnb, call_length: $dur, criminal: true})", 
                    id=row[0], calltime=int(row[1]), ftc=row[2], fnb=row[3], ttc=row[4], tnb=row[5], dur=int(row[6]))
driver.close()
source.close()
print("Phone calls 1 loaded into the database")
source=open("co_02_phone_calls.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:phone_call {id: $id, calltime: $calltime, from_cell_tower: $ftc, from_number: $fnb, \
                    to_cell_tower: $ttc, to_number: $tnb, call_length: $dur, criminal: true})",
                    id=row[0], calltime=int(row[1]), ftc=row[2], fnb=row[3], ttc=row[4], tnb=row[5], dur=int(row[6]))
driver.close()
source.close()
print("Phone calls 2 loaded into the database")
source=open("co_03_phone_calls.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:phone_call {id: $id, calltime: $calltime, from_cell_tower: $ftc, from_number: $fnb, \
                    to_cell_tower: $ttc, to_number: $tnb, call_length: $dur, criminal: true})",
                    id=row[0], calltime=int(row[1]), ftc=row[2], fnb=row[3], ttc=row[4], tnb=row[5], dur=int(row[6]))
driver.close()
source.close()
print("Phone calls 3 loaded into the database")
source=open("co_04_phone_calls.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:phone_call {id: $id, calltime: $calltime, from_cell_tower: $ftc, from_number: $fnb, \
                    to_cell_tower: $ttc, to_number: $tnb, call_length: $dur, criminal: true})",
                    id=row[0], calltime=int(row[1]), ftc=row[2], fnb=row[3], ttc=row[4], tnb=row[5], dur=int(row[6]))
driver.close()
source.close()
print("Phone calls 4 loaded into the database")
source=open("co_05_phone_calls.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:phone_call {id: $id, calltime: $calltime, from_cell_tower: $ftc, from_number: $fnb, \
                    to_cell_tower: $ttc, to_number: $tnb, call_length: $dur, criminal: true})",
                    id=row[0], calltime=int(row[1]), ftc=row[2], fnb=row[3], ttc=row[4], tnb=row[5], dur=int(row[6]))
driver.close()
source.close()
print("Phone calls 5 loaded into the database")

source=open("users_01_phone_calls.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:phone_call {id: $id, calltime: $calltime, from_cell_tower: $ftc, from_number: $fnb, \
                    to_cell_tower: $ttc, to_number: $tnb, call_length: $dur})",
                    id=row[0], calltime=int(row[1]), ftc=row[2], fnb=row[3], ttc=row[4], tnb=row[5], dur=int(row[6]))
driver.close()
source.close()
print("Phone calls users 1 loaded into the database")
source=open("users_02_phone_calls.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:phone_call {id: $id, calltime: $calltime, from_cell_tower: $ftc, from_number: $fnb, \
                    to_cell_tower: $ttc, to_number: $tnb, call_length: $dur})",
                    id=row[0], calltime=int(row[1]), ftc=row[2], fnb=row[3], ttc=row[4], tnb=row[5], dur=int(row[6]))
driver.close()
source.close()
print("Phone calls users 2 loaded into the database")
source=open("users_03_phone_calls.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:phone_call {id: $id, calltime: $calltime, from_cell_tower: $ftc, from_number: $fnb, \
                    to_cell_tower: $ttc, to_number: $tnb, call_length: $dur})",
                    id=row[0], calltime=int(row[1]), ftc=row[2], fnb=row[3], ttc=row[4], tnb=row[5], dur=int(row[6]))
driver.close()
source.close()
print("Phone calls users 3 loaded into the database")
source=open("users_04_phone_calls.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:phone_call {id: $id, calltime: $calltime, from_cell_tower: $ftc, from_number: $fnb, \
                    to_cell_tower: $ttc, to_number: $tnb, call_length: $dur})",
                    id=row[0], calltime=int(row[1]), ftc=row[2], fnb=row[3], ttc=row[4], tnb=row[5], dur=int(row[6]))
driver.close()
source.close()
print("Phone calls users 4 loaded into the database")
source=open("users_05_phone_calls.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:phone_call {id: $id, calltime: $calltime, from_cell_tower: $ftc, from_number: $fnb, \
                    to_cell_tower: $ttc, to_number: $tnb, call_length: $dur})",
                    id=row[0], calltime=int(row[1]), ftc=row[2], fnb=row[3], ttc=row[4], tnb=row[5], dur=int(row[6]))
driver.close()
source.close()
print("Phone calls users 5 loaded into the database")
