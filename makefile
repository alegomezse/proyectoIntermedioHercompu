all: datosEigentranspuesta.txt datosEigenMulti.txt datosTranspuesta.txt datosTranspuestaO3.txt datosMulti.txt datosMultiO3.txt datosMultiArmadillo.txt datosTransArmadillo.txt datosTransArmadilloO3.txt datosMultiArmadilloO3.txt datosEigenMultiO3.txt datosEigentranspuestaO3.txt datosTranspuestaBloking.txt datosTranspuestaBlokingO3.txt
papiTranspuestaEigen.x: papiTranspuestaEigen.cpp
	g++ papiTranspuestaEigen.cpp -o papiTranspuestaEigen.x -lpapi
papiTranspuestaEigenO3.x: papiTranspuestaEigen.cpp	
	g++ papiTranspuestaEigen.cpp -o papiTranspuestaEigenO3.x -lpapi -O3
datosEigentranspuesta.txt: papiTranspuestaEigen.x
	./papiTranspuestaEigen.x 350 > datosEigentranspuesta.txt
datosEigentranspuestaO3.txt: papiTranspuestaEigenO3.x
	./papiTranspuestaEigenO3.x 350 > datosEigentranspuestaO3.txt
papiMultiplicacionEigen.x: papiMultiplicacionEigen.cpp
	g++ papiMultiplicacionEigen.cpp -o papiMultiplicacionEigen.x -lpapi
papiMultiplicacionEigenO3.x: papiMultiplicacionEigen.cpp
	g++ papiMultiplicacionEigen.cpp -o papiMultiplicacionEigenO3.x -lpapi -O3
datosEigenMulti.txt: papiMultiplicacionEigen.x
	./papiMultiplicacionEigen.x 350 > datosEigenMulti.txt
datosEigenMultiO3.txt: papiMultiplicacionEigenO3.x	
	./papiMultiplicacionEigenO3.x 350 > datosEigenMultiO3.txt
papiMultiplicacion.x:papiMultiplicacion.cpp
	g++ papiMultiplicacion.cpp -o papiMultiplicacion.x -lpapi
datosMulti.txt:papiMultiplicacion.x
	 ./papiMultiplicacion.x 350 > datosMulti.txt
papiMultiplicacionO3.x:papiMultiplicacion.cpp
	g++ papiMultiplicacion.cpp -o papiMultiplicacionO3.x -lpapi -O3
datosMultiO3.txt:papiMultiplicacionO3.x
	 ./papiMultiplicacionO3.x 350 > datosMultiO3.txt
papiMultiplicacionArmadillo.x: papiMultiplicacionArmadillo.cpp
	g++ papiMultiplicacionArmadillo.cpp -o papiMultiplicacionArmadillo.x -lpapi -larmadillo
papiMultiplicacionArmadilloO3.x: papiMultiplicacionArmadillo.cpp	
	g++ papiMultiplicacionArmadillo.cpp -o papiMultiplicacionArmadilloO3.x -lpapi -larmadillo -O3
datosMultiArmadillo.txt: papiMultiplicacionArmadillo.x
	./papiMultiplicacionArmadillo.x 350 > datosMultiArmadillo.txt
datosMultiArmadilloO3.txt: papiMultiplicacionArmadilloO3.x	
	./papiMultiplicacionArmadilloO3.x 350 > datosMultiArmadilloO3.txt
papiTranspuestaArmadillo.x: papiTranspuestaArmadillo.cpp
	g++ papiTranspuestaArmadillo.cpp -o papiTranspuestaArmadillo.x -lpapi -larmadillo
papiTranspuestaArmadilloO3.x: papiTranspuestaArmadillo.cpp	
	g++ papiTranspuestaArmadillo.cpp -o papiTranspuestaArmadilloO3.x -lpapi -larmadillo -O3
datosTransArmadillo.txt: papiTranspuestaArmadillo.x
	./papiTranspuestaArmadillo.x 350 > datosTransArmadillo.txt
datosTransArmadilloO3.txt: papiTranspuestaArmadilloO3.x	
	./papiTranspuestaArmadilloO3.x 350 > datosTransArmadilloO3.txt
papiTranspuesta.x: papiTranspuesta2.cpp
	g++ papiTranspuesta2.cpp -o papiTranspuesta.x -lpapi -O0
datosTranspuesta.txt: papiTranspuesta.x
	./papiTranspuesta.x 350 > datosTranspuesta.txt
papiTranspuestaO3.x: papiTranspuesta2.cpp
	g++ papiTranspuesta2.cpp -o papiTranspuestaO3.x -lpapi -O3
datosTranspuestaO3.txt: papiTranspuestaO3.x
	./papiTranspuesta.x 350 > datosTranspuestaO3.txt
papiTranspuestaBloking.x: papiTranspuestaBloking.cpp
	g++ papiTranspuestaBloking.cpp -o papiTranspuestaBloking.x -lpapi -O0
datosTranspuestaBloking.txt: papiTranspuestaBloking.x
	./papiTranspuestaBloking.x 450 > datosTranspuestaBloking.txt
papiTranspuestaBlokingO3.x: papiTranspuestaBloking.cpp
	g++ papiTranspuestaBloking.cpp -o papiTranspuestaBlokingO3.x -lpapi -O3
datosTranspuestaBlokingO3.txt: papiTranspuestaBlokingO3.x
	./papiTranspuestaBlokingO3.x 450 > datosTranspuestaBlokingO3.txt

#transpuestaSinOptimizar.png:plotTranspuesta.gp datosTranspuesta.txt datosTransArmadillo.txt datosEigentranspuesta.txt
#	gnuplot $<
	
clean:
	rm -f datosEigentranspuesta.txt  datosEigenMulti.txt datosTranspuesta.txt datosTranspuestaO3.txt datosMulti.txt datosMultiArmadillo.txt papiTranspuestaEigen.x papiMultiplicacionEigen.x papiMultiplicacion.x papiMultiplicacionO3.x papiTranspuesta.x papiTranspuestaO3.x papiMultiplicacionArmadillo.x papiTranspuestaArmadillo.x transpuestaSinOptimizar.png datosMultiO3.txt papiMultiplicacionArmadilloO3.x datosMultiArmadilloO3.txt papiMultiplicacionEigenO3.x datosEigenMultiO3.txt papiTranspuestaArmadilloO3.x datosTransArmadilloO3.txt papiTranspuestaEigenO3.x datosEigentranspuestaO3.txt datosTransArmadillo.txt datosTranspuestaBloking.txt datosTranspuestaBlokingO3.txt papiTranspuestaBlokingO3.x papiTranspuestaBloking.x
