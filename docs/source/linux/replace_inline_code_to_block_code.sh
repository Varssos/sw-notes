#!/bin/bash

prefix="\n.. raw:: html\n\n   <details>\n   <summary><a>solution</a></summary>\n\n.. code-block:: bash"
postfix="\n\n.. raw:: html\n\n   </details>\n"

sed -i -e "s|\s\`\`|::\n\n    |g" -e "s|\`\`|\n|g" $1
