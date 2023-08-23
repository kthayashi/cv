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

The git hook may need to be made executable:

```
chmod +x .git/hooks/pre-commit
```

## License

Non-code CV content (available in `data.yaml`, `cv.qmd`, `cv.html`, and `Kenji-Hayashi-CV.pdf`) is licensed under a [CC BY 4.0 License](https://github.com/kthayashi/cv/blob/main/LICENSE). Original code is licensed under the [MIT License](https://github.com/kthayashi/cv/blob/main/LICENSE-CODE).

In using Quarto to render a QMD document as an HTML document, code from external libraries is bundled in `cv_files/libs/`. Briefly, these libraries include:

- [Bootstrap 5](https://github.com/twbs/bootstrap) - [MIT License](https://github.com/twbs/bootstrap/blob/main/LICENSE)
- [clipboard.js](https://github.com/zenorocha/clipboard.js) - [MIT License](https://github.com/zenorocha/clipboard.js/blob/master/LICENSE)
- [AnchorJS](https://github.com/bryanbraun/anchorjs) - [MIT License](https://github.com/bryanbraun/anchorjs/blob/main/LICENSE)
- Popper (now [Floating UI](https://github.com/floating-ui/floating-ui)) - [MIT License](https://github.com/floating-ui/floating-ui/blob/master/LICENSE)
- [Tippy.js](https://github.com/atomiks/tippyjs) - [MIT License](https://github.com/atomiks/tippyjs/blob/master/LICENSE)
- [Quarto CLI](https://github.com/quarto-dev/quarto-cli) - [GNU GPL v2](https://github.com/quarto-dev/quarto-cli/blob/main/COPYRIGHT)
