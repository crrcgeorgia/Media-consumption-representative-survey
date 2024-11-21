* Encoding: UTF-8.
GET 
  FILE='data.sav'.

DATASET NAME DataSet1 WINDOW=FRONT. 
WEIGHT BY indwt. 
EXECUTE.


MISSING VALUES in q1 to q59 (-7, -9, -3).


*nosort

SET TLook=None Small=0.0001 CTemplate='Working Directory\nosort_frequency.sgt' SUMMARY=None THREADS=AUTO TFit=Both DIGITGROUPING=No LEADZERO=No TABLERENDER=light.
FREQUENCIES VARIABLES=q1 to q59
  /FORMAT=NOTABLE
  /BARCHART PERCENT
  /ORDER=ANALYSIS.


*need sort

SET TLook=None Small=0.0001 CTemplate='Working Directory\sort_frequency.sgt' SUMMARY=None THREADS=AUTO TFit=Both DIGITGROUPING=No LEADZERO=No TABLERENDER=light.
FREQUENCIES VARIABLES=q1 q3 q4 q5 q7_1 q7_2 q7_3 q7_4 q7_5 q7_6 q7_7 q7_8 q7_9 q7_10 q7_11 q7_12 q7_oth q8_1 q8_2 q8_3 q8_4 q8_5 q8_6 q8_7 q8_8 q8_9 q8_10 q8_11 q8_12 q8_oth 
  /FORMAT=NOTABLE
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

SET TLook=None Small=0.0001 CTemplate='Working Directory\sort_frequency.sgt' SUMMARY=None THREADS=AUTO TFit=Both DIGITGROUPING=No LEADZERO=No TABLERENDER=light.
FREQUENCIES VARIABLES=q9_1 q9_2 q9_3 q9_4 q9_5 q9_6 q9_7 q9_8 q9_9 q9_10 q9_11 q9_oth q10 q11_1 q11_2 q11_3 q11_4 q11_5 q11_6 q11_7 q11_8 q11_oth q12 q13_1 q13_2 q13_3 q13_4 q13_5 q13_6 q13_7 q13_8 q13_oth 
  /FORMAT=NOTABLE
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

SET TLook=None Small=0.0001 CTemplate='Working Directory\sort_frequency.sgt' SUMMARY=None THREADS=AUTO TFit=Both DIGITGROUPING=No LEADZERO=No TABLERENDER=light.
FREQUENCIES VARIABLES=q15_1 q15_2 q15_3 q15_4 q15_5 q15_6 q15_7 q15_8 q15_9 q15_oth q16_1 q16_2 q16_3 q16_4 q16_5 q16_6 q16_7 q16_8 q16_9 q16_10 q16_11 q16_12 q16_oth q17_1 q17_2 q17_3 q17_4 q17_5 q17_6 q17_7 q17_8 q17_9 q17_oth 
  /FORMAT=NOTABLE
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

SET TLook=None Small=0.0001 CTemplate='Working Directory\sort_frequency.sgt' SUMMARY=None THREADS=AUTO TFit=Both DIGITGROUPING=No LEADZERO=No TABLERENDER=light.
FREQUENCIES VARIABLES=q18 q18_oth q20 q20_oth q21_1 q21_2 q21_3 q21_4 q22_1 q22_2 q22_3 q22_4 q22_5 q22_6 q22_7 q22_8 q22_9 q22_10 q23_1 q23_2 q23_3 q23_4 q23_5 q23_6 q23_7 q23_8 q24_1 q24_2 q24_3 q24_4 q24_5 q24_6 q24_7 q24_oth 
  /FORMAT=NOTABLE
  /BARCHART PERCENT
  /ORDER=ANALYSIS.

SET TLook=None Small=0.0001 CTemplate='Working Directory\sort_frequency.sgt' SUMMARY=None THREADS=AUTO TFit=Both DIGITGROUPING=No LEADZERO=No TABLERENDER=light.
FREQUENCIES VARIABLES=q26_1 q26_2 q26_3 q26_4 q26_5 q26_6 q26_7 q29 q29_oth q30_1 q30_2 q30_3 q30_4 q30_5 q30_6 q30_7 q30_8 q30_9 q30_10 q30_11 q30_12
  /FORMAT=NOTABLE
  /BARCHART PERCENT
  /ORDER=ANALYSIS.
