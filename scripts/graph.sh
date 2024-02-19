#!/bin/bash

cat << _end_ | gnuplot

set term png
set output "nombreGrafico.png" # nombre del fichero que se guarda

set key right bottom # Posición d ela leyenda
set xlabel "Título del eje X" # título del eje X
set ylabel "Título del eje Y" # Título dle eje Y
plot DatosI.txt' using 1:1 t "Datos cuarta columna" w l
_end_
