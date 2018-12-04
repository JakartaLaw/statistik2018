

clear /*clearing screen*/
cls /*clearing memory*/

*Change Working directory
cd "/Users/Jeppe/Projects/Statistik2018/data"


import excel "Titanic.xlsx", sheet("Sheet1") firstrow clear

*** *** *** OPGAVE 4.3 *** *** ***
mat define init = J(1,1,0.2) /*starting values*/ 
mlexp ( survived*log({theta})+(1-survived)*log(1-{theta}) ) , from(init)
mat La = e(ll)
disp e(ll)

*** *** *** OPGAVE 4.4 *** *** ***

mlexp ( survived*log({theta})+(1-survived)*log(1-{theta}) ) , from(init) iter(0)
mat list e(gradient) /* gradient */

sum survived
scalar n = _N
scalar sumy = r(sum)

* plot log-likelihood
twoway (function logL = sumy*log(x) + (n-sumy)*log(1-x), range(0 1)), xline(0.323, lc(red)) xtitle({&theta})


*** *** *** OPGAVE 5.5 *** *** ***

g f = female==1
       mat define init = J(1,2,0.2) /*starting values*/
       mlexp ( survived*log({theta}+{delta}*f)+(1-survived)*log(1-{theta}-{delta}*f) ) , from(init)
