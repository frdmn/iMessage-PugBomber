# Insert your iMessage accociated email
set yourAddress to "your.imessage@account.com"
# Insert the accociated iMessage account of your receiver
set receiverAddress to "your.receivers@account.com"
# Set the number of Messages that will be send
set amountOfMsg to 20

## parse pug function
to getPug()
	tell application "JSON Helper"
		set pugAPI to fetch JSON from ("http://pugme.herokuapp.com/random")
		set pugURL to pug of pugAPI
		return (pugURL)
	end tell
end getPug

## Fix something to make this work !!! DON'T CHANGE THIS !!!
set yourAddress to "E:" & yourAddress

## loop
repeat amountOfMsg times
	set myFile to (POSIX path of (path to desktop)) & ".temp-pug.jpg"
	do shell script "curl -L " & getPug() & " -o " & myFile
	set pugAttachment to POSIX file myFile
	
	tell application "Messages"
		set theBuddy to buddy receiverAddress of service yourAddress
		send pugAttachment to theBuddy
	end tell
end repeat

