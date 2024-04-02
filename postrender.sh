#!/bin/bash

# Print rendered HTML output as PDF using pagedjs-cli
# https://pagedjs.org/documentation/2-getting-started-with-paged.js/

if pagedjs-cli --help &>/dev/null
then pagedjs-cli -i index.html -o Kenji-Hayashi-CV.pdf
else echo "Install pagedjs-cli to print HTML output as PDF:\nhttps://pagedjs.org/documentation/2-getting-started-with-paged.js/"
fi
