import numpy as np


class SetDraw(object):

    """
    Parameters
    ==========
    x_bounds : tuple
        (low_bound, high_bound) of points to draw
    y_bounds : tuple
        (low_bound, high_bound) of points to draw
    num_points : int
        number of points pr. dimension - total number of points = num_points^2 in calc
    """

    def __init__(self, x_bounds, y_bounds, num_points=200):

        self.x_bounds = x_bounds
        self.y_bounds = y_bounds
        self.num_points = num_points
        self.conditions = []

    @property
    def x_vals(self):
        l_bound = self.x_bounds[0]
        h_bound = self.x_bounds[1]
        return np.linspace(l_bound, h_bound, num=200)

    @property
    def y_vals(self):
        l_bound = self.y_bounds[0]
        h_bound = self.y_bounds[1]
        return np.linspace(l_bound, h_bound, num=200)

    def add_condition(self, func):
        """
        Parameters
        ==========
        func : function
            function must only contain to arguments (x, y)
            that returns True or False
        """
        self.func = func

    def points(self):

        x_list = []
        y_list = []
        for x in self.x_vals:
            for y in self.y_vals:
                if self.func(x, y) is True:
                    x_list.append(x)
                    y_list.append(y)

        return x_list, y_list
