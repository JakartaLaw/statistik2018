
/* OPGAVE 1.1 */

 
/* Genererer variablen y med 17 observationer */ 

input y
1
1
0
0
0
1
1
1
0
1
1
1
0
0
1
1
0
end

/* genererer indikator-funktionen y0, der er 1, hvis y=0 */

generate y0 = (y==0)

generate y1 = (y==1)

/* Genererer den kumulerede frekvens */

cumul y, generate(y_cum)

/* OPGAVE 1.2 */ 

/* Gennemsnittet af y */ 

mean y 

/* Koder y op på ny */

generate y_new = y + 1

generate y_new1 = (y_new == 1) 

mean y_new

/* OPGAVE 1.3 */

summarize y, detail

/* OPGAVE 1.4 */

/* mean */

mean y
generate p = .5882353
generate q = (1-.5882353)

/* variance */


display p*q

/* skewness */

display (q-p)/sqrt(p*q)

/* kurtosis */

display (1-6*p*q)/(p*q) + 3

/* OPGAVE 1.5 */

summarize y, detail

/* OPGAVE 3.1 */ 

use "/Users/jonas/Desktop/sand_spskema2018.dta", replace

/* OPGAVE 3.2 */

histogram studietimer, bin(16)
summarize studietimer, detail

histogram gns_gym, bin(10) start(6)
summarize gns_gym, detail

/* OPGAVE 3.3 */

/* OPGAVE 3.4 */

corr studietimer gns_gym


/* OPGAVE 3.5 */

graph twoway scatter gns_gym studietimer, title("Sammenhæng mellem gennemsnit og flittighed")

scatter gns_gym studietimer

/* OPGAVE 4.1 */

use "/Users/jonas/Desktop/sand_spskema2018.dta", replace


/* finder pdf'en (fordelingen) */
histogram bolig, bin(5)

/* Finder cdf'en (fordelingsfunktionen) */
cumul bolig, gen(cdf_bolig)
sort cdf_bolig
scatter cdf_bolig bolig

/* Gentager ovestående for 'genstande' */

histogram genstande, bin(35)

cumul genstande, gen(cdf_genstande)
sort cdf_genstande
scatter cdf_genstande genstande

/* OPGAVE 4.2 */

summarize bolig, detail
summarize genstande, detail

/* OPGAVE 4.3 */

summarize genstande if bolig == 1 /* mean = 8.18 */
summarize genstande if bolig == 2 /* mean = 5.02 */
summarize genstande if bolig == 3 /* mean = 9.89 */
summarize genstande if bolig == 4 /* mean = 9.81 */
summarize genstande if bolig == 5 /* mean = 11 */ 

/* eller... */

bysort bolig: sum genstande

/* OPGAVE 4.4 */


/* Vi genererer den dummy-variabel, som Thomas foreslår */
gen bolig12 = bolig <= 2

/* finder de to pdf'er (fordelinger) */
histogram genstande if bolig12==1
histogram genstande if bolig12==0

/* ...og de to cdf'er (fordelingsfunktioner) */
cumul genstande if bolig12==1, gen(genstandeb12)
sort genstandeb12
scatter genstandeb12 genstande if bolig12==1

cumul genstande if bolig12==0, gen(genstande345)
sort genstande345
scatter genstande345 genstande if bolig12==0

/* OPGAVE 5.1 */

import excel "/Users/jonas/Desktop/Titanic.xlsx", sheet("Sheet1") firstrow clear

sum survived /* mean = 0.32 */
sum female /* mean = 0.21 */
sum child /* mean = 0.05 */

histogram class 

/* OPGAVE 5.2 */

bysort female: sum survived /* meanf1 = 0.73, meanf0 = 0.21 */

tabulate survived female /* tabel med frekvenser */ 

/* OPGAVE 5.3 */

bysort class: sum survived /* m0 = 0.24, m1=0.62, m2=0.41, m3=0.25 */

tabulate class survived

/* OPGAVE 6.1 */ 

import excel "/Users/jonas/Desktop/PolitData1994.xlsx", sheet("Sheet1") firstrow clear

summarize indkomst, detail /* mean = 229682 std. dev. = 87687, skewness positiv */

histogram indkomst

/* OPGAVE 6.2 */

gen l_indkomst = log(indkomst)

summarize l_indkomst, detail /* mean = 12.26, std. dev. = 0.43, skewness negative */

histogram l_indkomst

/* OPGAVE 6.3 */ 

histogram l_indkomst if indkomst >= 50000

summarize l_indkomst if indkomst >= 50000

/* OPGAVE 6.4 */

bysort kvinde: sum indkomst /* mean_mænd = 263046, mean_kvinde = 193271 */

/* OPGAVE 6.5 */

corr indkomst alder /* correlation = 5% */ 

/* OPGAVE 7.1 */

import excel "/Users/jonas/Desktop/NYSEdata.xlsx", sheet("Sheet1") firstrow clear

generate y = 0.10*CitiGroup + 0.25*CocaCola + 0.35*Universal + 0.30*WaltDisney

summarize y, detail /* mean = 0.025 var = 0.803 */

summarize CitiGroup, detail /* mean = 0.010 var= 1.688 */

summarize CocaCola, detail /* mean= var=0.804 */

summarize Universal, detail /* mean = -0.158 var = 2.670 */

summarize WaltDisney, detail /* mean= 0.890 var = 1.483 */

/* OPGAVE 7.3 */

/* (a) */

histogram y

xtile y_pct=y, n(100)
sort y_pct

scatter y_pct y

/* (b) */

hist y, frequency normal

/* (c) */

histogram y, bin(10)
histogram y, bin(50)
histogram y, bin(100)

/* OPGAVE 7.4 */

summarize y, detail /* mean = 0.0247 var = 0.802 */

summarize NYSEComposite, detail /* mean= 0.0111 var = 0.5217 */

/* OPGAVE 7.5 */

/* (b) */

summarize y, detail

cumul y, gen(y_cumul)
sort y_cumul 

scatter y_cumul y

/* OPGAVE 7.6 */

/* (a) */

summarize NYSEComposite, detail 

cumul NYSEComposite, gen(NYSE_cumul)
sort NYSE_cumul

scatter NYSE_cumul NYSEComposite




