from modules.distribution import Distribution


class Poisson(Distribution):

    def __init__(self, param_lambda):

        super().__init__(def_maengde='diskret')
        self.param_lambda = param_lambda

    def pdf(self, x):

        return (self.param_lambda**x / self.factorial(x)) * self.exp(-self.param_lambda)

    def cdf(self, x):

        pass
