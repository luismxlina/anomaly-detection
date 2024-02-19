#!/bin/bash



paths=(Local OpenNebula);
types=(pruebas_1_segundo pruebas_30_segundos redes);


for path in "${paths[@]}";do
    for type in "${types[@]}";do
        for fich in $(ls "./Capturas_Pruebas/$path/$type");do
            echo $fich|grep -o "[0-9]*"|(
                read num1
                read num2
                cat ./Capturas_Pruebas/$path/$type/$fich|grep '^[0-9].*[^a-z]$'|nl|sed -E 's/,/\./g'|sed -E 's/\s+/,/g'|sed -E 's/://g'>./formateados/$path/$type/$fich
            )
        done
    done
done