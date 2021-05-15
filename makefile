all: datosEigentranspuesta.txt datosEigenMulti.txt datosTranspuesta.txt datosTranspuestaO3.txt datosMulti.txt datosMultiO3.txt datosMultiArmadillo.txt datosTransArmadillo.txt 
papiTranspuestaEigen.x: papiTranspuestaEigen.cpp
	g++ papiTranspuestaEigen.cpp -o papiTranspuestaEigen.x -lpapi 
	g++ papiTranspuestaEigen.cpp -o papiTranspuestaEigenO3.x -lpapi -O3
datosEigentranspuesta.txt: papiTranspuestaEigen.x
	./papiTranspuestaEigen.x 100 > datosEigentranspuesta.txt
	./papiTranspuestaEigenO3.x 100 > datosEigentranspuestaO3.txt
papiMultiplicacionEigen.x: papiMultiplicacionEigen.cpp
	g++ papiMultiplicacionEigen.cpp -o papiMultiplicacionEigen.x -lpapi
	g++ papiMultiplicacionEigen.cpp -o papiMultiplicacionEigenO3.x -lpapi -O3
datosEigenMulti.txt: papiMultiplicacionEigen.x
	./papiMultiplicacionEigen.x 100 > datosEigenMulti.txt
	./papiMultiplicacionEigenO3.x 100 > datosEigenMultiO3.txt
papiMultiplicacion.x:papiMultiplicacion.cpp
	g++ papiMultiplicacion.cpp -o papiMultiplicacion.x -lpapi
datosMulti.txt:papiMultiplicacion.x
	 ./papiMultiplicacion.x 100 > datosMulti.txt
papiMultiplicacionO3.x:papiMultiplicacion.cpp
	g++ papiMultiplicacion.cpp -o papiMultiplicacionO3.x -lpapi -O3
datosMultiO3.txt:papiMultiplicacionO3.x
	 ./papiMultiplicacionO3.x 100 > datosMultiO3.txt
papiMultiplicacionArmadillo.x: papiMultiplicacionArmadillo.cpp
	g++ papiMultiplicacionArmadillo.cpp -o papiMultiplicacionArmadillo.x -lpapi -larmadillo
	g++ papiMultiplicacionArmadillo.cpp -o papiMultiplicacionArmadilloO3.x -lpapi -larmadillo -O3
datosMultiArmadillo.txt: papiMultiplicacionArmadillo.x
	./papiMultiplicacionArmadillo.x 100 > datosMultiArmadillo.txt
	./papiMultiplicacionArmadilloO3.x 100 > datosMultiArmadilloO3.txt
papiTranspuestaArmadillo.x: papiTranspuestaArmadillo.cpp
	g++ papiTranspuestaArmadillo.cpp -o papiTranspuestaArmadillo.x -lpapi -larmadillo
	g++ papiTranspuestaArmadillo.cpp -o papiTranspuestaArmadilloO3.x -lpapi -larmadillo -O3
datosTransArmadillo.txt: papiTranspuestaArmadillo.x
	./papiTranspuestaArmadillo.x 100 > datosTransArmadillo.txt
	./papiTranspuestaArmadilloO3.x 100 > datosTransArmadilloO3.txt
papiTranspuesta.x: papiTranspuesta2.cpp
	g++ papiTranspuesta2.cpp -o papiTranspuesta.x -lpapi -O0
datosTranspuesta.txt: papiTranspuesta.x
	./papiTranspuesta.x 100 > datosTranspuesta.txt
papiTranspuestaO3.x: papiTranspuesta2.cpp
	g++ papiTranspuesta2.cpp -o papiTranspuestaO3.x -lpapi -O3
datosTranspuestaO3.txt: papiTranspuestaO3.x
	./papiTranspuesta.x 100 > datosTranspuestaO3.txt
#transpuestaSinOptimizar.png:plotTranspuesta.gp datosTranspuesta.txt datosTransArmadillo.txt datosEigentranspuesta.txt
#	gnuplot $<
	
clean:
	rm -f datosEigentranspuesta.txt  datosEigenMulti.txt datosTranspuesta.txt datosTranspuestaO3.txt datosMulti.txt datosMultiArmadillo.txt papiTranspuestaEigen.x papiMultiplicacionEigen.x papiMultiplicacion.x papiMultiplicacionO3.x papiTranspuesta.x papiTranspuestaO3.x papiMultiplicacionArmadillo.x papiTranspuestaArmadillo.x transpuestaSinOptimizar.png datosMultiO3.txt papiMultiplicacionArmadilloO3.x datosMultiArmadilloO3.txt papiMultiplicacionEigenO3.x datosEigenMultiO3.txt papiTranspuestaArmadilloO3.x datosTransArmadilloO3.txt papiTranspuestaEigenO3.x datosEigentranspuestaO3.txt
