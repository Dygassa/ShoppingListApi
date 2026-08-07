@echo off
setlocal enabledelayedexpansion
set SERVER=localhost\sqlexpress
set DB=ShoppingList

echo ==============================
echo SQL migrations and procedures updating in database '%DB%' on server '%SERVER%'...
echo ==============================

FOR /R %%G IN (04*.sql 05*.sql) DO (
    echo %%G | find /I "\External\" >nul

    if errorlevel 1 (
        SQLCMD -S %SERVER% -d %DB% -E -I -b -i"%%G" -f 65001

        if errorlevel 1 (
            echo [ERR] %%~nxG
        ) else (
            echo [OK] %%~nxG
        )
    ) else (
        echo [SKIPPED] External\%%~nxG
    )
)

echo ==============================
echo Finished.
echo ==============================
PAUSE
