# chem-na
A simple script for a non aggresive chem (troff/groff) pre-processor.

# Description

I wanted to use troff/groff tools for creating documents (as an alternative to TeX or LaTeX).
I wanted to test the pre-processors that came with groff. What I discovered was that the chem
pre-processor was aggressively processing the whole document, and not its own region (delimited
by cstart/cend).

I created a simple awk script that will only let the chem pre-processor process its own region
non-aggressively.
