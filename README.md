# Master Thesis: Radio Occultation with CubeSats

**ALGORITMOS DE PREDIÇÃO PARA RÁDIO-OCULTAÇÃO EM CUBESATS: IMPLEMENTAÇÃO E COMPARATIVO ENTRE PLATAFORMAS FPGA E MICROCONTROLADOR**

*Prediction Algorithms for Radio Occultation in CubeSats: Implementation and Comparison Between FPGA and Microcontroller Platforms*

**Author:** Vitor Diego Dias Engers  
**Advisor:** Prof. Bezerra, Dr  
**Institution:** Universidade Federal de Santa Catarina - Centro Tecnológico de Joinville

---

## Quick Start

### 1. Clone and Setup (Fresh WSL/Ubuntu)

```bash
# Clone the repository
git clone <repository-url>
cd master

# Run the setup script (installs TeXLive and dependencies)
chmod +x setup.sh
./setup.sh
```

The setup script will:
- Install TeXLive with Portuguese language support
- Install abnTeX2 (Brazilian academic formatting)
- Create required directories (`papers/`, `figs/`, `notes/`)
- Build the PDF automatically

### 2. Build the PDF Manually

```bash
# Full build (required for citations)
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex

# Or use latexmk (automatic)
latexmk -pdf main.tex
```

### 3. View the PDF

```bash
# Open with default viewer (Linux)
xdg-open main.pdf

# Or in VS Code, just click main.pdf in the explorer
```

---

## Project Structure

```
master/
├── main.tex              # Main document (compiles everything)
├── setup.tex             # Packages and configuration
├── references.bib        # Bibliography (BibTeX)
├── setup.sh              # Installation script
├── chapters/
│   ├── chapter1.tex      # Introduction
│   └── chapter2.tex      # Methodology (Radio Occultation)
├── pretextual/           # Cover, abstract, dedication, etc.
├── papers/               # PDF articles for references
├── figs/                 # Figures and images
└── notes/                # Research notes (optional)
```

---

## Writing Guidelines

### Citations

Use ABNT-style citations (abnTeX2):
```latex
\cite{Kursinski1997GPSRO}           % (KURSINSKI et al., 1997)
\cite{Anthes2011ROReview}           % (ANTHES, 2011)
```

### Adding References

1. Add BibTeX entry to `references.bib`
2. Use consistent key format: `AuthorYearShortTitle`
3. Rebuild with bibtex

### Figures

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{figs/your_figure.png}
    \caption{Description of the figure.}
    \label{fig:your_label}
\end{figure}
```

---

## Dependencies

| Package | Purpose |
|---------|---------|
| `texlive-latex-base` | Core LaTeX |
| `texlive-latex-extra` | Additional packages |
| `texlive-lang-portuguese` | Portuguese hyphenation |
| `texlive-publishers` | abnTeX2 class |
| `texlive-bibtex-extra` | Bibliography styles |
| `biber` | Modern bibliography processor |

---

## Troubleshooting

### "File `abntex2.cls' not found"
```bash
sudo apt install texlive-publishers
```

### Undefined citations
Run the full build sequence (pdflatex → bibtex → pdflatex → pdflatex).

### Missing fonts
```bash
sudo apt install texlive-fonts-recommended texlive-fonts-extra
```

---

## License

This thesis template uses [abnTeX2](https://www.abntex.net.br/) for ABNT compliance.
