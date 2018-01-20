# Python file for plotting on MAT-112 efy1. 
# Thomas R. Cameron, 1/18/2018
import matplotlib.pyplot as plt
import numpy as np

# Problem 1
x = np.linspace(10000,1000000,num=10)
fig = plt.figure()

ax = fig.add_subplot(1,3,1)
ax.plot(x,0.35*x,label='a')
ax.plot(x,(1-0.35)*x,label='n')
ax.legend(loc=0)
ax.ticklabel_format(style='sci', axis='x', scilimits=(0,0))
ax.ticklabel_format(style='sci', axis='y', scilimits=(0,0))

ax = fig.add_subplot(1,3,2)
ax.plot(x,0.5*x,label='a')
ax.plot(x,0.5*x,label='n')
ax.legend(loc=0)
ax.ticklabel_format(style='sci', axis='x', scilimits=(0,0))
ax.ticklabel_format(style='sci', axis='y', scilimits=(0,0))

ax = fig.add_subplot(1,3,3)
ax.plot(x,0.65*x,label='a')
ax.plot(x,(1-0.65)*x,label='n')
ax.legend(loc=0)
ax.ticklabel_format(style='sci', axis='x', scilimits=(0,0))
ax.ticklabel_format(style='sci', axis='y', scilimits=(0,0))

fig.savefig('efy1_fig1.pdf', orientation='portrait', format='pdf', frameon=True)
plt.close(fig)

# Problem 3
x = np.linspace(0,np.sqrt(50.0),num=100)
fig = plt.figure()

ax = fig.add_subplot(1,1,1)
ax.plot(x,25*x-0.5*x**3)

fig.savefig('efy1_fig2.pdf', orientation='portrait', format='pdf', frameon=True)
plt.close(fig)