import numpy as np
from sympy import sign

def exp1():
    stepnum = 100

    ady = 0
    a2 = 0
    y1ab = 0
    ab = 0
    bdy = 0
    y1b2 = 0

    coef1 = 3
    coef2 = 3
    coef3 = 3
    invbetaestavg = np.zeros(stepnum)
    invbetaests = np.zeros(stepnum)
    be = np.zeros(stepnum)
    mbe = np.zeros(stepnum)
    beavg = np.zeros(stepnum)
    naiveavg = np.zeros(stepnum)
    for trial in xrange(300):
        beta = 10
        alpha1 = -100e-6*beta/5e-3
        alpha2 = -200e-6*beta/5e-3
        invbetaest = 1/2
        for i in xrange(stepnum):
            sigmastest = np.ones(3)*1/20
            sigmasmove = np.ones(3)*1/20
            avgtestvals = np.zeros(3)
#            avgtestvals(2) = -0.01;
            dy1, dy2, a, b, c, gamma, delta, epsil, y11, y12 = onetest(alpha1, alpha2, beta, sigmastest, sigmasmove, avgtestvals)
    #        y11 = alpha1/beta;
    #        y12 = alpha2/beta;

            alpha1 = alpha1 + gamma
            alpha2 = alpha2 + epsil
            beta = beta + delta

            da = a - avgtestvals[0]
            db = b - avgtestvals[1]
            dc = c - avgtestvals[2]

            invbetaest = invbetaest + coef1*sign(da*a-y11*da*b)*(da*dy1-(da*a-y11*da*b)*invbetaest) + coef2*sign(a*db-y11*db*b)*(db*dy1-(a*b-y11*b**2)*invbetaest) + coef3*sign(dc*c-y12*dc*b)*(dc*dy2-(dc*c-y12*dc*b)*invbetaest)
            mombetaest = ((y11+dy1)*b-a) / (-dy1)
            invbetaests[i] = abs(invbetaest-1/(beta-delta))

            be[i] = abs(1/invbetaest-(beta-delta))
            mbe[i] = abs(mombetaest - (beta-delta))
            ady = ady + a*dy1
            a2 = a2 + a**2
            y1ab = y1ab + y11*a*b
            ab = ab + a*b
            bdy = bdy + b*dy1
            y1b2 = y1b2 + y11*b**2

        c = (a2-y1ab)*(a2-y1ab)+(ab-y1b2)*(ab-y1b2)
        betaest = ((a2-y1ab)*ady + (ab-y1b2)*bdy)/c
        betaest = 1/betaest

        print beta, ' ', betaest, ' ', abs(beta-betaest)
        if invbetaests[99] > 0.3:
            print beta

        invbetaestavg = invbetaestavg + invbetaests
        beavg = beavg + be
        naiveavg = naiveavg + mbe



def onetest(alpha1, alpha2, beta, sigmastest, sigmasmove, avgtestvals):
   a = sigmastest[0]*np.random.randn()
   b = sigmastest[1]*np.random.randn() + avgtestvals[1]
   c = sigmastest[2]*np.random.randn()

   gamma = sigmasmove[0]*np.random.randn()
   delta = sigmasmove[1]*np.random.randn()
   epsil = sigmasmove[2]*np.random.randn()

   y11 = alpha1/beta + 0.3e-6*np.random.randn()
   y12 = alpha2/beta + 0.3e-6*np.random.randn()
   y21 = (alpha1 + a + gamma) / (beta + b + delta) + 0.3e-6*np.random.randn()
   y22 = (alpha2 + c + epsil) / (beta + b + delta) + 0.3e-6*np.random.randn()

   dy1 = y21 - y11
   dy2 = y22 - y12

   return dy1, dy2, a, b, c, gamma, delta, epsil, y11, y12

exp1()