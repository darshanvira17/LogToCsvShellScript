#! /bin/bash

#Path to the working directory
path="/path/to/your/Log/File"


# Additional column is added to the SQL results for greping only the Values returned by the query not the column headers
 grep '^|DATA' ${path}/YourLog.log > ${path}/stats1.dat
 
 #Create a variable for the headings
 headval="emp_id,emp_salary,emp_name" #Replace with the Column names
 # Insert headings into output file
 echo $headval > ${path}/stats2.dat
 
 # Remove all , from names column
 sed -e 's/,//g' ${path}/stats1.dat > ${path}/stats3.dat
 
 # Replace all the | characters with a comma
 sed -e 's/|/,/g' ${path}/stats3.dat > ${path}/stats4.dat

 # Remove all spaces -- Not necessary as it removes Spaces from VARCHAR values as well e.g.Luke Skywalker -> LukeSkywalker
 #can be used without errors when space is not importnat or the log file just has numbers. Doesn't make difference in end result
 #sed -e 's/ //g' ${path}/stats3.dat  > ${path}/stats4.dat
 
 # Copy headings and data in a single output file
 cat ${path}/stats2.dat ${path}/stats4.dat > ${path}/stats5.dat
 
 # Remove all ',DATA  ,' 
 sed -e 's/,DATA  ,//g' ${path}/stats5.dat > ${path}/Test.csv #FINAL CSV generated

#Clean up and remove all the stats files generated!
rm ${path}/stats*.dat