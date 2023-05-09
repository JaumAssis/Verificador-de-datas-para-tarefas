#!/bin/bash

dateTime=$(date --date="$(date +%Y-%m-01) +1 month -1 day" '+%A-%F') #ultimo dia do mes
lastDayDate=$(date --date="$(date +%Y-%m-01) +1 month -1 day" '+%F')
penumDayDate=$(date --date="$(date +%Y-%m-01) +1 month -2 day" '+%F') #penultimo dia do mes
antPenDayDate=$(date --date="$(date +%Y-%m-01) +1 month -3 day" '+%F') #antepenultimo dia do mes
confirmWeekSun='Sunday-'
confirmWeekSat='Saturday-'
weekSunData=$confirmWeekSun$lastDayDate #usando o $confirmWeekSun$confirmWeekSat pra confirmar que não seja sab e dom no ultimo dia do mes
weekSatData=$confirmWeekSat$lastDayDate
WithoutWeekDate=$(date --date="$(date +%Y-%m-%d)" '+%F') #dia de hoje sem o dia da semana
completeDate=$(date --date="$(date +%Y-%m-%d)" '+%A-%F') #dia de hoje configurado para receber string
dateAndWeek=$completeDate

echo 'Data de hoje com seu respectivo dia da semana:' $dateAndWeek
echo 'Ultimo dia do mês com seu respectivo dia da semana:' $dateTime 
echo 'Pênultimo dia do mês:' $penumDayDate
echo 'Antepenultimo dia do mês:' $antPenDayDate


while [[ $dateTime != $weekSatData && $dateTime != $weekSunData ]]; do
    if [[ $completeDate = $dateTime ]] 
    then
        echo "O dia de hoje é" $dateAndWeek "sendo o ultimo dia do mês, e não caiu em um sabado e nem no domingo."
        break
    else 
        echo "A data de hoje é" $dateAndWeek ", como não é o ultimo dia do mês, não é dia de fazer a rotina."
        break
    fi
done 

while [[ $dateTime == $weekSatData ]]; do
    if [[ $WithoutWeekDate == $penumDayDate ]]
    then
        echo "O dia de hoje é" $penumDayDate "sendo o penultimo dia do mês, pois o ultimo dia do mês cairia em um sabado."
        break
    else 
        echo "A data de hoje é" $completeDate ", ou seja, não fará rotina, e mesmo se o dia de hoje for o ultimo dia, hoje é sabado"
        break
    fi
done

while [[ $dateTime == $weekSunData ]]; do
    if [[ $WithoutWeekDate == $antPenDayDate ]]
    then
        echo "O dia de hoje é" $antPenDayDate "sendo o antepenultimo dia do mês, pois o ultimo dia do mês cairia em um domingo."
        break
    else 
        echo "A data de hoje é" $completeDate ", ou seja, não fará rotina, e mesmo se o dia de hoje for o ultimo dia, hoje é domingo"
        break
    fi 
done

