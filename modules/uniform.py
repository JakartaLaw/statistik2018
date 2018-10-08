from modules import distribution


class Uniform(Distribution):
    """Short summary.

    Parameters
    ----------
    a : type
        Description of a (lower bound)
    b : type
        Description of b (upper bound)
    def_maengde : type
        Description of parameter `def_maengde`.

    """

    def __init__(self, a, b, def_maengde='kontinuer'):

        super().__init__(def_maengde=def_maengde)
        self.a = a
        self.b = b

    def pdf(self, x):

        if self.def_maengde is 'kontinuer':
            pass

    def middel(self):
        return self.param_lambda

    def varians(self):
        return self.param_lambda
