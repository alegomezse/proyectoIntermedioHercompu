#include <stdio.h>
#include <stdlib.h>
#include "papi.h"


int main()
{ 
  float real_time, proc_time, mflops;
  long long flpops;
  int retval;

  if ( (retval = PAPI_flops_rate(PAPI_FP_OPS, &real_time, &proc_time, &flpops, &mflops)) < PAPI_OK )
  { 
    printf("Could not initialise PAPI_flops \n");
    printf("Your platform may not support floating point operation event.\n"); 
    printf("retval: %d\n", retval);
    printf("retval: %d\n", PAPI_FP_OPS);
    //exit(1);
  }

  


  if ( (retval = PAPI_flops_rate(PAPI_FP_OPS, &real_time, &proc_time, &flpops, &mflops)) < PAPI_OK )
  {    
    printf("retval: %d\n", retval);
    //exit(1);
  }


  printf("Real_time: %f Proc_time: %f flpops: %lld MFLOPS: %f\n", 
         real_time, proc_time, flpops, mflops);

  exit(0);
}