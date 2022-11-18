@ECHO OFF
REM よく使用するコマンド集

REM バッチファイルの実行ディレクトリに移動する
CD %~DP0

REM 

REM 本日の日付のフォルダ、ファイルを生成する
SET TODAY=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%
SET CTIME=%TIME:~0,2%%TIME:~3,2%

MKDIR .\%TODAY% 2>NUL
ECHO. >> .\%TODAY%\%TODAY%.txt
ECHO %CTIME: =0% >> .\%TODAY%\%TODAY%.txt

exit