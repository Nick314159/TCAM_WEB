import numpy as np
from sys import argv
from copy import deepcopy
from matplotlib import pyplot as plt

###############################################
###                 INRAD                   ###
###############################################
def inrad(A):
    """inrad estimates the minimum, r0, among the maximum eigenvalues of all matrices (1/2)*{e^{i*theta)*A+e^(-i*theta)*A}."""
    E=[]
    for k in range(1,73):
        theta = k*2*np.pi/72
        A1 = np.exp(1j*theta)*A
        H = 0.5*(A1+np.conj(A1.T))
        E.append(max(np.real(np.linalg.eigvalsh(H))))
    return min(E)

###############################################
###                 MAXDERIV                ###
###############################################
def maxderiv(Q,mu,p,m):
    """maxderiv computes for the 2-norm ||.||, the maximum of the quantities
    (1/j!)||P^(j)(mu)}}, j=1,2,...,m.
It requires also the degree m of the matrix polynomial P(z) and the vector p of the necessary factorials."""
    a=np.zeros(m)
    B=[]
    for j in range(m):
        B.append(p[j]*Q[j+1])

        for k in range(m-j-1):
            B[j] += (p[k+j+1]/p[k])*(mu**(k+1))*Q[k+j+2]

        a[j]=np.linalg.norm(B[j],2)/p[j]
    return max(a)

###############################################
###             POLRANGE                    ###
###############################################
def polrange(Q,hx,hy,m):
    """polrange estimates the spectrum and the boundary of the numerical range of a square monic matrix polynomial of the form
    P(z)=Iz^(m)+A_{m-1}z^(m-1)+...+A_{1}z+A_{0}

   INPUT:   Q = [A0,A1,...,I] list of the matrix-coefficients
            hx = length of the grid for the x-axis (smaller than 0.5),
            hy = length of the grid for the y-axis (smaller than 0.5),
            n = size
            m = degree.

   OUTPUT:  c = contour plot points
         (boundary of the numerical range and eigenvalues of P(z)).

   Authors: Stavros Fatouros and Panayiotis Psarrakos,
         Department of Mathematics,
         National Technical University of Athens.

   Original research supported by a grant of the EPEAEK project PYTHAGORAS II.
   The project is co-funded by the European Social Fund (75%) and
   Greek National Resources (25%).

   Originally written in MATLAB. Translated to Python and slightly modified by
                      Leonardo Trujillo,
                      Thomas R. Cameron (Advisor)
                     The College of Idaho"""
#   Companion Matrix
    C0=-Q[0]
    for j in range(1,m):
        C0=np.concatenate((C0,-Q[j]),axis=1)

    [l1,l2]=C0.shape
    C=np.concatenate((np.concatenate((np.zeros((l2-l1,l1),dtype=complex),np.eye(l2-l1,dtype=complex)),axis=1),C0),axis=0)

#   Eigenvalues
    temp=np.linalg.eigvals(C)
    real_eig=np.real(temp)
    imag_eig=np.imag(temp)

#   Constructing the grid
    temp=np.ceil(max(abs(real_eig)))
    xrang=[-temp,temp]
    temp=np.ceil(max(abs(imag_eig)))
    yrang=[-temp,temp]
    n1 = int(round((xrang[1]-xrang[0])/hx, 0))
    n2 = int(round((yrang[1]-yrang[0])/hy, 0))

#   Setting initial values on the grid
    Z=np.zeros((n1+1,n2+1))
    X=np.zeros(n1+1)
    Y=np.zeros(n2+1)

#   Computing factorials
    p=[]
    par=1
    for i in range(1,m+1):
        par *= i
        p.append(par)

#   Computing numerical range
    for x in np.arange(xrang[0],xrang[1]+hx,hx):
        I=int(round((x-xrang[0])/hx,0))

        for y in np.arange(yrang[0],yrang[1]+hy,hy):
            J=int(round((y-yrang[0])/hy,0))
            mu=x+1j*y

            if Z[I,J]==0:
                B0=deepcopy(Q[0])

                for j in range(m):
                    B0 += (mu**(j+1))*Q[j+1]

                r0=inrad(B0)
                
                if r0<0:
                    f=maxderiv(Q,mu,p,m)
                    r=-r0/(-r0+f)
                    r=r/1.4
                    q1=int(round(r/hx,0))
                    q2=int(round(r/hy,0))

                    for k1 in range(q1+1):
                        for k2 in range(q2+1):
                            if I+k1>=Z.shape[0]:
                                Z=np.concatenate((Z,np.zeros((1,Z.shape[1]))),axis=0)
                            if J+k2>=Z.shape[1]:
                                Z=np.concatenate((Z,np.zeros((Z.shape[0],1))),axis=1)
                            if I+k1>=X.shape[0]:
                                X=np.concatenate((X,[0]))
                            if J+k2>=Y.shape[0]:
                                Y=np.concatenate((Y,[0]))
                            Z[I+k1,J+k2]=r0
                            Y[J+k2]=yrang[0]+(J+k2)*hy

                        X[I+k1]=xrang[0]+(I+k1)*hx
                else:
                    Z[I,J]=r0

                Y[J]=yrang[0]+J*hy

        X[I]=xrang[0]+I*hx

#   Plotting figure
    plt.figure()
    plt.contour(X,Y,Z.T,[0],linewidths=4)
    plt.xlim([xrang[0],xrang[1]])
    plt.ylim([yrang[0],yrang[1]])
    plt.xlabel('Real Axis')
    plt.ylabel('Imaginary Axis')
    plt.axhline(0,color='grey')
    plt.axvline(0,color='grey')
    plt.plot(real_eig,imag_eig,'ko',markersize=4)
    plt.show()

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
#   Compute the numerical range of a random
#   self-adjoint monic matrix polynomial 
###############################################
def main():
#   grab arguments
    m=int(argv[1])
    n=int(argv[2])
    s=int(argv[3])

    sign=sarray(m,s)

    print "sign pattern = ", sign

    Q=[]
    for i in range(m):
        A=np.random.rand(n,n)+1j*np.random.rand(n,n)
        A=np.dot(np.conj(A.T),A)
        A=sign[i]*A
        Q.append(A)
    Q.append(np.eye(n,n,dtype=complex))

    hx=0.01
    hy=0.01
    polrange(Q,hx,hy,m)


main()
