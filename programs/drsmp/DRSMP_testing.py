import numpy as np
from sys import argv
from copy import deepcopy
from scipy.linalg import eig as eig
from matplotlib import pyplot as plt

###############################################
###                 POSEIG                  ###
###############################################
#   P: Monic matrix polynomial [A0,A1,...,I]
#   m: Degree of matrix polynomial
#   return: Number of real positive eigenvalues
###############################################
"""Estimate of the number of real positive eigenvalues of the monic matrix polynomial P,
    use the condition number of each eigenpair to determine if the eigenvalue's imaginary
    part is zero. 

   INPUT:   P = [A0,A1,...,I] list of the matrix-coefficients
            m = degree.

   OUTPUT:  c = The number of real positive eigenvalues

   Author:  Thomas R. Cameron, The College of Idaho"""

def poseig(P,m):
#   Companion Matrix
    C0=-P[0]
    for j in range(1,m):
        C0=np.concatenate((C0,-P[j]),axis=1)

    [l1,l2]=C0.shape
    C=np.concatenate((np.concatenate((np.zeros((l2-l1,l1),dtype=complex),np.eye(l2-l1,dtype=complex)),axis=1),C0),axis=0)
#   eigenvalues
    w,vl,vr=eig(C,b=None,left=True,right=True,overwrite_a=False,overwrite_b=False,check_finite=True)
    real_eig=np.real(w)
    imag_eig=np.imag(w)
#   Number of real positive eigenvalues
    c=0
    for i in range(l2):
        tol=np.linalg.norm(np.dot(C,vr[:,i])-w[i]*vr[:,i])*(np.absolute(np.vdot(vl[:,i],vr[:,i])))**(-1)
        if abs(imag_eig[i])<tol and real_eig[i]>0:
            c += 1
    return c

###############################################
###                 SARRAY                  ###
###############################################
#   m: Degree of matrix polynomial
#   s: Number of sign changes
#   return: an array of size (m+1) made up of
#   elements from (-1,0,1) with exactly s sign
#   changes, leading coeff is 1 and constant
#   coeff cannot be 0.
###############################################
def sarray(m,s):
#   0 or m sign changes
    if s==0:
        sign=np.ones(m+1)
    elif s==m:
        sign=[]
        if m%2==0:
            for i in range(m+1):
                sign.append((-1)**(i))
        else:
            for i in range(m+1):
                sign.append((-1)**(i+1))
        sign=np.array(sign)
#   0 < sign changes < m
    else:
        go=True
        while(go):
            sign=np.random.randint(-1,2,m)
            sign=np.concatenate((sign,np.array([1])))
            if sign[0] != 0:
                index=np.where(sign==0)[0]
                temp=np.delete(sign,index)
                l=temp.shape[0]
                c=0
                for i in range(1,l):
                    if temp[i]*temp[i-1]<0:
                        c+=1
                if c==s:
                    go=False
    return sign

###############################################
###                     MAIN                ###
###############################################
#   m: Degree of matrix polynomial
#   n: Size of matrix polynomial
#   s: Number of sign changes
#   Compute the number of real positive 
#   eigenvalues of a matrix polynomial
#   satisfying the above criterion. Save
#   results in a plot. 
###############################################
def main():
#   grab arguments
    m=int(argv[1])
    n=int(argv[2])
    s=int(argv[3])
#   random tests
    trials=5000
    Y=[]
    X=range(trials)
    for i in X:
        P=[]
        sign=sarray(m,s)
        for k in range(m):
            A=np.matrix(np.random.rand(n,n)+1j*np.random.rand(n,n))
            A=np.dot(A.H,A)
            A=sign[k]*A
            P.append(A)
        P.append(np.eye(n,n,dtype=complex))
        Y.append(poseig(P,m))

#   histogram
    plt.figure()
    bins=range(-1,n*s+2)
    plt.hist(Y,bins=bins,normed=True)
    plt.xlabel('# of real positive eigenvalues')
    plt.ylabel('frequency over %s trials' %(trials))
    plt.title('Degree = %s, Size = %s, Sign Changes = %s' %(m,n,s))
    plt.show()


main()
