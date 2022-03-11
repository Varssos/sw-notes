#!/bin/bash

prefix="\n.. raw:: html\n\n   <details>\n   <summary><a>solution</a></summary>\n\n.. code-block:: bash"
postfix="\n\n.. raw:: html\n\n   </details>\n"

sed -i -e "s|::|$prefix|g" -e "s|^\s\s\s.*|&$postfix|g"  basic_shell_tools.rst
