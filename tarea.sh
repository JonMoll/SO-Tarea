# Ejecutar el script cada vez que se inicie Ubuntu:
# 1. Le damos permiso de ejecucion:
#    sudo chmod +x tarea.sh
# 2. Abrimos el fichero rc.local:
#    sudo nano /etc/rc.local
# 3. Agregamos la instruccion para ejecutar el script (con KDE es konsole):
#    sh /home/jonathan/git/SO-Tarea/tarea.sh
#    exit 0
#    * Nota: el script no se ejectuta en el GUI si no en la consola del OS

# Ejecutar el script cada vez que se inicie Ubuntu (KDE Neon)
# 1. Abrir el menu de autoarranque
# 2. Anadir script:
#    konsole -e sh /home/jonathan/git/SO-Tarea/tarea.sh
#    * Nota: se abrira la aplicacion konsole con el codigo de tarea.sh

echo -n "¿Desea iniciar el script? s/n: "
read iniciar

if [ "$iniciar" = 's' ]; then
    echo "Iniciando...\n"

    # La primera linea del comando w es:
    #  17:41:19 up 42 min,  3 users,  load average: 0,56, 0,67, 0,60
    estado=`w | grep "load average" | cut -d : -f 4 | cut -d ' ' -f 4` # Cuando aun no ha pasado una hora hay 3 :
    #  18:52:13 up  1:24,  3 users,  load average: 0,87, 0,52, 0,48
    #estado=`w | grep "load average" | cut -d : -f 5 | cut -d ' ' -f 4` # Cuando ha pasado una hora hay 4 :

    limite="0.7" # Mientras que estado sea menor que limite
    flag=$(awk -ve=$estado -vl=$limite 'BEGIN{ print e<l?1:0 }')

    contador=0

    while [ "$flag" -eq 1 ]
    do
        echo "[" $contador "] Estado actual:" $estado

        sh /home/jonathan/git/SO-Tarea/fibonacci.sh >> /home/jonathan/git/SO-Tarea/log.txt & # Creando varios procesos fibonacci

        estado=`w | grep "load average" | cut -d : -f 4 | cut -d ' ' -f 4` # Cuando aun no ha pasado una hora hay 3 :
        #estado=`w | grep "load average" | cut -d : -f 5 | cut -d ' ' -f 4` # Cuando ha pasado una hora hay 4 :

        flag=$(awk -ve=$estado -vl=$limite 'BEGIN{ print e<l?1:0 }')
        contador=$(($contador+1))

        sleep 1s
    done

    echo "\nSe ha alcanzado el limite:" $limite
    echo "En 60 segundos se terminara el programa.\n"

    reloj=0
    while [ "$reloj" -le 30 ]
    do
        echo "Reloj:" $reloj
        reloj=$(($reloj+1))
        sleep 1s
    done

    echo -n "\nPresione una tecla para salir."
    read salir
else
    echo "Usted ha salido."
fi;
