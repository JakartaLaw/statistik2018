* Clearing the command window

cls

*First clear memory

clear

* drop all graphs that are named
graph drop _all

*Change Working directory
cd "/Users/Jeppe/Projects/Statistik2018"


*** *** *** OPGAVE 1 *** *** ***


import excel "data/Titanic.xlsx", sheet("Sheet1") firstrow clear

sum survived /* mean = 0.32 */
sum female /* mean = 0.21 */
sum child /* mean = 0.05 */

histogram class 

*** *** *** OPGAVE 5.2 *** *** ***

bysort female: sum survived /* meanf1 = 0.73, meanf0 = 0.21 */

tabulate survived female /* tabel med frekvenser */ 

*** *** *** OPGAVE 5.3 *** *** ***

bysort class: sum survived /* m0 = 0.24, m1=0.62, m2=0.41, m3=0.25 */

tabulate class survived
