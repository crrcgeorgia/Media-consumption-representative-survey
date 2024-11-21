* Encoding: UTF-8.
* Encoding: .
GET
  FILE='data.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

WEIGHT BY indwt.

MISSING VALUES in q1 to q59 (-7, -9, -3).

CROSSTABS
  /TABLES=sex agegroup settype ethn edu_level empl_stat hhincome BY q1 to q5_10 q6_1 to q9_11 q10_1 to q10_11 q11_1 to q11_10 q12_1 to q12_10 
  /FORMAT=AVALUE TABLES
  /CELLS=ROW
  /COUNT ROUND CELL.


CROSSTABS
  /TABLES=sex agegroup settype ethn edu_level empl_stat hhincome BY q13 q14 q15 to q23_14 q23_15 to q25_6 q26_1 to q26_16 
  /FORMAT=AVALUE TABLES
  /CELLS=ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=sex agegroup settype ethn edu_level empl_stat hhincome BY q26_17 to q31_14  q32_1 to q34_11 q35_1 to q39_10 q40_1 to q43_11  
  /FORMAT=AVALUE TABLES
  /CELLS=ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=sex agegroup settype ethn edu_level empl_stat hhincome BY q44 to q46_9 q47_1 to q47_media_spec q48_1 to q59
  /FORMAT=AVALUE TABLES
  /CELLS=ROW
  /COUNT ROUND CELL.

