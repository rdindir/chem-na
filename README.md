# chem-na
A simple script for a non aggresive chem (troff/groff) pre-processor.

# Description

I wanted to use troff/groff tools for creating documents (as an alternative to TeX or LaTeX).
To test the groff tool, I have written a simple groff document to test the pre-processors
that came with groff. What I discovered was that the chem pre-processor was aggressively
processing the whole document, and not its own region (delimited by cstart/cend).

To make the chem pre-processor less aggressive in processing the document, I created a simple
awk script that will only make chem pre-processor behave non-aggressively, processing its
own region and leaving the rest of the document unprocessed.

A bug report has been filed with groff (https://savannah.gnu.org/bugs/index.php?62909).
Meanwhile if someone is using chem, can use this script, until the groff chem package
is fixed and is available on their OS.

# Examples

You can use the script as given below.

  cat \<document> | chem-na

  chem-na \<document>
