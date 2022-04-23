# Pandoc Template for DHBW Papers

This `pandoc` template allows users to write a paper in the DHBW format using Markdown.
The generated PDF output is rendered with LaTeX.

## Prerequisites

- a LaTeX distribution ([MikTeX](https://miktex.org/) on Windows or [TeXLive](https://tug.org/texlive/) on Linux)
- [pandoc](https://pandoc.org/) - a universal document converter
- (optional) [just](https://github.com/casey/just) - a command runner
- (optional) [Draw.io Desktop](https://github.com/jgraph/drawio-desktop) - for on-the-fly diagram compilation

## Usage

The title, author, and other metadata for your paper goes into the `meta.yml` file.
The YAML variables should be self-explanatory.
For projects and papers completed with a student's company (_Projektarbeit_), set 

```yaml
# meta.yml
company: true
```

This will include the company name, location, logo, and project advisor on the report title sheet.
The corresponding variables should also be set in `meta.yml`.
For purely academic projects (_Studienarbeit_), set `company` to `false` to hide that information on the title sheet.
If you wish to change the formatting for some part of the report, check the `template.tex` file.

## Compilation

Write your report in one or more Markdown files, then call

```bash
$ just pdf
```

to create a LaTeX-compiled PDF file with the report.
The individual Markdown files of the report should be added to the `SOURCE` variable in the `justfile`.
In case of compilation errors or misformattings, you may instead choose to output the TeX source with

```bash
$ just tex
```

The supplied file `body.md` contains examples for images, tables, code listings, and bibliographic references.
Alternatively, if you do not want to use `just`, you can copy the command in the `pdf` section of the `justfile`,
replacing the variables with your respective files.

## Autobuilding Draw.io Diagrams

The `justfile` pipeline supports compiling Draw.io diagrams on-the-fly and integrating them into the report as PDF images.
In order to use this feature, you need the [Draw.io Desktop](https://github.com/jgraph/drawio-desktop) executable
installed and in your PATH as `drawio`.

To use a Draw.io diagram in your report, simply include it as a PDF image:

```markdown
![Diagram Caption](./path/to/drawio/diagram.pdf)
```

Set `DIAGS_SRC := "./path/to/drawio"` in your `justfile`.
Make sure to comment in the `diags` recipe and set it as a dependency on the `pdf` recipe.
During compilation, the source `drawio` diagram files will be compiled to PDF and integrated into your report.

## Glossaries and Acronyms

To use a glossary and acronym listing, set the variables `glossary` and `acronym`, respectively.
You can use the terms in your glossary with the LaTeX-Macro `\gls{term}` and the acronyms with
`\acrfull{term}`, `\acrshort{term}`, or `\acrlong{term}`.
Note that terms will only show up in the listing if they're actually referenced in the text.

```yaml
# glossary options
glossary: true
glsacrofile: glossary.tex
glossarytitle: Glossar

# acronym options
acronyms: true
acronymtitle: Abkürzungsverzeichnis
```
