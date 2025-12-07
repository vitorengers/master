#!/bin/bash
# =============================================================================
# Master Thesis LaTeX Project - Setup Script
# =============================================================================
# This script installs all required dependencies for building the thesis
# on a fresh Ubuntu/WSL installation.
#
# Usage: chmod +x setup.sh && ./setup.sh
# =============================================================================

set -e  # Exit on error

echo "=============================================="
echo "  Master Thesis LaTeX Project Setup"
echo "=============================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print status
print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    print_warning "Running as root. Proceeding..."
    SUDO=""
else
    SUDO="sudo"
fi

# Update package lists
echo ""
echo "Updating package lists..."
$SUDO apt-get update -qq

# Install TeXLive and required packages
echo ""
echo "Installing TeXLive (this may take a few minutes)..."
$SUDO apt-get install -y \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-lang-portuguese \
    texlive-fonts-recommended \
    texlive-bibtex-extra \
    texlive-publishers \
    biber \
    latexmk \
    --quiet

print_status "TeXLive installed"

# Install additional useful tools
echo ""
echo "Installing additional tools..."
$SUDO apt-get install -y \
    poppler-utils \
    --quiet

print_status "PDF utilities installed (pdfinfo, pdftotext)"

# Create project directories if they don't exist
echo ""
echo "Creating project directories..."
mkdir -p papers figs notes
print_status "Directories created: papers/, figs/, notes/"

# Build the PDF
echo ""
echo "Building the thesis PDF..."
if command -v pdflatex &> /dev/null; then
    pdflatex -interaction=nonstopmode main.tex > /dev/null 2>&1 || true
    bibtex main > /dev/null 2>&1 || true
    pdflatex -interaction=nonstopmode main.tex > /dev/null 2>&1 || true
    pdflatex -interaction=nonstopmode main.tex > /dev/null 2>&1 || true
    
    if [ -f "main.pdf" ]; then
        print_status "PDF built successfully: main.pdf"
        echo ""
        echo "  File size: $(ls -lh main.pdf | awk '{print $5}')"
    else
        print_error "PDF build failed. Check main.log for errors."
    fi
else
    print_error "pdflatex not found. Installation may have failed."
fi

# Summary
echo ""
echo "=============================================="
echo "  Setup Complete!"
echo "=============================================="
echo ""
echo "To build the thesis manually:"
echo "  pdflatex main.tex && bibtex main && pdflatex main.tex && pdflatex main.tex"
echo ""
echo "Or use latexmk for automatic rebuilds:"
echo "  latexmk -pdf main.tex"
echo ""
echo "To clean build artifacts:"
echo "  latexmk -c"
echo ""
