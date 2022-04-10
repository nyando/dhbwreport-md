# Pandoc Template for DHBW Papers

This `pandoc` template allows users to write a paper in the DHBW format using Markdown.
The generated PDF output is rendered with LaTeX.

## Prerequisites

- a LaTeX distribution ([MikTeX](https://miktex.org/) on Windows or [TeXLive](https://tug.org/texlive/) on Linux)
- [pandoc](https://pandoc.org/) - a universal document converter
- (optional) [just](https://github.com/casey/just) - a command runner

## Usage

The title, author, and other metadata for your paper goes into the `meta.yml` file.
The YAML variables should be self-explanatory.
For projects completed with a student's company, set the `company` variable to `true` in the metadata file.
This will include the company name, location, logo, and project advisor on the report title sheet.
If you wish to change the formatting for some part of the report, check the `template.tex` file.

Write your report in one or more Markdown files, then call

```bash
$ just doc
```

The supplied file `body.md` contains examples for images, tables, code listings, and bibliographic references.
Alternatively, if you do not want to use just, you can copy the command in the `doc` section of the `justfile`,
replacing the variables with your respective files.
