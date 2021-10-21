lscpu | grep -e '^CPU(s)' | awk '{print "CPU : " $2}'
free -h | grep Mem | awk '{print "Mémoire : " $2}'
free -h | grep Swap | awk '{print "Swap : " $2}'
echo