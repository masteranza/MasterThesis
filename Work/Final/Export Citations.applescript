set myDesiredSaveRange to "Selected Collection"

-- the following variable allows is the path where we save the bib file
set myPath to "/Users/masteranza/Projects/MasterThesis/Work/Draft2/Refs.bib"

-- do we also have a prettifier?
set runPrettifier to false
-- path to it
set pathPrettifier to "~/.dotfiles/bin/bibtexformat"
-- which arguments does it have?
set argumentPrettifier to myPath & " " & "-labels -fy -f -format -combine -sort -typereset"
set shellPrettifier to pathPrettifier & " " & argumentPrettifier
-- clean up afterward
set cleanUp to "~/Desktop/from_papers.old.bib"
set shellCleanUp to "rm" & " " & cleanUp
-- final command for the shell
set totalShell to shellPrettifier & " " & "&&" & " " & shellCleanUp

-- clean up before running
try
	do shell script "rm" & " " & myPath
end try

tell application "Papers" to activate

tell application "System Events" to tell process "Papers"
	tell menu bar 1 to tell menu bar item "File" to tell menu "File" to tell menu item "Export..." to tell menu "Export..." to click menu item "BibTeX Library"
	--click pop up button 1 of group 1 of sheet 1 of window "Papers"
	--click menu item myDesiredSaveRange of menu 1 of pop up button 1 of group 1 of sheet 1 of window "Papers"
	keystroke "Refs"
	keystroke return
	--	keystroke "Refs.bib"
end tell

delay 4

if runPrettifier then
	do shell script totalShell
end if