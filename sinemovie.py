#!/usr/bin/env python3
import numpy as np
import matplotlib.pyplot as plt
from tqdm import tqdm

x = np.linspace(0,2*np.pi,100)

for i in tqdm(range(0,300)):
    y = np.sin(x+np.pi*i/300.)
    plt.plot(x,y)
    plt.xlabel('x axis')
    plt.ylabel('y axis')
    plt.savefig('./plots/snap%04d.png'%i)
    plt.close()
