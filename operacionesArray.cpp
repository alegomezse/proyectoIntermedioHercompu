
#include <iostream>
#include <vector>
using namespace std;

void transpuesta(std::vector<std::vector<double>> A);
void printMatrix(std::vector<std::vector<double>> R);
int main(){

    //double A[3][3]= {{1.0,2.0,3.0},{4.0,5.0,6.0},{7.0,8.0,9.0}};
    std::vector<std::vector<double>> A2 = { {1.0, 2.0, 3.0}, {5.0, 6.0,7.0}, {9.0,10.0,11.0} };
    transpuesta(A2);
    /* double A[3][3]= {{1.5,2.0,3.0},{3.9,4.7,2.0},{2.5,7.0,4.0}};
    double B[3][2] = {{5.0,6.0},{7.44,8.03},{9.0,12.0}};

    int sizeA  = sizeof(A)/sizeof(*A);
    int n = sizeof(B)/sizeof(*B);
    int sizeCB = sizeof(B[0])/sizeof(*B[0]);

    double vectR[sizeA][sizeCB] = {};
    int sizeR  = sizeof(vectR)/sizeof(*vectR);
    int sizeR1  = sizeof(vectR[0])/sizeof(*vectR[0]);
    std::cout<< sizeR <<" "<< sizeR1 << std::endl;

    for(int h = 0;h < sizeR;h++){
        for(int m; m < sizeR1; m++){
            vectR[h][m] = 0.0;
        }
    }
    for(int i = 0; i < sizeR;i++){
        for(int j = 0;j < sizeR1;j++){
            for(int k = 0;k < n;k++){
                vectR[i][j] += A[i][k]*B[k][j];
               
            }
        }
    }
  
    for(int k = 0;k <sizeR;k++){
            for(int l = 0;l<sizeR1;l++){
                std::cout<<" "<<vectR[k][l]<<" ";
            }
            cout<<"\n";
        }*/

    /*int sizeA  = sizeof(A)/sizeof(*A);
    int sizeCA = sizeof(A[0])/sizeof(*A[0]);
    double T[sizeA][sizeCA] = {};
    for(int i = 0;i < sizeA; i++){
        for(int j = 0;j < sizeCA; j++){
            T[i][j] = A[j][i];
        }
    }
    for(int k = 0;k <sizeA;k++){
            for(int l = 0;l<sizeCA;l++){
                std::cout<<" "<<T[k][l]<<" ";
            }
            cout<<"\n";
        }*/
}


void printMatrix(std::vector<std::vector<double>> R){
    int sizeR  = R.size();
    int sizeR1 = R[0].size();
    for(int k = 0;k <sizeR;k++){
            for(int l = 0;l<sizeR1;l++){
                std::cout<<" "<<R[k][l]<<" ";
            }
            cout<<"\n";
        }
}