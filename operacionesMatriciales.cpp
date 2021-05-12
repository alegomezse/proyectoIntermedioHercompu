#include <iostream>
#include <vector>
using namespace std;

std::vector<std::vector<double>>  fillMatrix(std::vector<std::vector<double>> l);
void printMatrix(std::vector<std::vector<double>> R);
void multiplicacion(std::vector<std::vector<double>> A,std::vector<std::vector<double>> B);
void transpuesta(std::vector<std::vector<double>> A);

int main(){
    std::vector<std::vector<double>> A = {{1.5,2.0},{2.5,4.0}};
    std::vector<std::vector<double>> B = {{5.0,6.0},{7.44,8.03}};
    multiplicacion(A,B);
    transpuesta(B);
   
}
  
vector<vector<double>>  fillMatrix(std::vector<std::vector<double>> L){
    int sizeA = L.size();
    int sizeCB = L[0].size();
     for(int ii = 0;ii < sizeA;ii++){
        for(int jj; jj < sizeCB; jj++){
            L[ii][jj] = 0.0;
        }
    }
    return L;
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
void multiplicacion(std::vector<std::vector<double>> A,std::vector<std::vector<double>> B){
    std::cout << "Multiplicación A*B = " << std::endl;
    int sizeA  = A.size();
    int n = B.size();
    int sizeCB = B[0].size();
    std::vector<std::vector<double>> R(sizeA, std::vector<double> (sizeCB, 0));
    R = fillMatrix(R);
    for(int i = 0; i < sizeA;i++){
        for(int j = 0;j < sizeCB;j++){
            for(int k = 0;k < n;k++){
                R[i][j] += A[i][k]*B[k][j];  
            }
        }
    }
    printMatrix(R);
   
    

}
void transpuesta(std::vector<std::vector<double>> A){
    std::cout << "transpuesta = " << std::endl;
    int sizeA  = A.size();
    int sizeCA = A[0].size();
    if(sizeA != sizeCA){
        sizeA  = A[0].size();
        sizeCA = A.size();
    }
    std::vector<std::vector<double>> T(sizeA, std::vector<double> (sizeCA, 0));   
        for(int i = 0;i < sizeA; i++){
                for(int j = 0;j < sizeCA; j++){
                    T[i][j] = A[j][i];
                }
            }                
    printMatrix(T);

}