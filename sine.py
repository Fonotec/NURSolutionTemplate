#!/usr/bin/env python3
import numpy as np
import matplotlib.pyplot as plt

# allocate x array
x = np.linspace(0,2*np.pi)

# define and allocate y array
y = np.sin(x)
y2 = np.cos(x)

plt.plot(x,y,label='Sine')
plt.plot(x,y2,label='Cosine')
plt.legend()
plt.xlabel('x variable')
plt.ylabel('y variable')
plt.savefig('./plots/sineplot.png')
plt.close()
