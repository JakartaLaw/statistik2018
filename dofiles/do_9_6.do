
* Clearing the command window

cls

*First clear memory

clear

* drop all graphs that are named
graph drop _all

*Change Working directory
cd "/Users/Jeppe/Projects/Statistik2018"

import excel "data/data/polit.xlsx", sheet("Sheet1") firstrow clear

