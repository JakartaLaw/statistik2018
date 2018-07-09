# statistik2018
Kursusmateriale til **Sandsynlighedsteori og statistik**

### MyBinder

### Installér Conda miljø

Åben terminalen på Mac/unix eller kommandoprompten på Windows (herfra kaldet terminalen). Inde i terminalen kør følgende kode:
`conda env create -f environment.yml`

Efter installationen activér miljøet. På Mac/unix: `source activate stat18`. På Windows `activate stat18`

Efter at miljøet er aktiveret køres følgende kommando i terminalen: `python -m ipykernel install --user --name stat18 --display-name "Python 3 (stat18)"`

### Deleting environment
For at fjerne conda miljøet køres: `conda remove --name seahorse --all`

After the environment is removed, one might have to remove the kernel from jupyter, for not seeing it:

Efter at conda miljøet er fjernet, kan det være nødvendigt skulle fjerne kernen fra jupyter, for ikke at kunne se det når man vælger kernel i sin notebook. Dette gøres i: `~Library/Jupyter/kernels/stat18`

# Resourcer
- [Installing Anaconda (video)](https://www.youtube.com/watch?v=HW29067qVWk&t=19s)
- [Managing conda environments (article)](https://conda.io/docs/user-guide/tasks/manage-environments.html)

# Bøger
