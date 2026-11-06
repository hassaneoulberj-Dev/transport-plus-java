$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
Push-Location $projectRoot
try {
    $compiler = if ($env:JAVA_HOME) { Join-Path $env:JAVA_HOME 'bin\javac.exe' } else { 'javac' }
    New-Item -ItemType Directory -Path 'build/classes' -Force | Out-Null
    $sources = @(Get-ChildItem -LiteralPath 'src' -Recurse -Filter '*.java' | ForEach-Object FullName)
    & $compiler --release 17 -encoding UTF-8 -d 'build/classes' @sources
    if ($LASTEXITCODE -ne 0) { throw 'Compilation failed. Use a JDK version 17 or newer.' }
    Get-ChildItem -LiteralPath 'src' -Recurse -File | Where-Object Extension -ne '.java' | ForEach-Object {
        $relative = $_.FullName.Substring((Join-Path $projectRoot 'src').Length + 1)
        $destination = Join-Path (Join-Path $projectRoot 'build/classes') $relative
        New-Item -ItemType Directory -Path (Split-Path $destination -Parent) -Force | Out-Null
        Copy-Item -LiteralPath $_.FullName -Destination $destination -Force
    }
    Write-Host 'Compilation OK'
} finally { Pop-Location }
