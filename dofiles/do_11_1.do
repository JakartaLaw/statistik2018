clear
cls 

*** *** *** OPGAVE 1 *** *** ***

set obs 50000
set seed 3500 /* Seed gør at vi alle pseudo genererer tilfældige tal på samme måde */

gen y = 5 + rnormal()


*** *** *** OPGAVE 2 *** *** ***

summarize y, detail

hist y


*** *** *** OPGAVE 3 *** *** ***

mean y if _n <= 10

mean y if _n <= 100

mean y if _n <= 500

mean y if _n <= 1000

mean y if _n <= 5000

mean y if _n <= 10000

mean y if _n <= 50000
