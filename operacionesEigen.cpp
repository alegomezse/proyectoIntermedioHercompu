#include <iostream>
#include <eigen3/Eigen/Dense>
using namespace Eigen;
using namespace std;
void yourSlowCode(const Eigen::MatrixXd& m, const Eigen::MatrixXd& n);

int main(){
 int x = 2;
 int y = 2;
 Eigen::MatrixXd m = Eigen::MatrixXd::Random(x,y);
 Eigen::MatrixXd n = Eigen::MatrixXd::Random(y,x);

 yourSlowCode(m,n);
 return 0;
}

void yourSlowCode(const Eigen::MatrixXd& m, const Eigen::MatrixXd& n){
    Eigen::MatrixXd multi = m*n;
    Eigen::MatrixXd tr = m.transpose();

    std::cout <<"matriz m :" <<std::endl;
    std::cout <<m<<std::endl;
    std::cout <<"matriz n: " <<std::endl;
    std::cout <<        n    <<std::endl;
    std::cout << "matriz multiplicación: " <<std::endl;
    std::cout << multi <<std::endl;
    std::cout <<"matriz transpuesta de m: "<<std::endl;
    std::cout <<tr <<std::endl;

}
