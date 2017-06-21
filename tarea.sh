# Ejecutar el script cada vez que se inicie Ubuntu:
# 1. Le damos permiso de ejecucion:
#    sudo chmod +x tarea.sh
# 2. Abrimos el fichero rc.local:
#    sudo nano /etc/rc.local
# 3. Agregamos la instruccion para ejecutar el script (con KDE es konsole):
#    sh /home/jonathan/git/SO-Tarea/tarea.sh
#    exit 0
#    * Nota: el script no se ejectuta en el GUI si no en la consola del OS
#
# Ejecutar script cada vez que inicie KDE Neon
# 1. Abrir el menu de autoarranque
# 2. Anadir script:
#    konsole -e sh /home/jonathan/git/SO-Tarea/tarea.sh

echo -n "¿Desea iniciar el script? s/n: "
read iniciar

if [ "$iniciar" = 's' ]; then
    echo "Iniciando..."
    read salir
else
    echo "Usted ha salido."
fi;
