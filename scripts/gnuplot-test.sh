#Autor: Francisco Javier Rodriguez Lozano
#email: fj.rodriguez@uco.es
#para ejecutar este script probablemente necesite darle permisos de ejecución con 'chmod'

#!/bin/bash

cat << _end_ | gnuplot

#para guardar en .eps
#-------------------
#set terminal postscript eps color
#set output "nombreGrafico.eps"  # nombre del fichero ue se guarda

#para guardar en .png
#-------------------
set term png
set output "nombreGrafico.png" # nombre del fichero ue se guarda

#para guardar en .pdf
#-------------------
#set terminal pdf
#set output "nombreGrafico.pdf"  # nombre del fichero ue se guarda

set key right bottom # Posición d ela leyenda
set xlabel "Título del eje X" # título del eje X
set ylabel "Título del eje Y" # Título dle eje Y
plot 'DatosI.txt' using 1:2 t "Datos segunda columna" w l, 'DatosI.txt' using 1:3 t "Datos tercera columna" w l, 'DatosI.txt' using 1:4 t "Datos cuarta columna" w l
#La primera columna en este ejemplo corresponde con el eje X
# si no se desean líneas y se quieren puntos en el grafico, cambiar la 'l' por una 'p'. La estructura de las línea anterior quiere decir, dibujar del fichero 'DatosI.txt' la columna 2 (eje Y) respecto a los datos de la columna 1 (eje x) con un alínea que teng el título 'Datos segunda columna'. las demás serían de forma similar. Esto nos permite además, dibujar de varios ficheros fácilmente.
_end_
