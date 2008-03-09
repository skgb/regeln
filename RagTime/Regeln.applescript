
property ROOT_ELEMENT_NAME : "regeln"
property ELEMENTS_WITH_PCDATA_CONTENT : {"präambel", "name", "titel", "s", "gestrichen", "eingefügt", "dump"}
property IGNORE_ELEMENTS : {"gestrichen"}
property NEW_RAGTIME_PARAGRAPH_AT : {"ordnung", "name", "präambel", "p", "titel", "abs", "lit", "dump"}
-- possible :BUG: new paragraph at <s> as well..?
property RAGTIME_PARAGRAPH_STYLE_SHEETS : {|name|:"Werktitel", |präambel|:"Präambel", titel:"Paragraph-Titel", abs:"Absatz", lit:"Liste"}
property RAGTIME_DEFAULT_STYLE_SHEET : "Standardabsatz"

property entireText : ""
property thisParagraphStyleSheet : missing value
property isRagTimeParagraphDirty : false
property paragraphCount : 0
property paragraphStyleSheets : {}


on run
	open (choose file with prompt "Choose XML 'SKGB-Regeln' file for conversion to RagTime:" with multiple selections allowed without invisibles)
end run


on open |files|
	local |file|
	
	--try -- DEBUG
	repeat with |file| in |files|
		--tell regelnParser to parseFile(|file|)
		parseFile(|file|)
		convertToRagTime()
	end repeat
	--on error errorMsg number errorNum
	--display dialog "An error has occured:" & return & errorMsg with icon 0 buttons {"OK"}
	--end try
end open


on parseFile(|file|)
	local root
	
	-- we're using the DOM-style parser here, at least for now
	set root to parse XML (readFile(|file|))
	if XML tag of root is not ROOT_ELEMENT_NAME then
		error "Not an 'SKGB-Regeln' file."
	end if
	
	parseElement(root)
end parseFile


on readFile(|file|)
	local |data|, stream
	
	set stream to open for access |file|
	try
		set |data| to read stream
		close access stream
	on error errorMsg number errorNum
		close access stream
		error errorMsg number errorNum
	end try
	
	return |data|
end readFile


on parseElement(element)
	repeat with chunk in XML contents of element
		if class of chunk is XML element then
			if XML tag of element is in IGNORE_ELEMENTS then
				return
			end if
			parseElement(chunk)
			if XML tag of element is in NEW_RAGTIME_PARAGRAPH_AT then
				set isRagTimeParagraphDirty to true
			end if
		else if class of chunk is string then
			handlePcdata(chunk, XML tag of element)
		end if
	end repeat
end parseElement


-- riddled with bugs
on handlePcdata(pcdata, elementName)
	if elementName is not in ELEMENTS_WITH_PCDATA_CONTENT then
		error "Unexpected character data parsed in '" & elementName & "'."
	end if
	
	if isRagTimeParagraphDirty then
		set entireText to entireText & return
		set end of paragraphStyleSheets to thisParagraphStyleSheet
		set paragraphCount to paragraphCount + 1
		set isRagTimeParagraphDirty to false
	end if
	
	set entireText to entireText & pcdata
	
	try
		set thisParagraphStyleSheet to get user property elementName in RAGTIME_PARAGRAPH_STYLE_SHEETS
	on error
		set thisParagraphStyleSheet to RAGTIME_DEFAULT_STYLE_SHEET
	end try
end handlePcdata


-- bug ... sometimes the XML is inserted into the text flow multiple times. what gives?
on convertToRagTime()
	local |index|
	
	tell application "RagTime 6"
		open file "Macintosh HD:SKGB:Satzung/Ordnungen:Vorlage.rtt"
		--set targetTextFlow to make new text flow at document 1 with properties {name:"Text"}
		--set text of targetTextFlow to my entireText
		set text of text flow "Text" of document 1 to my entireText
		
		set |index| to 0
		repeat with paragraphStyleSheet in my paragraphStyleSheets
			set |index| to |index| + 1
			--set paragraph style sheet of paragraph |index| of targetTextFlow to paragraph style sheet paragraphStyleSheet of document 1
			set paragraph style sheet of paragraph |index| of text flow "Text" of document 1 to paragraph style sheet paragraphStyleSheet of document 1
		end repeat
		
		--set contents of rectangle "Phönix" of page 1 of layout "Layout" of document 1 to targetTextFlow
		open inventory of document 1
		open layout "Layout" of document 1
		close window 2
	end tell
end convertToRagTime
