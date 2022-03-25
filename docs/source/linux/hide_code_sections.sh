#!/bin/bash

prefix="\n\n.. raw:: html\n\n   <details>\n   <summary><a>solution</a></summary>\n\n.. code-block:: bash"
postfix="\n\n.. raw:: html\n\n   </details>\n"

sed -e "s|::|$prefix|g" -e "s|^\s\s\s.*|&$postfix|g"  $1
