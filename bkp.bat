set myfile=%time%
set myfile=_%date:~6,4%-%date:~3,2%-%date:~0,2%_%myfile:~0,2%.%myfile:~3,2%.%myfile:~6,2%


MD d:\bkp\

SET myfile=BACKUP DATABASE LCS_v2 TO DISK = 'd:\bkp\%myfile%.bkp' 
rem osql -U sa -Q "%myfile%" -P mens-hb26


FORFILES /p d:\bkp\ /D -30 /C "cmd /c del @path /q"
