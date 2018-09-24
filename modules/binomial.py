import numpy as np
from modules.distribution import Distribution


class Binomial(Distribution):
    """
    Kig Sørensen Sætning 3.2.3

    Parameters
    ==========
    x : (int) præcis antal succeser
    n : (int) antals parameter
    p : sandsynlighedsparameter
    """

    def __init__(self, n, p):

        self.n = n
        self.p = p
        self.min = 0  # nederste bservation når distribution skal plottes
        self.max = n  # øverste observation når distributionen skal plottes

    def binomialkoeefficient(self, x):
        """binomialkoeefficient"""

        numerator = self.factorial(self.n)
        denomerator = self.factorial(x) * self.factorial(self.n - x)

        return numerator / denomerator

    def pdf(self, x):
        """sandsynlighedsfordeling"""

        binomkoef = self.binomialkoeefficient(x)

        return binomkoef * (self.p**x) * ((1 - self.p)**(self.n - x))

    def cdf(self, x):
        """fordelingsfunktion"""
        pass

    def middel(self):
        return self.n * self.p

    def varians(self):
        return self.n * self.p * (1 - self.p)
