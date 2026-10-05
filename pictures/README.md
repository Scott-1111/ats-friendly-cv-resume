# Pictures

Put the header icons here. The templates look for these exact filenames:

| File | Shown next to |
| --- | --- |
| `website.png` | Personal website |
| `call.png` | Phone number |
| `linkedin.png` | LinkedIn profile |

## Recommendations

- PNG with a transparent background
- Square, at least 256×256 pixels
- Dark single-color mark so it stays readable in print
- Keep the matching text in `contact.tex` — icons are decoration, not a replacement for parseable contact details

Placeholder icons are included so `pdflatex` can compile before you add your own artwork. Overwrite the three PNG files; do not rename them unless you also update `\contactheader` in `style.tex`.
