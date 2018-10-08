from modules.distribution import Distribution


class Exponential(Distribution):
    """Exponential distribution.

    Parameters
    ----------
    param_lambda : float
        lambda parameteret i en exponential distribution

    """

    def __init__(self, param_lambda):

        super().__init__(def_maengde='kontinuer')
        self.param_lambda = param_lambda

    def pdf(self, x):

        if x > 0:
            res = self.param_lambda * self.exp(-self.param_lambda * x)
        else:
            res = 0
        return res

    def cdf(self, x):

        if x > 0:
            res = 1 - self.exp(-self.param_lambda * x)
        else:
            res = 0
        return res

    def middel(self):
        return self.param_lambda**(-1)

    def varians(self):
        return self.param_lambda**(-2)
