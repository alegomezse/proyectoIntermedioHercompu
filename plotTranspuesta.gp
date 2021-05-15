set terminal png
set out 'report/transpuestaSinOptimizar.png'
set xlabel 'Dimension Matriz'
set ylabel 'MFLOPS'
set title  'Comparación de Operación Transpuesta Sin Optimizar'
plot 'datosTranspuesta.txt' using 2:11 w lp, 'datosTransArmadillo.txt' using 2:11 w lp,'datosEigentranspuesta.txt' using 2:11 w lp


set terminal png
set out 'report/transpuestaConOptimizar.png'
set xlabel 'Dimension Matriz'
set ylabel 'MFLOPS'
set title  'Comparación de Operación Transpuesta Con Optimización'
plot 'datosTranspuestaO3.txt' using 2:11 w lp, 'datosTransArmadilloO3.txt' using 2:11 w lp,'datosEigentranspuestaO3.txt' using 2:11 w lp
