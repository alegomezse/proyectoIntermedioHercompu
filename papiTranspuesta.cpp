#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <vector>
#include "papi.h"
#include <time.h>
#include <stdlib.h>


int main(int argc, char **argv)
{

  

    //Obtener argumentos    
    const int a = std::atoi(argv[1]);
   
   for(int N=0; N<a; ++N ){
       float real_time=0.0, proc_time=0.0,mflops=0.0;
        long long flpops=0.0;
        float ireal_time=0.0, iproc_time=0.0, imflops=0.0;
        long long iflpops=0.0;
        int retval;
        // Declarar matrices
        double A[N][N];
        double AT[N][N];
        srand(time(NULL));
        // inicializar matrices
        for (int ii = 0; ii < N; ++ii) {
        for (int jj = 0; jj < N; ++jj) {
                A[ii][jj] = ii + (jj*N) + 0.99+rand() % 100;
            AT[ii][jj] = 0.0;
            }
        }
        // PAPI vars

        // PERFOMANCE MEASURE
        // start PAPI counters
        if((retval=PAPI_flops_rate(PAPI_FP_OPS,&ireal_time,&iproc_time,&iflpops,&imflops)) < PAPI_OK)
        {
            printf("Could not initialise PAPI_flops \n");
            printf("Your platform may not support floating point operation event.\n");
            printf("retval: %d\n", retval);
            exit(1);
        }


        for (int ii = 0; ii < N; ++ii) {
            for (int jj = 0; jj < N; ++jj) {
                AT[ii][jj] = 1.0*A[jj][ii]; 
            
            }
        }

        if((retval=PAPI_flops_rate(PAPI_FP_OPS,&real_time, &proc_time, &flpops, &mflops))<PAPI_OK)
        {
            printf("retval: %d\n", retval);
            exit(1);
        }
        printf("Real_time: %f Proc_time: %f Total flpops: %lld MFLOPS: %f\n",
        real_time, proc_time,flpops,mflops);
        
        long long  suma;

         for (int ii = 0; ii < N; ++ii) {
            for (int jj = 0; jj < N; ++jj) {
                suma +=A[jj][ii]; 
            
            }
        }
         printf("suma: %lld\n", suma);


    }
    return 0;
}