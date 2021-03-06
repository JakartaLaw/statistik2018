# Sandsynlighedsteori og statistik
Kursusmateriale til **Sandsynlighedsteori og statistik**

Link til binder: https://mybinder.org/v2/gh/JakartaLaw/statistik2018/master

### Python Basics


### Jupyter notebook

Jupyter notebook er et interaktivt programmerings miljø, som tilgås fra en browser. Man skriver kode/markdown/latex i små celler, som derefter kan køres.

### MyBinder

### Conda miljø

Dependencies

### Installér Conda miljø

Åben terminalen på Mac/unix eller kommandoprompten på Windows (herfra kaldet terminalen). Inde i terminalen kør følgende kode:
`conda env create -f environment.yml`

Efter installationen activér miljøet. På Mac/unix: `source activate stat18`. På Windows `activate stat18`

Efter at miljøet er aktiveret køres følgende kommando i terminalen: `python -m ipykernel install --user --name stat18 --display-name "Python 3 (stat18)"`

### Fjerne Conda miljø
For at fjerne conda miljøet køres: `conda remove --name stat18 --all`

After the environment is removed, one might have to remove the kernel from jupyter, for not seeing it:

Efter at conda miljøet er fjernet, kan det være nødvendigt skulle fjerne kernen fra jupyter, for ikke at kunne se det når man vælger kernel i sin notebook. Dette gøres i: `~Library/Jupyter/kernels/stat18`

### Resourcer
- [Installing Anaconda (video)](https://www.youtube.com/watch?v=HW29067qVWk&t=19s)
- [Managing conda environments (article)](https://conda.io/docs/user-guide/tasks/manage-environments.html)
- [Reproducible Data Analysis in Jupyter (video series)](https://www.youtube.com/watch?v=_ZEWDGpM-vM&list=PLYCpMb24GpOC704uO9svUrihl-HY1tTJJ)
- [Stanford tutorial on Python and NumPy (article)](https://cs231n.github.io/python-numpy-tutorial/)
- [Stanford tutorial on Notebooks (article)](https://cs231n.github.io/ipython-tutorial/)
- [course description](http://kurser.ku.dk/course/a%c3%98kb08019u/2018-2019)
- **Math refresher** (taken from the book: _Deep Learning_ by Ian Goodfellow, Yoshua Bengio and Aaron Courville)
    - [Notation](http://www.deeplearningbook.org/contents/notation.html)
    - [Linear Algebra](http://www.deeplearningbook.org/contents/linear_algebra.html)
    - [Probability and information theory](http://www.deeplearningbook.org/contents/prob.html)
    - [Numerical computation](http://www.deeplearningbook.org/contents/numerical.html)


# Bøger
- **Michael Sørensen**: ”En Introduktion til sandsynlighedsregning”, 9. udgave 2008, kapitel 1-8.
- **Heino Bohn Nielsen**: ”Introduction to Likelihood-Based Estimation and Inference”, 3rd edition, 2016.
