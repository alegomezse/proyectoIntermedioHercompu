#include <iostream>
#include <armadillo>
using namespace std;
using namespace arma;
int main(){
int x = 2;
    int y = 2;
    mat A(4, 5, fill::randu);
    mat B(5, 4, fill::randu);
    mat tr = A.t();
    mat multi = A*B;
    std::cout<< A << std::endl;
    std::cout<< B << std::endl;
    std::cout<< tr << std::endl;
    std::cout<< multi << std::endl;



}
