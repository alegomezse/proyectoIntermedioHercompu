#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <vector>
#include "papi.h"


int main(int argc, char **argv)
{

  

    //Obtener argumentos    
    const int a = std::atoi(argv[1]);
   
   for(int N=0; N<a; ++N ){
       float real_time, proc_time,mflops;
        long long flpops;
        float ireal_time, iproc_time, imflops;
        long long iflpops;
        int retval;
        // Declarar matrices
        double A[N][N];
        double AT[N][N];
        // inicializar matrices
        for (int ii = 0; ii < N; ++ii) {
        for (int jj = 0; jj < N; ++jj) {
                A[ii][jj] = ii + jj + 0.99;
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
    
    }
    return 0;
}