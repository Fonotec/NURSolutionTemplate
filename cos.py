#!/usr/bin/env python
import numpy as np

# program to check values at specific variables of cosine
x = np.array([0,np.pi/2, np.pi])
y = np.cos(x)

# Save a text file
np.savetxt('cosoutput.txt',np.transpose([x,y]))
