clear /* clear memory */
cls /* clear screen */
graph drop _all /* dropping all graphs */


* changing directory
cd "/Users/Jeppe/Projects/statistik2018/"

* Import Data
import excel "data/skole.xlsx", sheet("Sheet1") firstrow

*** *** *** Opgave 1 *** *** ***

summarize

hist uger, name(uger) start(-0.5) width(1)

*** *** *** Opgave 3 *** *** ***


summarize uger
scalar y_sum = r(sum)
scalar n = _N


* sum af variablen uger
disp y_sum

* estimat
disp (1+ (y_sum / n))^(-1) 


*** *** *** Opgave 6 *** *** ***

* plot log-likelihood
twoway (function logL = n*log(x) + (log(1-x)*y_sum), range(0 1)), name(logLikelihood)

*** *** *** Opgave 8 *** *** ***

scalar theta_hat = 0.2131

twoway (function geodistribution = (1 - theta_hat)^(x)*(theta_hat), range(0 15)), name(estimateddistribution) 

*** *** *** Opgave 9 *** *** ***

mat define init = J(1,1,0.5)
mlexp (uger*log(1-{theta})+log({theta})), from(init)

*********************************
*				13.3			*
*********************************

*** *** *** Opgave 2 *** *** ***

mat define init = J(1,2,.1)
mlexp (uger*log(1- ({beta1}+{beta2}*dreng))+log(({beta1}+{beta2}*dreng))), from(init)

*** *** *** Opgave 3 *** *** ***

* Model kontrol

mat beta = e(b)
g theta = beta[1,1] + beta[1,2]*dreng
g pred  = ((1-theta)^uger)*theta

tab uger dreng, col nofreq
tab uger dreng, sum(pred) mean

*** *** *** Opgave 4 *** *** ***

* test H0: beta2=0.1
mlexp (uger*log(1- ({beta1}+{beta2}*dreng))+log(({beta1}+{beta2}*dreng))), from(init)
scalar ll = e(ll)

* t (wald) test
test ([beta2]_cons = 0.1)

* LR test
mat define init = J(1,1,.5)
mlexp (uger*log(1- ({beta1}+0.1*dreng))+log(({beta1}+0.1*dreng))), from(init)
scalar ll_constr = e(ll)

scalar LR = 2*(ll-ll_constr)
disp "LR-test=" LR  " kristisk værdi på 5% af chi^2(1) er 3.84 så vi kan IKKE afvise H0. p-værdien er " 1-chi2(1, LR) "   som jo er meget tæt på Wald"


