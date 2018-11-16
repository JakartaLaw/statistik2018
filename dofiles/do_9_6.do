
* Clearing the command window

cls

*First clear memory

clear

* drop all graphs that are named
graph drop _all

*Change Working directory
cd "/Users/Jeppe/Projects/Statistik2018"


*** *** *** OPGAVE 6.1 *** *** *** 

import excel "data/PolitData1994.xlsx", sheet("Sheet1") firstrow clear

summarize indkomst, detail /* mean = 229682 std. dev. = 87687, skewness positiv */

histogram indkomst

*** *** *** OPGAVE 6.2 *** *** ***

gen l_indkomst = log(indkomst)

summarize l_indkomst, detail /* mean = 12.26, std. dev. = 0.43, skewness negative */

histogram l_indkomst

*** *** *** OPGAVE 6.3 *** *** ***

histogram l_indkomst if indkomst >= 50000

summarize l_indkomst if indkomst >= 50000

*** *** *** OPGAVE 6.4 *** *** ***

bysort kvinde: sum indkomst /* mean_mænd = 263046, mean_kvinde = 193271 */

*** *** *** OPGAVE 6.5 *** *** ***

corr indkomst alder /* correlation = 5% */ 
