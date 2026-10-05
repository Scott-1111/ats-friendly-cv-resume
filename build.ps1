# Compile the CV and one-page resume into build/
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $root

New-Item -ItemType Directory -Force -Path build | Out-Null

function Invoke-PdfLatex([string]$file) {
    Write-Host "Building $file ..."
    & pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build $file | Out-Host
    if ($LASTEXITCODE -ne 0) {
        throw "pdflatex failed for $file"
    }
}

Invoke-PdfLatex "cv.tex"
Invoke-PdfLatex "resume.tex"

Write-Host ""
Write-Host "Done."
Write-Host "  build/cv.pdf"
Write-Host "  build/resume.pdf"
