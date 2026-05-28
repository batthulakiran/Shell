#!/bin/bash

echo    "All valieables passed to script : $@"
echo    "Number of variables assed : $#"
echo    "First varibale passed:  $1"
echo    "Script name:  $0"
echo    "who is running : $USER"
echo    "whoch directory: $PWD"
echo    "Home Directory: $HOME"
echo    "current directory: $$"
sleep 5 &
echo    "PID of background command running just now: $!"
echo    "Line number: $LINENO"
echo    "executed time: $SECONDS"
echo    " Random number: $RANDOM"