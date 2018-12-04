

cls /* clearing screen */
clear /*clearing memory */

* OPGAVE 5 *

*Change Working directory
cd "/Users/Jeppe/Projects/Statistik2018"

import excel "/Users/Jeppe/Projects/statistik2018/data/gamma.xlsx", sheet("Sheet1") firstrow

summarize Y, detail

* OPGAVE 6 *

scalar Y_sum = r(sum)
scalar alpha_hat = 5.09981

/* remember _N is the number of observations in data set */

disp (_N * alpha_hat) / Y_sum
