# Kenji Hayashi - *Curriculum Vitae*

This repo is for building/updating my CV. A brief overview of my workflow is provided below.

## Setup

### Overview

My CV is built using my [`qmdcv`](https://github.com/kthayashi/qmdcv) R package. This package allows me to provide the content of my CV as structured data (`data.yaml`), insert those data into a QMD document (`cv.qmd`), and render the CV as an HTML document (`cv.html`) using [Quarto](https://quarto.org/). Custom styling is provided in `custom.scss`, including page break/printing specifications for use with the [Paged.js](https://pagedjs.org/) library.

### Automation

I've set up a pre-commit [git hook](https://git-scm.com/docs/githooks) in my local repo to automatically print the HTML document as a PDF document, using the [Paged.js](https://pagedjs.org/) library, whenever changes to the HTML document are committed:

```
#!/bin/sh

# Hook script to print and stage CV as PDF prior to commit
# pagedjs-cli must be installed for this to work
# https://pagedjs.org/documentation/2-getting-started-with-paged.js/

# Check if pagedjs-cli is installed and operational
if pagedjs-cli --help &>/dev/null
then
    # Check if cv.html is staged
    if git diff --cached --name-only | grep "cv.html" &>/dev/null
    then
        # Print CV as PDF using pagedjs-cli
        pagedjs-cli -i cv.html -o Kenji-Hayashi-CV.pdf
        # Stage printed PDF
        git add Kenji-Hayashi-CV.pdf
    fi
fi
```

The git hook may need to made executable:

```
chmod +x <path-to-hook-script>
```

where `<path-to-hook-script>` might typically be `.git/hooks/pre-commit`.
