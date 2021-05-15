# include <iostream>
# include <cstdio>
# include <cstdlib>
#include <iostream>
#include <vector>
# include "papi.h"
std::vector<std::vector<double>> code_to_be_measured(std::vector<std::vector<double>> A,std::vector<std::vector<double>> B);
int main(int argc, char **argv)
{
const int N = std::atoi(argv[1]);
// Matrix declaration : Modeled as  nD vectors
for(int ii= 0; ii< N ; ii++){
// initialize matrices 
std::vector<std::vector<double>> A( N , std::vector<double> (N, 0));
std::vector<std::vector<double>> B( N , std::vector<double> (N, 0));

 for(int i=0;i < ii;i++){
  for(int j=0;j < ii;j++){
 	 A[i][j] = rand() % 100;
 	 B[i][j] = rand() % 100;
      }
}
// PAPI vars
float real_time, proc_time,mflops;
long long flpops;
float ireal_time, iproc_time, imflops;
long long iflpops;
int retval;
// PERFOMANCE MEASURE
// start PAPI counters
if((retval=PAPI_flops_rate(PAPI_FP_OPS,&ireal_time,&iproc_time,&iflpops,&imflops)) < PAPI_OK)
{
printf("Could not initialise PAPI_flops \n");
printf("Your platform may not support floating point operation event.\n");
printf("retval: %d\n", retval);
exit(1);
}
std::vector<std::vector<double>> R = code_to_be_measured(A,B);
if((retval=PAPI_flops_rate(PAPI_FP_OPS,&real_time, &proc_time, &flpops, &mflops))<PAPI_OK)
{
printf("retval: %d\n", retval);
exit(1);
}
printf("Real_time: %f Proc_time: %f Total flpops: %lld MFLOPS: %f\n",real_time, proc_time,flpops,mflops);
// Do something here, like computing the average of the resulting matrix, to avoid the optimizer deleting the code
int sizeR  = R.size();
int sizeRo = R[0].size();
int suma = 0;
for(int i = 0; i < sizeR;i++){
    for(int j = 0; j < sizeRo;j++){
       suma += R[i][j];
    }
  }

//printf("%.15e\n", suma);
}
return 0;
}
std::vector<std::vector<double>> code_to_be_measured(std::vector<std::vector<double>> A,std::vector<std::vector<double>> B)
{
// simple matrix multiplication
    int sizeA  = A.size();
    int n = B.size();
    int sizeCB = B[0].size();
    std::vector<std::vector<double>> R(sizeA, std::vector<double> (sizeCB, 0));
    for(int i = 0; i < sizeA;i++){
        for(int j = 0;j < sizeCB;j++){
            for(int k = 0;k < n;k++){
                R[i][j] += A[i][k]*B[k][j];  
              
               
            }
        }
    }
  return R;
}
