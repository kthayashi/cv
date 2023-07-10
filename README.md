# Kenji Hayashi - Curriculum Vitae

## Setup

### Automation

A git hook can be set up to automatically print the HTML CV as a PDF whenever
changes to the HTML file are committed. In particular, use the `pre-commit` git
hook:

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
