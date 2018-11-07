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

*** *** *** OPGAVE 1 *** *** ***

* x1 = genstande, x2 = bolig

kdensity genstande, kernel(gaussian) name(pdf)

cumul genstande, gen(genstande_cum), 

twoway (line genstande genstande_cum, sort), name(cdf)

*** *** *** OPGAVE 2 *** *** ***

summarize genstande, detail

*** *** *** OPGAVE 3 *** *** ***

tabulate bolig, sum(genstande)

* alternativt med loop

forvalues i = 1/5{
	summarize genstande if bolig == `i'
}
 
*** *** *** OPGAVE 4 *** *** ***

*genererer dummy variable

gen bolig_d1 = 0

forvalues i = 1/2{
	replace bolig_d1 = 1 if bolig == `i'
}

 
gen bolig_d2 = 0

forvalues i = 3/5{
	replace bolig_d2 = 1 if bolig == `i'
}


kdensity genstande if bolig_d1 == 1, kernel(gaussian) name(gruppe1)
kdensity genstande if bolig_d2 == 1, kernel(gaussian) name(gruppe2)
