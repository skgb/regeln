-- settings
property templateFilename : "Vorlage.rtt"
property DEBUG_TemplatePath : "Macintosh HD:SKGB:Satzung/Ordnungen:Vorlage.rtt"

-- format constants
property ROOT_ELEMENT_NAME : "regeln"
property ELEMENTS_WITH_PCDATA_CONTENT : {"präambel", "name", "titel", "s", "gestrichen", "eingefügt", "dump"}
property IGNORE_ELEMENTS : {"gestrichen"}
property NEW_RAGTIME_PARAGRAPH_AT : {"ordnung", "name", "präambel", "p", "titel", "abs", "lit", "dump"}
property RAGTIME_PARAGRAPH_STYLE_SHEETS : {|name|:"Werktitel", |präambel|:"Präambel", titel:"Paragraph-Titel", p:"", abs:"Absatz", lit:"Liste"}
property RAGTIME_DEFAULT_STYLE_SHEET : "Standardabsatz"

-- globals
global entireText
global paragraphBreakNecessary
global pcdataAbsCount, pcdataPCount, pcdataParagraphStyleSheet
global paragraphStyleSheets
global templatePath



-- find the RagTime template file
on init()
	global templatePath
	
	-- try the bundle resource first
	try
		set templatePath to path to resource templateFilename
	on error number -192
		
		-- otherwise, try the folder our application is contained in
		try
			tell application "Finder" to get (file templateFilename of (parent of (path to me))) as alias
			set templatePath to the result
		on error number -1700
			
			-- as last resort, try the built-in fixed path (DEBUG)
			try
				set templatePath to DEBUG_TemplatePath as alias
			on error number -43
				
				-- not found: report problem and exit
				display dialog "Required RagTime template resource not found." with icon 0 buttons {"OK"} default button "OK"
				error number -128
			end try
		end try
	end try
	return templatePath
end init



-- action when launching with double-click
on run
	my init()
	
	set theFiles to choose file with prompt "Choose XML “SKGB-Regeln” file for conversion to RagTime:" with multiple selections allowed without invisibles
	my openFiles(theFiles)
end run



-- action when accepting drags
on open theFiles
	my init()
	my openFiles(theFiles)
end open



-- handle all specified files
on openFiles(theFiles)
	set currentCount to 1
	repeat with aFile in theFiles
		
		try
			my parseFile(aFile)
			my convertToRagTime()
			
		on error theMessage number theNumber
			if currentCount < (the count of theFiles) then
				set theButtons to {"Continue", "Stop"}
			else
				set theButtons to {"OK"}
			end if
			set theDefaultButton to item (the count of theButtons) in theButtons
			display alert "Error while processing “" & name of (info for (aFile)) & "”" message theMessage & return & "(Error " & theNumber & ")" buttons theButtons default button theDefaultButton as warning
			if the button returned of the result is theDefaultButton then
				error number -128
			end if
		end try
		set currentCount to currentCount + 1
	end repeat
	
	tell application "RagTime 6" to activate
end openFiles



-- initiate XML parsing
on parseFile(theFile)
	global paragraphBreakNecessary, entireText, paragraphStyleSheets, pcdataAbsCount, pcdataPCount, pcdataParagraphStyleSheet
	
	-- initialise globals
	set paragraphBreakNecessary to false
	set entireText to ""
	set paragraphStyleSheets to {}
	set pcdataAbsCount to 0
	set pcdataPCount to 0
	set pcdataParagraphStyleSheet to missing value
	
	set theData to read theFile
	-- we're using the DOM-style parser here, at least for now
	-- the SAX-style parser might improve readability of this code though
	try
		set root to parse XML (theData)
		if XML tag of root is not ROOT_ELEMENT_NAME then
			error "XML parsing error: wrong root element name" number 403
		end if
	on error theMessage number theNumber
		error "Not an 'SKGB-Regeln' file." & return & theMessage & return & "(Original error code: " & theNumber & ")" number 401
	end try
	
	my parseElement(root)
end parseFile



-- parse one XML element recursively
on parseElement(element)
	global paragraphBreakNecessary
	
	if XML tag of element is in IGNORE_ELEMENTS then
		return
	end if
	
	repeat with subElement in XML contents of element
		if class of subElement is XML element then
			my handleElement(XML tag of subElement, XML tag of element)
			my parseElement(subElement)
		else if class of subElement is string then
			my handlePcdata(subElement, XML tag of element)
		end if
	end repeat
	
	if XML tag of element is in NEW_RAGTIME_PARAGRAPH_AT then
		set paragraphBreakNecessary to true
	end if
end parseElement



-- add parsed character data to the plain text global
on handleElement(elementName, parentName)
	-- :BUG: we don't handle <lit> yet
	global entireText, paragraphBreakNecessary, pcdataAbsCount, pcdataSectionCount
	
	-- add numbers to content as appropriate
	if elementName is "titel" and parentName is "p" then
		--log parentName & ">" & elementName & " (" & pcdataPCount & "," & pcdataAbsCount & ")"
		my insertParagraphBreak()
		set pcdataPCount to pcdataPCount + 1
		set entireText to entireText & "§ " & pcdataPCount & tab
		set pcdataAbsCount to 0
	else if elementName is "abs" and parentName is "p" then
		my insertParagraphBreak()
		set pcdataAbsCount to pcdataAbsCount + 1
		set entireText to entireText & pcdataAbsCount & "." & tab
	else if elementName is "s" then
		set entireText to entireText & " " -- :BUG: some extra spaces in unwanted places
	end if
end handleElement



-- add parsed character data to the plain text global
on handlePcdata(pcdata, elementName)
	global entireText, paragraphBreakNecessary, pcdataParagraphStyleSheet
	
	-- if somebody tries to mess with us, this is a likely spot where things go wrong
	if elementName is not in ELEMENTS_WITH_PCDATA_CONTENT then
		error "Unexpected character data parsed in <" & elementName & "> element." number 402
	end if
	
	if paragraphBreakNecessary then
		my insertParagraphBreak()
	end if
	
	set entireText to entireText & pcdata
	
	set pcdataParagraphStyleSheet to elementName
end handlePcdata



-- insert paragraph break into plain text global and do housekeeping
on insertParagraphBreak()
	global entireText, paragraphBreakNecessary, paragraphStyleSheets, pcdataParagraphStyleSheet
	
	set entireText to entireText & return
	set paragraphBreakNecessary to false
	
	-- remember the appropriate paragraph style sheet for RagTime
	-- :BUG:
	try
		set end of paragraphStyleSheets to get user property pcdataParagraphStyleSheet in RAGTIME_PARAGRAPH_STYLE_SHEETS
	on error
		set end of paragraphStyleSheets to RAGTIME_DEFAULT_STYLE_SHEET
	end try
	
end insertParagraphBreak


-- open RagTime template and fill it with the parsed data
on convertToRagTime()
	global entireText, templatePath, paragraphStyleSheets
	
	tell application "RagTime 6"
		open templatePath
		set text of text flow "Text" of document 1 to my entireText
		
		set theIndex to 0
		repeat with paragraphStyleSheet in my paragraphStyleSheets
			set theIndex to theIndex + 1
			set paragraph style sheet of (paragraph theIndex of (text flow "Text" of document 1)) to ((paragraph style sheet paragraphStyleSheet) of document 1)
		end repeat
		
		open inventory of document 1
		open layout "Layout" of document 1
		close window 2
	end tell
end convertToRagTime
