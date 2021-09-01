#!/usr/bin/env python3

import numpy as np
from timeit import default_timer as timer

def ctest():
    cdef int N = 300
    cdef int i,j,k
    cdef double [:,:] A,B,C
    
    A = np.random.rand(N,N)
    B = np.random.rand(N,N)
    C = np.zeros((N,N))
    
    start = timer()
    for i in range(N):
        for j in range(N):
            for k in range(N):
                C[i][j] += A[i][k] * B[k][j]
    
    end = timer()
    print(end-start)
