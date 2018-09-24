import numpy as np


class Distribution(object):

    def __init__(self, def_maengde):

        assert def_maengde in ('endelig', 'diskret', 'kontinuer')
        self.def_maengde = def_maengde

    @staticmethod
    def exp(x):
        """wrapper for exponential functionen"""
        return np.math.exp(x)

    @staticmethod
    def factorial(x):
        """wrapper for factorial"""
        return np.math.factorial(x)

    def pdf(self):
        pass

    def cdf(self):
        pass

    def middel(self):
        pass

    def varians(self):
        pass

    def plot_pdf(self):

        if self.def_maengde is 'endelig':
            self.plot_endelig()
        elif self.def_maengde is 'diskret':
            self.plot_diskret()
        elif self.def_maengde is 'kontinuer':
            self.plot_kontinuer()
        else:
            raise ValueError('def mængde skal være endelig, diskret eller kontinuer')

    def plot_diskret():
        pass

    def plot_endelig():
        pass

    def plot_kontinuer():
        pass
