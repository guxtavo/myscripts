#!/bin/bash
answer=$(dialog --stdout --checklist "Please select the Playbook items" 0 0 0 "BDS001" 'Basics - data - sosreport' off "BDP001" 'Basics - data - perf | oprofile | strace | stap' off "KPF001" 'Kernel - performance' off "KPI001" 'Kernel - performance - high io wait' off "KPL001" 'Kernel - performance - high load' off "KMM001" 'Kernel - memory management' off "KMF002" 'Kernel - memory management - memory full  | cache full' off "KPH001" 'Kernel - panics hungs' off "KBC001" 'Kernel - boot - cannot boot' off "KBU001" 'Kernel - boot - unexpected reboot' off "KVC001" 'Kernel - vmcore - how to collect vmcore - sysrq | tunables' off "KVC002" 'Kernel - vmcore - how to collect vmcore - vmware' off "KTO001" 'Kernel - tunning - oracle' off KTD001 'Kernel - tunning - database' off)

exitstatus=$?
if [ $exitstatus = 0 ]; then
     clear

echo " =============================================================================="
echo 
echo " Please find here this case's Playbook. Please feel free to add any links to"
echo " the Playbook."
echo 
     egrep -A 3 "${answer// /|}" pb.db | egrep -v ${answer// /|}

echo " We higly recommend you to read all of them in case you have a severe problem."
echo " Our engineers will evaluate if those solutions are pertinent to the case or  "
echo " not."

echo " =============================================================================="

else
    clear
    echo "You chose Cancel."
fi
