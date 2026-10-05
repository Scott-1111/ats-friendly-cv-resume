# ATS-Friendly CV and Resume Generator

Plain-text LaTeX templates for a multi-page **CV** and a one-page **resume**. Both compile to selectable, parser-friendly PDFs: single column, standard fonts, real text, and dates on the same line as each role.

The header can show **website**, **call**, and **LinkedIn** icons from the `pictures/` folder. The same contact text still appears next to each icon so applicant-tracking systems can read it.

## What’s included

| File | Purpose |
| --- | --- |
| `cv.tex` | Multi-page CV template (full history, projects, affiliations, references) |
| `resume.tex` | One-page resume template (3–4 roles, condensed skills) |
| `contact.tex` | Name, email, phone, website, LinkedIn — edit this once |
| `style.tex` | Shared layout, section style, and icon helpers |
| `pictures/` | Drop `website.png`, `call.png`, and `linkedin.png` here |
| `build.ps1` / `build.sh` | Compile both templates to `build/` |

Sample content uses a fictional person (**Alex M. Rivera**). Replace every placeholder before you send a PDF.

## Prerequisites

You need a LaTeX engine that provides `pdflatex`.

- **Windows:** [MiKTeX](https://miktex.org/) (used to develop this project)
- **macOS:** [MacTeX](https://www.tug.org/mactex/)
- **Linux:** TeX Live (`sudo apt install texlive-latex-recommended texlive-latex-extra` on Debian/Ubuntu)
- **No local install:** [Overleaf](https://www.overleaf.com/) (see below)

Optional: [latexmk](https://mg.readthedocs.io/latexmk.html) if you want auto-rebuild on save.

## Quick start

1. Clone this repository.
2. Replace the sample values in `contact.tex`.
3. Put your icons in `pictures/` using these exact names:
   - `website.png`
   - `call.png`
   - `linkedin.png`
4. Edit `cv.tex` and/or `resume.tex` with your own sections.
5. Build the PDFs.

### Windows (PowerShell)

```powershell
.\build.ps1
```

The script writes `build/cv.pdf` and `build/resume.pdf`.

To compile one file yourself:

```powershell
New-Item -ItemType Directory -Force -Path build | Out-Null
pdflatex -interaction=nonstopmode -output-directory=build cv.tex
pdflatex -interaction=nonstopmode -output-directory=build resume.tex
```

### macOS and Linux

```bash
chmod +x build.sh
./build.sh
```

Or:

```bash
mkdir -p build
pdflatex -interaction=nonstopmode -output-directory=build cv.tex
pdflatex -interaction=nonstopmode -output-directory=build resume.tex
```

### Overleaf

1. Upload the project as a zip, or copy `cv.tex`, `resume.tex`, `contact.tex`, `style.tex`, and the `pictures/` folder.
2. Set the main document to `cv.tex` or `resume.tex`.
3. Use the **pdfLaTeX** compiler.
4. Download the PDF.

## How to customize

### 1. Contact details

Open `contact.tex` and change every `\newcommand`. Both templates read this file, so the header stays in sync.

```tex
\newcommand{\name}{YOUR NAME}
\newcommand{\email}{you@example.com}
\newcommand{\phone}{+1 (555) 010-1234}
\newcommand{\location}{City, Country}
\newcommand{\websiteurl}{https://your-site.example}
\newcommand{\websitetext}{your-site.example}
\newcommand{\linkedinurl}{https://www.linkedin.com/in/your-handle/}
\newcommand{\linkedintext}{linkedin.com/in/your-handle}
```

### 2. Icons in `pictures/`

The header calls three PNG files:

| Filename | Used for |
| --- | --- |
| `pictures/website.png` | Personal site |
| `pictures/call.png` | Phone number |
| `pictures/linkedin.png` | LinkedIn profile |

Use a square PNG with a transparent background (256×256 or larger works well). Dark, single-color artwork prints cleanly.

This repo ships simple placeholder icons so a first build succeeds. Replace them with your own PNGs — the filenames must stay the same, or update `\contactheader` in `style.tex`.

To hide an icon, remove its `\iconlink{...}` line from `\contactheader` in `style.tex`. Keep the visible text; do not replace phone or email with an icon-only graphic if you care about ATS parsing.

### 3. Choose CV or resume

- **`cv.tex`** — longer history: more jobs, projects, affiliations, certifications, optional references.
- **`resume.tex`** — one page: a short summary, education, 3–4 roles, compact skills.

Copy a template if you want role-specific versions (`resume-software.tex`, `cv-academic.tex`, and so on). Point each copy at the same `contact.tex` and `style.tex`.

### 4. Edit a role

```tex
\entry{Organization Name}{January 2024 -- Present}
\role{Job Title}
\begin{itemize}
    \item Start with a verb. Add a tool or result when you can.
    \item Keep each bullet to one or two lines.
\end{itemize}
```

`\entry` puts the organization and dates on one line so parsers keep them together.

## ATS and layout guidelines

- Stay single column. Do not put the main history in a table or text box.
- Keep contact details as real text next to icons.
- Use standard section names: Education, Experience, Skills, Projects, Certifications.
- Bold tools and job-posting keywords inside normal sentences.
- Avoid headers, footers, and text hidden behind images.
- Rebuild and open the PDF after each edit. Confirm the resume is still one page.

## Project layout

```
.
├── cv.tex              # CV template
├── resume.tex          # One-page resume template
├── contact.tex         # Shared contact details
├── style.tex           # Shared style and icon helpers
├── pictures/           # website.png, call.png, linkedin.png
├── build.ps1           # Windows build
├── build.sh            # macOS / Linux build
├── LICENSE
└── README.md
```

Generated files land in `build/` and are gitignored.

## Contributing

Issues and pull requests are welcome. Please keep templates ATS-safe (single column, real text, no tables in the body) and leave sample names fictional so nobody publishes a real address by accident.

## License

[MIT](LICENSE)
