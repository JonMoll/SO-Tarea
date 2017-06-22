a=0
b=1

echo $a
echo $b

contador=0

#for i in 1 2 3 4 5
while [ 1 -eq 1 ]
do
    c=$(($a+$b))
    echo $c

    a=$b
    b=$c

    contador=$(($contador+1))

    if [ "$contador" = 10 ]; then
        echo -n > /home/jonathan/git/SO-Tarea/log.txt # Limpiamos el log
        contador=0
    fi;
done
