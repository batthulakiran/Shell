#!/bi/bash
Timestamp=$(date)
echo "Time is $Timestamp"
Start_time=$(date +%s)
sleep 10
end_time=$(date +%s)
Total_time= $(($Start_time-$end_time))

echo " Execution time is $total_tiem"