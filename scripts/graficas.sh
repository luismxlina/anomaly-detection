#!/bin/bash



paths=(Local OpenNebula);
types=(pruebas_1_segundo pruebas_30_segundos redes);


for path in "${paths[@]}";do
    for type in "${types[@]}";do
        for fich in $(ls "./formateados/$path/$type"|grep CPU);do
           cat << _end_ | gnuplot


set term png
set output "$fich.png" # nombre del fichero ue se guarda
set datafile separator ","
set key right bottom # Posición d ela leyenda
set xlabel "Título del eje X" # título del eje X
set ylabel "Título del eje Y" # Título dle eje Y
plot './formateados/$path/$type/$fich' using 1:2 t "Datos segunda columna" w l, './formateados/$path/$type/$fich' using 1:3 t "Datos tercera columna" w l, './formateados/$path/$type/$fich' using 1:4 t "Datos cuarta columna" w l
_end_

        done
    done
done