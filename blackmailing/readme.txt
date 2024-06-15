There are two sets of files:
- BM1a and BM1b smaller
- BM2a and BM2b bigger
Each folder of the two pairs can be used as training set, the other as test set.

Folders contain:
1 - nodelistsource.csv list of events = nodes of the event graph. Columns are:
col 0 event ID
col 1 event type ('phonecall','emaillog','withdrawal','accountmove','deposit')
col 2 target flag (0=no target, 3=target)
col 3 timestamp
col 4 event type (repeated)
col 5, 6: for phonecalls and emails = caller/sender, called/receiver agents
          for withdrawals, account moves and deposits = amount, operator
2 - edgelistsource.csv list of edges. Columns are:
col 0 ID of the first node
col 1 ID of the second node
col 3 edge type
col 4 weight = 1 / (time difference of the involved nodes)

Edge types are:
aa, ad, ae1, ae2, ap1, ap2, aw, da, dd, de1, de2, dp1, dp2, dw, ea1, ea2, ed1, ed2, ee11, ee12, ee21, ee22, ep11, ep12, 
ep21, ep22, ew1, ew2, pa1, pa2, pd1, pd2, pe11, pe12, pe21, pe22, pp11, pp12, pp21, pp22, pw1, pw2, wa, wd, we1, we2, 
wp1, wp2, ww 

where letters refer to the first letter of the involved nodes types and numbers to the involved operator, for
node types requiring 2 operators. For instance:
dd links 2 deposits by the same operator (without number as a deposit is made by just an operator)
ep11 links an email to a phone call with email sender = phone call caller
