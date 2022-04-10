# Pandoc / TeX
SOURCE := "body.md"
META := "meta.yml"
BIB := "biblio.bib"
TEMPLATE := "./resources/template.tex"
HEADER := "./resources/header.tex"
OUTPUT := "output"

tex:
    pandoc --listings --template={{TEMPLATE}} --metadata-file={{META}} --include-in-header={{HEADER}} --citeproc -o {{OUTPUT}}.tex {{SOURCE}}

pdf: clean # diags
    pandoc --listings --template={{TEMPLATE}} --metadata-file={{META}} --include-in-header={{HEADER}} --citeproc -o {{OUTPUT}}.pdf {{SOURCE}}

clean:
    # rm -f ./imgs/drawio/*.pdf
    rm -f ./output.pdf

# draw.io
# DIAGS_SRC := "./imgs/drawio"

# diags:
#     drawio --crop --format pdf --transparent --export {{DIAGS_SRC}}
