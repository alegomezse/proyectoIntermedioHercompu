# include <iostream>
# include <cstdio>
# include <cstdlib>
#include <iostream>
#include <vector>
# include "papi.h"
int  code_to_be_measured(std::vector<std::vector<double>> A,std::vector<std::vector<double>> B);
int main(int argc, char **argv)
{
const int N = std::atoi(argv[1]);
// Matrix declaration : Modeled as  nD vectors

// initialize matrices
 std::vector<std::vector<double>> A = {{1.5,2.0},{2.5,4.0}};
 std::vector<std::vector<double>> B = {{5.0,6.0},{7.44,8.03}};
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
code_to_be_measured(A,B);
if((retval=PAPI_flops_rate(PAPI_FP_OPS,&real_time, &proc_time, &flpops, &mflops))<PAPI_OK)
{
printf("retval: %d\n", retval);
exit(1);
}
printf("Real_time: %f Proc_time: %f Total flpops: %lld MFLOPS: %f\n",
real_time, proc_time,flpops,mflops);
// Do something here, like computing the average of the resulting matrix, to avoid the optimizer deleting the code
printf("%.15e\n", AT[0]);
delete [] A;
delete [] AT;
return 0;
}
int code_to_be_measured(std::vector<std::vector<double>> A,std::vector<std::vector<double>> B)
{
// simple matrix multiplication
std::cout << "Multiplicación A*B = " << std::endl;
    int sizeA  = A.size();
    int n = B.size();
    int sizeCB = B[0].size();
    int suma = 0;
    std::vector<std::vector<double>> R(sizeA, std::vector<double> (sizeCB, 0));
    for(int i = 0; i < sizeA;i++){
        for(int j = 0;j < sizeCB;j++){
            for(int k = 0;k < n;k++){
                R[i][j] += A[i][k]*B[k][j];  
                suma += A[i][k]*B[k][j];
                
            }
        }
    }
  return 0;
}
