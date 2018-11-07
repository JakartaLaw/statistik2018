clear all
* RET denne sti til der hvor dit data ligger:
cd "C:\Users\bnl429\Dropbox\Teaching\Sandsynlighedsteori\2018\STATA\hand-out\data"

********************************************************************************
* Chapter 5
********************************************************************************

*************************
* Bernoulli-example (5.1)
input y
1
1
0
1
1
0
0
end

mat define init = J(1,1,0.5)
mlexp (y*log({theta})+(1-y)*log(1-{theta}) ), from(init)

* re-parametrization
mat define init = J(1,1,0.5)
mlexp ( ///
	y*log(1/(1+exp(-{theta}))) ///
	+(1-y)*log(1-1/(1+exp(-{theta}))) ///
	), from(init)
mat est = e(b)	

disp "Vi får det samme resultat: " 1/(1+exp(-est[1,1])) 

*************************
* Poisson-example (5.2)
import excel "PoissonExample.xlsx", sheet("Sheet1") firstrow clear

mat define init = J(1,1,2)
mlexp (y*log({lambda})-{lambda}), from(init)

* re-parametrization
mat define init = J(1,1,1)
mlexp (y*{lambda}-exp({lambda})), from(init)
mat est = e(b)	
disp "Vi får det samme resultat: " exp(est[1,1])

*************************
* Gaussian-example (5.3)
import excel "GaussianExample.xlsx", sheet("Sheet1") firstrow clear
mat define init = J(1,2,1)
mat init[1,1]   = 5
mlexp (-0.5*log(2*_pi*{sigma2})-0.5*((y-{mu})^2)/{sigma2}), from(init)


********************************************************************************
* Chapter 7
********************************************************************************
import excel "PoissonExample.xlsx", sheet("Sheet1") firstrow clear

g D = (_n>=36)

mat define init = J(1,2,1)
mat init[1,1]   = 5
mlexp (y*log({lambda} + {delta}*D)-({lambda} + {delta}*D)), from(init)

********************************************************************************
* Chapter 9
********************************************************************************
import excel "JaggiaThosar.xlsx", sheet("Sheet1") firstrow clear

g y = NUMBIDS
g x = BIDPREM

sum y x,detail

mat define init = J(1,2,.1)
mat init[1,1]   = 1.7
mlexp (y*({beta1} + {beta2}*x)-exp({beta1} + {beta2}*x)), from(init)

* quadratic
mat define init = J(1,3,0)
mat init[1,1]   = 1.7
mat init[1,2]   = .1
mlexp (y*({beta1} + {beta2}*x + {beta3}*x^2)-exp({beta1} + {beta2}*x + {beta3}*x^2)), from(init)

********************************************************************************
* Chapter 10
********************************************************************************
import excel "polit.xlsx", sheet("Sheet1") firstrow clear

g y = bestd12
g x = kvotient

sum y x,detail

mat define init = J(1,2,1)
mat init[1,1] = -5
mlexp ( ///
	y*log(1/(1+exp(-{beta1}-{beta2}*x))) ///
	+(1-y)*log(1-1/(1+exp(-{beta1}-{beta2}*x))) ///
	), from(init)

* extended model
g D = kvinde==1	
mat define init = J(1,3,0)
mat init[1,1] = -5
mat init[1,2] = 1
mlexp ( ///
	y*log(1/(1+exp(-{beta1}-{beta2}*x-{beta3}*D))) ///
	+(1-y)*log(1-1/(1+exp(-{beta1}-{beta2}*x-{beta3}*D))) ///
	), from(init)

********************************************************************************
* Chapter 11
********************************************************************************
import excel "MRW.xlsx", sheet("Sheet1") firstrow clear	

g y = Y
g s = S
g g = G

mat define init = J(1,4,1)
mat init[1,1] = 8
mat init[1,2] = 0.1
mat init[1,3] = -0.1
mlexp ( ///
	-0.5*((y - ({beta1}+{beta2}*s+{beta3}*g))^2)/{sigma2} ///
	-0.5*log(2*_pi*{sigma2}) ///
	), from(init)
* small difference due to rounding

* restricted model
mat define init = J(1,3,1)
mat init[1,1] = 8
mat init[1,2] = 0.1
mlexp ( ///
	-0.5*((y - ({beta1}+{beta2}*s-{beta2}*g))^2)/{sigma2} ///
	-0.5*log(2*_pi*{sigma2}) ///
	), from(init)

* extended model
mat define init = J(1,5,.1)
mat init[1,1] = 8
mat init[1,2] = 0.1
mat init[1,3] = -0.1
mat init[1,4] = 1
mlexp ( ///
	-0.5*((y - ({beta1}+{beta2}*s+{beta3}*g))^2)/exp({gamma1}+{gamma2}*G) ///
	-0.5*log(2*_pi*exp({gamma1}+{gamma2}*G)) ///
	), from(init)
	
	
* alternative way of estimation of the latter using a function:
cap program drop  mygaussian
program mygaussian
	version 14
	args todo b lnf
	
	tempvar theta1 theta2
	mleval `theta1' = `b', eq(1)
	mleval `theta2' = `b', eq(2)
	
	tempvar mu sigma2
	g double `mu' 		= `theta1'
	g double `sigma2' 	= exp(`theta2')
	
	mlsum `lnf' = -0.5*log(2*_pi*`sigma2') ///
			      -0.5*((y - `mu')^2)/`sigma2'
end


ml model d0 mygaussian (s g)(G) 
ml maximize
