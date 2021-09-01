#!/usr/bin/env python3

import numpy as np
from timeit import default_timer as timer

N = 5000
A = np.random.rand(N,N)
B = np.random.rand(N,N)

start = timer()
C = np.matmul(A,B)
end = timer()
print(end-start)
