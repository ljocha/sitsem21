#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#define N 300
int main()
{
	double	A[N][N];
	double	B[N][N];
	double	C[N][N];
	double	all = 0.;

	struct	timeval start,end;

	for (int i=0; i<N; i++)
		for (int j=0; j<N; j++) {
			A[i][j] = drand48();
			B[i][j] = drand48();
			C[i][j] = 0.;
		}
	

	gettimeofday(&start,NULL);
	for (int i=0; i<N; i++)
		for (int j=0; j<N; j++) 
			for (int k=0; k<N; k++)
				C[i][j] += A[i][k] * B[k][j];

	gettimeofday(&end,NULL);

	for (int i=0; i<N; i++)
		for (int j=0; j<N; j++)
			all += C[i][j];

	printf("%f\n",all);
	end.tv_sec -= start.tv_sec;
	if ((end.tv_usec -= start.tv_usec) < 0) {
		end.tv_usec += 1000000;
		end.tv_sec++;
	}
	
	printf("all %f\n",all);
	printf("time %d.%06d\n",end.tv_sec,end.tv_usec);
	return 0;
}
