# loads the basic data into the neo4j database, if cypher load cannot be used
import csv
from neo4j import GraphDatabase
us_pwd = ("neo4j","myneo4jPwd") # dell
uri = "neo4j://localhost:7687"
source=open("co_01_withdrawals.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:withdrawal {id: $id, time: $calltime, atm: $atm, debit_card: $dbtc, \
                    amount: $amount, criminal: true})", 
                    id=row[0], calltime=int(row[1]), atm=row[2], dbtc=row[3], amount=int(row[4]))
driver.close()
source.close()
print("Withdrawals 1 loaded into the database")
source=open("co_02_withdrawals.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:withdrawal {id: $id, time: $calltime, atm: $atm, debit_card: $dbtc, \
                    amount: $amount, criminal: true})", 
                    id=row[0], calltime=int(row[1]), atm=row[2], dbtc=row[3], amount=int(row[4]))
driver.close()
source.close()
print("Withdrawals 2 loaded into the database")
source=open("co_03_withdrawals.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:withdrawal {id: $id, time: $calltime, atm: $atm, debit_card: $dbtc, \
                    amount: $amount, criminal: true})", 
                    id=row[0], calltime=int(row[1]), atm=row[2], dbtc=row[3], amount=int(row[4]))
driver.close()
source.close()
print("Withdrawals 3 loaded into the database")
source=open("co_04_withdrawals.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:withdrawal {id: $id, time: $calltime, atm: $atm, debit_card: $dbtc, \
                    amount: $amount, criminal: true})", 
                    id=row[0], calltime=int(row[1]), atm=row[2], dbtc=row[3], amount=int(row[4]))
driver.close()
source.close()
print("Withdrawals 4 loaded into the database")
source=open("co_05_withdrawals.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:withdrawal {id: $id, time: $calltime, atm: $atm, debit_card: $dbtc, \
                    amount: $amount, criminal: true})", 
                    id=row[0], calltime=int(row[1]), atm=row[2], dbtc=row[3], amount=int(row[4]))
driver.close()
source.close()
print("Withdrawals 5 loaded into the database")
source=open("users_01_withdrawals.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:withdrawal {id: $id, time: $calltime, atm: $atm, debit_card: $dbtc, \
                    amount: $amount})", 
                    id=row[0], calltime=int(row[1]), atm=row[2], dbtc=row[3], amount=int(row[4]))
driver.close()
source.close()
print("User Withdrawals 1 loaded into the database")
source=open("users_02_withdrawals.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:withdrawal {id: $id, time: $calltime, atm: $atm, debit_card: $dbtc, \
                    amount: $amount})", 
                    id=row[0], calltime=int(row[1]), atm=row[2], dbtc=row[3], amount=int(row[4]))
driver.close()
source.close()
print("User Withdrawals 2 loaded into the database")
source=open("users_03_withdrawals.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:withdrawal {id: $id, time: $calltime, atm: $atm, debit_card: $dbtc, \
                    amount: $amount})", 
                    id=row[0], calltime=int(row[1]), atm=row[2], dbtc=row[3], amount=int(row[4]))
driver.close()
source.close()
print("User Withdrawals 3 loaded into the database")
source=open("users_04_withdrawals.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:withdrawal {id: $id, time: $calltime, atm: $atm, debit_card: $dbtc, \
                    amount: $amount})", 
                    id=row[0], calltime=int(row[1]), atm=row[2], dbtc=row[3], amount=int(row[4]))
driver.close()
source.close()
print("User Withdrawals 4 loaded into the database")
source=open("users_05_withdrawals.csv","r")
reader = csv.reader(source)
next(reader) # skip the header
driver = GraphDatabase.driver(uri, auth=us_pwd)
with driver.session() as session:
    for row in reader:
        session.run("CREATE (a:withdrawal {id: $id, time: $calltime, atm: $atm, debit_card: $dbtc, \
                    amount: $amount})", 
                    id=row[0], calltime=int(row[1]), atm=row[2], dbtc=row[3], amount=int(row[4]))
driver.close()
source.close()
print("User Withdrawals 5 loaded into the database")
