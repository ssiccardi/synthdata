To create the standard graph with entities and events:

1) Import basic files with entities: 
atms.csv, bank_offices.csv, debit_cards.csv, phones.csv, towers_tim_vodafone.csv

2) Import phone calls

3) Import withdrawals

4) Import relations

There are examples of import scripts using cypher-shell only (if you have the correct settings for the import 
folder of neo4j) and cypher-shell + python import scripts (they need the neo4j python driver).
Examples must be checked and probably modified for you operating system, neo4j credentials etc.

Examples of queries:

MATCH (node) RETURN labels(node) AS type,count(*)
Expected result:
[atm],996
[bank_office],969
[debit_card],10000
[phone],30000
[cell_tower],2104
[phone_call],13294
[withdrawal],6119

match (d:debit_card)-[]-(n:withdrawal)-[]-(a:atm) return n,a,d limit 50

match (w:withdrawal) return avg(w.amount) as avg_amount
Expected: 182.44811243667291

match (w:withdrawal {amount: 250})-[]-(a:atm) return a,w limit 200

MATCH (dc:debit_card)--(w:withdrawal)
where w.amount=250 RETURN dc.id, count(w) AS num_withdrawals
ORDER BY num_withdrawals DESC

Suspect withdrawal:
MATCH
 q1=(w:withdrawal)-[:FROM_ATM]-(a:atm)-[:NEAR_TO]-(wct:cell_tower),
 q2=(w:withdrawal)-[:USING]-(dc:debit_card)-[:OWNER_OF]-(dcp:phone),
 q3=(dc)-[:EMITTED_BY]-(bo:bank_office)-[:HAS_NUMBER]-(bop:phone),
 q4=(bop)-[:FROM_NUMBER]-(pc:phone_call)-[:TO_NUMBER]-(dcp),
 q5=(pc)-[:TO_TOWER]-(pcct:cell_tower)
WHERE pc.calltime > w.time
 AND w.amount=250
 AND (pc.calltime - w.time) < 60
 AND wct.id <> pcct.id
RETURN q1,q2,q3,q4,q5
LIMIT 1

ATMs with many max amount withdrawals in the same time period:
match (w:withdrawal {amount: 250})-[]-(a:atm) return a.id, count(w) as numb_withdr, 
ceil(w.time/10000) as period order by numb_withdr DESC
-> expected first ATM=36D5247F-B5FD-74B0-E050-A8C08F264F36, period=29


Bunch of criminal withdrawals and related phone calls:
MATCH
 q1=(w:withdrawal)-[:FROM_ATM]-(a:atm {id: "36D5247F-B5FD-74B0-E050-A8C08F264F36"})-[:NEAR_TO]-(wct:cell_tower),
 q2=(w:withdrawal)-[:USING]-(dc:debit_card)-[:OWNER_OF]-(dcp:phone),
 q3=(dc)-[:EMITTED_BY]-(bo:bank_office)-[:HAS_NUMBER]-(bop:phone),
 q4=(bop)-[:FROM_NUMBER]-(pc:phone_call)-[:TO_NUMBER]-(dcp),
 q5=(pc)-[:TO_TOWER]-(pcct:cell_tower)
WHERE pc.calltime > w.time
 AND w.amount=250
 AND (pc.calltime - w.time) < 60
 AND wct.id <> pcct.id
 AND ceil(w.time/10000) = 29
RETURN q1,q2,q3,q4,q5



