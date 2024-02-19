#!/bin/bash
paths=(Local OpenNebula);
types=(pruebas_1_segundo pruebas_30_segundos);

(echo "Start,CPU,%user,%nice,%system,%iowait,%steal,%idle,SimulCalls,time,pc"
for path in "${paths[@]}";do
    for type in "${types[@]}";do
        for fich in $(ls "./$path/$type" |grep CPU);do
            echo $fich|grep -o "[0-9]*"|(
                read num1
                read num2
                #echo "$fich,$num1,$num2,$path"
                for line in $(cat ./$path/$type/$fich|grep '^[0-9].*[^a-z]$'|sed -E 's/,/\./g'|sed -E 's/\s+/,/g' |sed -E 's/://g');do
                echo "$line,$num1,$num2,$path"
                done

            )
        done
    done
done)>CPU.csv
(echo "Start,kbmemfree,kbmemused,%memused,kbbuffers,kbcached,kbcommit,%commit,kbactive,kbinact,kbdirty,SimulCalls,time,pc"
for path in "${paths[@]}";do
    for type in "${types[@]}";do
        for fich in $(ls "./$path/$type" |grep mem);do
            echo $fich|grep -o "[0-9]*"|(
                read num1
                read num2
                #echo "$fich,$num1,$num2,$path"
                for line in $(cat ./$path/$type/$fich|grep '^[0-9].*[^a-z]$'|sed -E 's/,/\./g'|sed -E 's/\s+/,/g' |sed -E 's/://g');do
                echo "$line,$num1,$num2,$path"
                done

            )
        done
    done
done)>MEM.csv

(echo "Start,irec/s,fwddgm/s,idel/s,orq/s,asmrq/s,asmok/s,fragok/s,fragcrt/s,SimulCalls,time,pc"
for path in "${paths[@]}";do
        for fich in $(ls "./$path/redes");do
            echo $fich|grep -o "[0-9]*"|(
                read num1
                read num2
                #echo "$fich,$num1,$num2,$path"
                for line in $(cat ./$path/redes/$fich|grep '^[0-9].*[^a-z]$'|sed -E 's/,/\./g'|sed -E 's/\s+/,/g' |sed -E 's/://g');do
                echo "$line,$num1,$num2,$path"
                done

            )
    done
done)>NET.csv