* Encoding: UTF-8.
* Encoding: .
* Encoding: .
* Encoding: .
GET
  FILE='data.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

* Recode variables 
*q55 into edu_level.
recode q55 (1,2,3,4 = 1) (5 = 2) (6,7 = 3) (-9, -7, -5, -4, -3, -2, -1 = SYSMYS) into edu_level.
*Add variable labels.
variable labels edu_level 'Level of education'.
* Apply value labels to edu_level.
value labels edu_level
1 'Secondary or lower'
2 'Vocational'
3 'Complete or incomplete tertiary'.
* Check the frequencies of both variables.
CROSSTABS
  /TABLES=edu_level BY q55
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.



*q57 into empl_stat.
recode q57 (1,2,3,4,7 = 1) (5 = 2) (6 = 3) (8, -9, -7, -5, -4, -3, -2, -1 = SYSMYS)  into empl_stat.
*Add variable labels.
variable labels empl_stat 'Employment status'.
* Apply value labels to empl_stat.
value labels empl_stat
1 'Unemployed'
2 'Employed (part time/full time)'
3 'Self-employed'.
* Check the frequencies of both variables.
CROSSTABS
  /TABLES=empl_stat BY q57
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.



*agegroup. 
RECODE age (18 thru 34=1) (35 thru 54=2) (55 thru Highest=3) INTO agegroup.
VARIABLE LABELS  agegroup 'Age group'.
VALUE LABELS agegroup
'1' '18-34'
'2' '35-54'
'3' '55+'. 
EXECUTE.

* Check the frequencies of both variables.
CROSSTABS
  /TABLES=agegroup BY age
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.


*ehtnicity
*q56 into ethn.
recode q56 (1 = 1) (2 = 2) (3 = 3) (4, 5, 6, 7 = 4)  into ethn.
*Add variable labels.
variable labels ethn 'Ethnicity'.
* Apply value labels to ethn.
value labels ethn
1 'Armenian'
2 'Azerbaijani'
3 'Georgian'
4 'Other'.

* Check the frequencies of both variables.
CROSSTABS
  /TABLES=ethn BY q56
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.


*wealth
*q59 into hhincome.
recode q59 (7, 8, 9, 10 = 1) (6 = 2) (5 = 3) (4 = 4) (3 = 5) (1, 2 = 6) ( -1, -2 = -1)  into hhincome

*Add variable labels. 
variable labels hhincome 'Houshold monetary income last month'.
* Apply value labels to hhincome.
value labels hhincome
1 'Less than 500'
2 '501-800'
3 '801-1200'
4 '1201-1600'
5 '1601-2000'
6 '2001 or more'
-1 'DK/RA'.

* Check the frequencies of both variables.
CROSSTABS
  /TABLES=hhincome BY q59
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.


*missing values in all variable.
missing values q1 to q59 (-9,-7,-3).


SAVE OUTFILE='C:\Users\crrc_\OneDrive\Documents\Irex\Irex 2024\chart\Irex_recoded_data_2024.sav' 
  /COMPRESSED.













