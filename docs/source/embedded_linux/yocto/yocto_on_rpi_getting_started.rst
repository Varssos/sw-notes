Yocto on RPI getting started
============================












Problems
~~~~~~~~

$ bitbake
/usr/lib/python3/dist-packages/html5lib/_trie/_base.py:3: DeprecationWarning: Using or importing the ABCs from 'collections' instead of from 'collections.abc' is deprecated since Python 3.3, and in 3.10 it will stop working from collections import Mapping
ERROR: The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed **pzstd zstd**

Solution::

    sudo apt update && apt install -y zstd liblz4-tool