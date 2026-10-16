@echo off
setlocal
title Parche comfyui-impact-pack
REM Comenta el bloque "if(link_info.target_slot == 0 && this.inputs.length > 3) {...}"
REM de comfyui-impact-pack\js\impact-pack.js, que rompe con el nuevo frontend de ComfyUI.
REM Uso: colocar en ComfyUI_windows_portable (o dentro de ComfyUI) y ejecutar,
REM      o pasar la ruta de impact-pack.js como argumento.

set "IMPACT_JS=%~1"
if not defined IMPACT_JS if exist "%~dp0ComfyUI\custom_nodes\comfyui-impact-pack\js\impact-pack.js" set "IMPACT_JS=%~dp0ComfyUI\custom_nodes\comfyui-impact-pack\js\impact-pack.js"
if not defined IMPACT_JS if exist "%~dp0custom_nodes\comfyui-impact-pack\js\impact-pack.js" set "IMPACT_JS=%~dp0custom_nodes\comfyui-impact-pack\js\impact-pack.js"

if not defined IMPACT_JS (
    echo [ERROR] No se encuentra comfyui-impact-pack\js\impact-pack.js
    echo         Coloca este .bat en ComfyUI_windows_portable o pasa la ruta como argumento.
    pause
    exit /b 1
)
if not exist "%IMPACT_JS%" (
    echo [ERROR] No existe: %IMPACT_JS%
    pause
    exit /b 1
)

echo Fichero: %IMPACT_JS%
set "SELF=%~f0"
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex (([IO.File]::ReadAllText($env:SELF)) -split ('#PS'+'_SCRIPT#'))[1]"
set "RC=%ERRORLEVEL%"
pause
exit /b %RC%

#PS_SCRIPT#
$path = $env:IMPACT_JS
$text = [IO.File]::ReadAllText($path)

if ($text -match '(?m)^\s*//\s*if\s*\(\s*link_info\.target_slot\s*==\s*0\s*&&\s*this\.inputs\.length\s*>\s*3\s*\)') {
    Write-Host '[OK] El fichero ya estaba parcheado. No se ha cambiado nada.' -ForegroundColor Green
    exit 0
}

$pattern = '(?m)^([ \t]*)(if\s*\(\s*link_info\.target_slot\s*==\s*0\s*&&\s*this\.inputs\.length\s*>\s*3\s*\)\s*\{[^\r\n]*\r?\n)' +
           '([ \t]*)(origin_type\s*=\s*this\.inputs\[1\]\.type;[^\r\n]*\r?\n)' +
           '([ \t]*)(node\.connect\(\s*link_info\.origin_slot\s*,\s*node\.id\s*,\s*''input1''\s*\);[^\r\n]*\r?\n)' +
           '([ \t]*)(\})'

$regex = [regex]$pattern
$count = $regex.Matches($text).Count
if ($count -eq 0) {
    Write-Host '[AVISO] No se ha encontrado el bloque a parchear (quiza la version de Impact Pack ha cambiado).' -ForegroundColor Yellow
    exit 2
}

$patched = $regex.Replace($text, '$1//$2$3//$4$5//$6$7//$8')

$backup = $path + '.bak'
if (-not (Test-Path -LiteralPath $backup)) { Copy-Item -LiteralPath $path -Destination $backup }

# Conserva la codificacion original (UTF-8 sin BOM salvo que ya lo tuviera)
$bytes = [IO.File]::ReadAllBytes($path)
$hasBom = $bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF
[IO.File]::WriteAllText($path, $patched, (New-Object Text.UTF8Encoding($hasBom)))

Write-Host "[OK] Parche aplicado ($count bloque/s comentado/s). Copia de seguridad: $backup" -ForegroundColor Green
Write-Host '     Recarga ComfyUI en el navegador (Ctrl+F5) para que coja el cambio.'
exit 0
