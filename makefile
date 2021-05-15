all: datosEigentranspuesta.txt datosEigenMulti.txt datosTranspuesta.txt datosMulti.txt datosMultiArmadillo.txt
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
papiTranspuesta.x: papiTranspuesta.cpp
	g++ papiTranspuesta.cpp -o papiTranspuesta.x -lpapi
datosTranspuesta.txt: papiTranspuesta.x
	./papiTranspuesta.x 100 > datosTranspuesta.txt
papiMultiplicacionArmadillo.x: papiMultiplicacionArmadillo.cpp
	g++ papiMultiplicacionArmadillo.cpp -o papiMultiplicacionArmadillo.x -lpapi -larmadillo
datosMultiArmadillo.txt: papiMultiplicacionArmadillo.x
	./papiMultiplicacionArmadillo.x 100 > datosMultiArmadillo.txt

clean:
	rm -f datosEigentranspuesta.txt  datosEigenMulti.txt datosTranspuesta.txt datosMulti.txt datosMultiArmadillo.txt papiTranspuestaEigen.x papiMultiplicacionEigen.x papiMultiplicacion.x papiTranspuesta.x papiMultiplicacionArmadillo.x 
