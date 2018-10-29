import numpy as np
from modules.distribution import Distribution
from scipy.stats import norm


class Normal(Distribution):
    """Normal distributionen

    Parameters
    ==========
    mu : (float)
        middelværdien for normalfordelingen
    sigma: (float)
        variansen for normalfordelingen

    """

    def __init__(self, mu, sigma):
        self.mu = mu
        self.sigma = sigma
        self._norm = norm(loc=mu, scale=sigma)

    def pdf(self, x):
        """tæthedsfunktionen"""
        return self._norm.pdf(x)

    def cdf(self, x):
        """fordelingsfunktion"""
        return self._norm.cdf(x)
