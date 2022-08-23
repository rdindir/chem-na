# This awk script is a non-agressive chem tool.
# Author: Riza Dindir
# License: The GNU General Public License applies (<https://www.gnu.org/licenses/>) 

# Resets the file by emptying its contents.
function resetFile(fn) {
	cmd = "cat /dev/null > " fn;
	print cmd | "/bin/sh";
}

# Appends line to the file with name "fn".
function appendFile(fn, line) {
	cmd = "echo \"" line "\" >> " fn;
	print cmd | "/bin/sh";
}

# Cleans the line by converting " to \".
function cleanLine(line) {
	gsub(/"/, "\\\"", line);
}

# Runs the chem tool with the given file name.
function runChem(fn) {
	system("chem " fn);
}

BEGIN {
	inchem = 0;
	fn = "/tmp/chem.tr";
	resetFile(fn);
}

inchem == 0 && /^\.cstart/ {
	line = $0;
	cleanLine(line);
	appendFile(fn, line);
	inchem = 1;
	next;
}

inchem == 1 && /^\.cstart/ {
	print "You can not start another chem region when inside one.";
	exit 1;
}

inchem == 0 && /^\.cend/ {
	print "You can not end chem region when you are not in one.";
	exit 1;
}

inchem == 1 && /^\.cend/ {
	line = $0;
	cleanLine(line);
	appendFile(fn, line);
	runChem(fn);
	resetFile(fn);
	inchem = 0;
	next;
}

inchem == 1 {
	line = $0;
	cleanLine(line);
	appendFile(fn, line);
	next;
}

{ print $0; }

END {
	resetFile(fn);
}

