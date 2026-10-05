#!/usr/bin/env bash
# Compile the CV and one-page resume into build/
set -euo pipefail
cd "$(dirname "$0")"

mkdir -p build

build() {
  echo "Building $1 ..."
  pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build "$1"
}

build cv.tex
build resume.tex

echo
echo "Done."
echo "  build/cv.pdf"
echo "  build/resume.pdf"
