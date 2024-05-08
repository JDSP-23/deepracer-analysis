@echo off
REM Verifica si ya se está ejecutando como administrador
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Ejecutando como administrador...
    goto :continue
) else (
    echo No se está ejecutando como administrador. Intentando elevar privilegios...
    powershell -Command "Start-Process '%0' -Verb RunAs"
    exit
)

:continue

REM Activa el entorno virtual
echo Activando el entorno virtual...
call C:\Users\josed\Desktop\FP\aws-deepracer\deepracer-analysis\venv\Scripts\activate

REM Verifica si el entorno virtual se activó correctamente
where python
if %errorLevel% neq 0 (
    echo No se pudo activar el entorno virtual. Asegúrate de que la ruta a venv\Scripts\activate es correcta.
    pause
    exit
)

REM Ejecuta Jupyter Lab
echo Ejecutando Jupyter Lab...
jupyter lab

if %errorLevel% neq 0 (
    echo No se pudo ejecutar Jupyter Lab. Asegúrate de que Jupyter Lab está instalado en tu entorno virtual.
    pause
    exit
)

REM Espera a que el usuario cierre Jupyter Lab
pause