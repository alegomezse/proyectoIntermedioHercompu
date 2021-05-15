all: datosEigentranspuesta.txt datosEigenMulti.txt datosTranspuesta.txt datosTranspuestaO3.txt datosMulti.txt datosMultiArmadillo.txt datosTransArmadillo.txt
papiTranspuestaEigen.x: papiTranspuestaEigen.cpp
	g++ papiTranspuestaEigen.cpp -o papiTranspuestaEigen.x -lpapi 
datosEigentranspuesta.txt: papiTranspuestaEigen.x
	./papiTranspuestaEigen.x 100 > datosEigentranspuesta.txt
papiMultiplicacionEigen.x: papiMultiplicacionEigen.cpp
	g++ papiMultiplicacionEigen.cpp -o papiMultiplicacionEigen.x -lpapi
datosEigenMulti.txt: papiMultiplicacionEigen.x
	./papiMultiplicacionEigen.x 100 > datosEigenMulti.txt
papiMultiplicacion.x:papiMultiplicacion.cpp
	g++ papiMultiplicacion.cpp -o papiMultiplicacion.x -lpapi
datosMulti.txt:papiMultiplicacion.x
	 ./papiMultiplicacion.x 100 > datosMulti.txt
papiMultiplicacionArmadillo.x: papiMultiplicacionArmadillo.cpp
	g++ papiMultiplicacionArmadillo.cpp -o papiMultiplicacionArmadillo.x -lpapi -larmadillo
datosMultiArmadillo.txt: papiMultiplicacionArmadillo.x
	./papiMultiplicacionArmadillo.x 100 > datosMultiArmadillo.txt
papiTranspuestaArmadillo.x: papiTranspuestaArmadillo.cpp
	g++ papiTranspuestaArmadillo.cpp -o papiTranspuestaArmadillo.x -lpapi -larmadillo
datosTransArmadillo.txt: papiTranspuestaArmadillo.x
	./papiTranspuestaArmadillo.x 100 > datosTransArmadillo.txt
papiTranspuesta.x: papiTranspuesta2.cpp
	g++ papiTranspuesta2.cpp -o papiTranspuesta.x -lpapi -O0
datosTranspuesta.txt: papiTranspuesta.x
	./papiTranspuesta.x 100 > datosTranspuesta.txt
papiTranspuestaO3.x: papiTranspuesta2.cpp
	g++ papiTranspuesta2.cpp -o papiTranspuestaO3.x -lpapi -O3
datosTranspuestaO3.txt: papiTranspuestaO3.x
	./papiTranspuesta.x 100 > datosTranspuestaO3.txt


clean:
	rm -f datosEigentranspuesta.txt  datosEigenMulti.txt datosTranspuesta.txt datosTranspuestaO3.txt datosMulti.txt datosMultiArmadillo.txt papiTranspuestaEigen.x papiMultiplicacionEigen.x papiMultiplicacion.x papiTranspuesta.x papiTranspuestaO3.x papiMultiplicacionArmadillo.x papiTranspuestaArmadillo.x 
