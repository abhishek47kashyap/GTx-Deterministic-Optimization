"""
HW4
Derivative free unconstrained optimization with scipy.optimize
Author: Abhishek Kashyap
"""

import numpy as np
from scipy.optimize import minimize_scalar, minimize


# function for answer 1
def f1(x):
    return abs(x[0]**2 - 3*x[2] + 4) + (x[1]-3)**2


# function for answer 2
def f2(x):
    return (x-1) * x * (x+3) + x**4


# function for answer 3
def f3(x):
    A = np.array([[2, -3],
                  [4, 1]])
    b = np.array([[1],
                  [9]])

    return np.linalg.norm(A*x-b)


answer1 = minimize(f1, [0,0,0], method='Nelder-Mead')
print "Answer 1"
print "Minima at = ", answer1.x
print "Objective function value at minima = ", f1(answer1.x)


answer2 = minimize_scalar(f2, bounds=(-10,10), method='Golden')
print "Answer 2"
print "Minima at = ", answer2.x
print "Objective function value at minima = ", f2(answer2.x)


answer3 = minimize(f3, [0,0], method='Nelder-Mead')
print "Answer 3"
print "Minima at = ", answer3.x
print "Objective function value at minima = ", f3(answer3.x)
