* Clearing the command window

cls

*First clear memory

clear

* drop all graphs that are named
graph drop _all

*Change Working directory
cd "/Users/Jeppe/Projects/Statistik2018"

*Use file

use data/sand_spskema2018.dta


*** *** *** OPGAVE 2 *** *** ***

*Undersøg variable

* x = gns_gym, y = studietimer

hist gns_gym, name(gns_gym)
hist studietimer, name(studietimer)

summarize gns_gym, detail
summarize studietimer, detail

*** *** *** OPGAVE 4 *** *** ***

corr gns_gym studietimer

*** *** *** OPGAVE 5 *** *** ***

 twoway (lfit gns_gym studietimer) (scatter gns_gym studietimer, sort), name(krydsplot)

. 
