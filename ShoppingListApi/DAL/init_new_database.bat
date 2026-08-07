@echo off
setlocal enabledelayedexpansion
set SERVER=localhost\sqlexpress
set DB=ShoppingList

echo ==============================
echo Initializing new database '%DB%' on server '%SERVER%'...
echo ==============================
echo.

FOR %%G IN (%cd%\01_Setups\01_00_db_init.sql) DO (
    SQLCMD -S %SERVER% -E -I -b -i "%%G"

    if errorlevel 1 (
        echo [ERR] %%~nxG
    ) else (
        echo [OK] %%~nxG
    )
)

FOR /r %%G IN (01*.sql, 02*.sql, 03*.sql) DO (
    SQLCMD -S %SERVER% -d %DB% -E -I -b -i "%%G" -f 65001

    if errorlevel 1 (
        echo [ERR] %%~nxG
    ) else (
        echo [OK] %%~nxG
    )
)

echo.
echo ==============================
echo Finished.
echo ==============================
PAUSE
