rm {a,b,c}.{info,error}
cd ~
#Exercice 1
df -h | grep sda[0-9] >> system-report/a.info 2>> system-report/a.error #taille du disque
cat /proc/meminfo >> system-report/a.info 2>> system-report/a.error #taille de la mémoire
cat /proc/cpuinfo >> system-report/a.info 2>> system-report/a.error #nombre de coeurs du cpu
lspci |grep VGA >> system-report/a.info 2>> system-report/a.error #ID du gpu
ID=$(df -h | lspci | grep VGA | cut -d ' ' -f 1)
lspci -v -s ${ID} >> a.info 2>> a.error #détails du gpu

#Exercice 2
du -hs >> system-report/b.info 2>> system-report/b.error #taille du répertoire courant
du -h --max-depth=1 >> system-report/b.info 2>> system-report/b.error #taille des fils du répertoire courant 
quota >> system-report/b.info 2>> system-report/b.error #quota utilisé 

#Exercice 3
top -u $USER >> system-report/c.info 2>> system-report/c.error #10 processus utilisant le plus de mémoire
kill -9 $!
