* Encoding: UTF-8.
GET 
  FILE='data.sav'.

DATASET NAME DataSet1 WINDOW=FRONT. 
WEIGHT BY indwt. 
EXECUTE.


MISSING VALUES in q1 to q59 (-7, -9, -3).




*reverse coding of q23s.
RECODE q23_2 q23_3 q23_4 q23_6 (1=0) (0=1) (ELSE=Copy) INTO q23_2_rec q23_3_rec q23_4_rec q23_6_rec.
VARIABLE LABELS  q23_2_rec 'Georgia has officially been accepted as a full member of the EU' 
    /q23_3_rec 'Georgians can travel, work, study in any EU country without visas' 
    /q23_4_rec 'As part of EU Georgia will grant asylum 15000 Asian - African refugees a year'
    /q23_6_rec 'Joining the EU means-Georgia must allow same sex marriage'.
EXECUTE.

MISSING VALUES in q23_1 q23_5 q23_2_rec to q23_6_rec (-3, -2, -1).

*reliability analysis of scale.
RELIABILITY 
  /VARIABLES=q23_1 q23_2_rec q23_3_rec q23_4_rec q23_5 q23_6_rec 
  /SCALE('ALL VARIABLES') ALL 
  /MODEL=ALPHA 
  /STATISTICS=DESCRIPTIVE SCALE CORR 
  /SUMMARY=TOTAL CORR.

*reliability analysis of scale.
RELIABILITY 
  /VARIABLES=q23_2_rec q23_3_rec q23_4_rec q23_6_rec 
  /SCALE('ALL VARIABLES') ALL 
  /MODEL=ALPHA 
  /STATISTICS=DESCRIPTIVE SCALE CORR 
  /SUMMARY=TOTAL CORR.


*compute medialiteracy scale. 



COMPUTE medialiteracy_index=(q23_2_rec + q23_3_rec + q23_4_rec + q23_6_rec)  /  4. 
VARIABLE LABELS  medialiteracy_index 'Media literacy index'. 
EXECUTE. 


*analysis.
WEIGHT BY indwt. 
EXECUTE.

  FREQUENCIES VARIABLES=medialiteracy_index 
  /NTILES=4 
  /STATISTICS=STDDEV VARIANCE RANGE MINIMUM MAXIMUM MEAN MEDIAN MODE 
  /BARCHART PERCENT 
  /ORDER=ANALYSIS.



*correlation between q45 and medialiteracy.







*q54 EU membership.

recode q54 (1,2= 1) (3 = 2) (4,5 = 3) (-9, -7, -3 = SYSMYS) (-2, -1 = -1) into eu_memb.
*Add variable labels.
variable labels eu_memb 'To what extent would you support Georgias membership in the European Union? _recoded'.
* Apply value labels to edu_level.
value labels eu_memb
1 'Does not support'
2 'Neither for nor against'
3 'Supports'
-1 'Don't know / Refuse to answer.




*recoding watch tv channel at least.
RECODE q23_2 q23_11 q23_1 q23_6 q23_5 (1,2,3,4,5,6=1) (ELSE=0) INTO q23_2_rec q23_11_rec q23_1_rec q23_6_rec q23_5_rec.
VARIABLE LABELS  q23_2_rec 'Watches news coverage on Imedi' 
    /q23_11_rec 'Watches news coverage on Rustavi 2' 
    /q23_1_rec 'Watches news coverage on Mtavari Arkhi'
    /q23_6_rec 'Watches news coverage on GPB'
    /q23_5_rec 'Watches news coverage on TV pirveli'.
EXECUTE.

CROSSTABS 
  /TABLES=q23_2_rec q23_11_rec q23_1_rec q23_6_rec q23_5_rec BY eu_memb 
  /FORMAT=AVALUE TABLES 
  /CELLS=ROW 
  /COUNT ROUND CELL.



*Local media viewers.
*imereti.
DO IF  (q23_15>-7). 
COUNT imereti_tv=q23_15 q23_16 q23_17 q23_18(1 thru 6). 
VARIABLE LABELS  imereti_tv 'Watches imereti tv'. 
END IF. 
EXECUTE.

*ajara.
DO IF  (q23_19>-7). 
COUNT ajara_tv=q23_19 q23_20(1 thru 6). 
VARIABLE LABELS  ajara_tv 'Watches Ajara tvs'. 
END IF. 
EXECUTE.


*samegrelo.
DO IF  (q23_21>-7).
COUNT Samegr_tv=q23_21 q23_22(1 thru 6).
VARIABLE LABELS  Samegr_tv 'Watches Samegrelo tvs'.
END IF.
EXECUTE.


*kakheti.
DO IF  (q23_25>-7).
COUNT kakh_tv=q23_24 q23_25(1 thru 6).
VARIABLE LABELS  kakh_tv 'Watches Kakheti tvs'.
END IF.
EXECUTE.

*shida kartli.
DO IF  (q23_27>-7). 
COUNT sh_kart_tv=q23_26 q23_27(1 thru 6). 
VARIABLE LABELS  sh_kart_tv 'Watches Shida Kartli tvs'. 
END IF. 
EXECUTE.

*KVemo kartli.
DO IF  (q23_28>-7). 
COUNT kv_kart_tv=q23_28 q23_29(1 thru 6). 
VARIABLE LABELS  kv_kart_tv 'Watches Kvemo Kartli tvs'. 
END IF. 
EXECUTE.

*Samthske -javakheti.
DO IF  (q23_30>-7). 
COUNT samtskh_tv=q23_30 q23_31 q23_32 q23_33 q23_34(1 thru 6). 
VARIABLE LABELS  samtskh_tv 'Watches Samtskhe-Javakheti tvs'. 
END IF. 
EXECUTE.

*Television watching frequencies at least once.
FREQUENCIES VARIABLES=imereti_tv ajara_tv Samegr_tv q23_23 kakh_tv sh_kart_tv kv_kart_tv samtskh_tv 
  /ORDER=ANALYSIS.

*online media recoding.
DO IF  (q26_18>-7).
COUNT guria_om=q26_18 q26_19(1 thru 6).
VARIABLE LABELS  guria_om 'Visited online media from Guria'.
END IF.
EXECUTE.
DO IF  (q26_20>-7).
COUNT kakheti_om=q26_20 q26_21(1 thru 6).
VARIABLE LABELS  kakheti_om 'Visited online media from Kakheti'.
END IF.
EXECUTE.
DO IF  (q26_22>-7).
COUNT imer_om=q26_22 q26_23 q26_24(1 thru 6).
VARIABLE LABELS  imer_om 'Visited online media from Imereti'.
END IF.
EXECUTE.
DO IF  (q26_27>-7).
COUNT samtskhe_om=q26_27 q26_28 q26_29 q26_30 q26_31(1 thru 6).
VARIABLE LABELS  samtskhe_om 'Visited online media from Samtskhe-Javakheti'.
END IF.
EXECUTE.

*Online media frequencies at least once.
FREQUENCIES VARIABLES=q26_17 guria_om kakheti_om imer_om q26_25 q26_26 samtskhe_om q26_32 
  /ORDER=ANALYSIS.


*Foreign agents law results by TV viewers.
CROSSTABS
  /TABLES=q23_2_rec q23_1_rec q23_11_rec q23_6_rec q23_5_rec BY q49_1 q49_2 q49_3 q49_4 q49_5 q49_6
    q49_7 q49_8
  /FORMAT=AVALUE TABLES
  /CELLS=ROW
  /COUNT ROUND CELL.





