#!/bin/bash

# Создание отчета в report.txt
{   echo "Отчет о логе веб-сервера"
    echo ""
    echo "========================="
    echo ""
    echo -n "Общее количество запросов: "
    awk 'END {print NR}' access.log
    
    echo -n "Количество уникальных IP-адресов: "
    awk '{print $1}' access.log | sort | uniq | wc -l
    echo ""
    
    echo "Количество запросов по методам:"
    awk '{print $6}' access.log | tr -d '"' | sort | uniq -c | sort -nr
    echo ""
    
    echo "Самый популярный URL:"
    awk '{print $7}' access.log | sort | uniq -c | sort -nr | head -n 1
    echo ""
} > report.txt

 echo "Отчет сохранен в файл report.txt"