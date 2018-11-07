* Clearing the command window

cls

*First clear memory

clear

*Change Working directory
cd "/Users/Jeppe/Projects/Statistik2018"

*Load data
import delimited "data/data_17_1.csv"

*Renaming variable
rename v1 y

*** *** *** OPGAVE 1 *** *** ***

* generating variables.
* The == operater evaluates if two values are identical.
gen y0 = (y==0)
gen y1 = (y==1)

* Generer x-værdierne for det kumulative plot
cumul y, gen(y_cum)

* lav simpelt prompt plot
plot y y_cum

* bedre plot

* (udkommenter) twoway (line y y_cum, sort)

*** *** *** OOPGAVE 2 *** *** ***

* udregn gennemsnit

display "Gennemsnittet af y"
mean y

* alternativt 

disp "Alternativ måde at finde gennemsnit på"
summarize

* alternativt

/* Følgenden sker:
	summarize y : laver en opsummering af y. Resultaterne er gemt intern i STATAs hukommelse
	return list : giver en oversigt over resultaterne
	disp : printer til command vindue
	r(sum) / r(N) : tager summen over antallet
*/
summarize y1
return list
disp r(sum) / r(N) 

* alternativt 

summarize y1

* vi vil nu gemme resultater i (hvad kaldes locals) så de kan bruges senere

local y1_sum = r(sum)
local y1_N = r(N)

* læg mærke til `EXPRESSION' klammerne uden op EXPRESSION. På denne måde referere man til locals
disp `y1_sum' / `y1_N'

*** *** *** OPGAVE 3 *** *** ***

summarize y, detail

* alternativt

* hjælpe variabel
gen tmp = (y - r(mean))^2

summarize tmp

disp ((1 / (r(N) - 1)) * r(sum))^(1/2)


*** *** *** OPGAVE 4 *** *** ***

* først skal vi gemme 'p' i en local

* jeg bruger 'quietly' for ikke at få output til commando vinduet

quietly summarize y

local p = r(mean)

*mean

disp `p'

* varians 

disp `p' * (1 - `p')

* skewness

disp (1 - (2* `p')) / (`p' * ( 1 - `p'))^(1/2)

* kurtosis

disp (1 - (6* `p'* ( 1 - `p'))) / (`p' * ( 1 - `p')) + 3


* 50 percentile (median)
centile y, centile(50)

