$ErrorActionPreference = 'Stop'
& (Join-Path $PSScriptRoot 'build.ps1')
$projectRoot = Split-Path $PSScriptRoot -Parent
Push-Location $projectRoot
try {
    $runtime = if ($env:JAVA_HOME) { Join-Path $env:JAVA_HOME 'bin\java.exe' } else { 'java' }
    & $runtime -cp 'build/classes;lib/*' com.transport.main
    if ($LASTEXITCODE -ne 0) { throw 'Application stopped with an error.' }
} finally { Pop-Location }
