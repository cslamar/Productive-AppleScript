global myTaskLine
global myPlainMessage

tell application "Airmail"
    set mySubject to subject of selected message
    --  set myMessage to htmlContent of selected message
    set myMessage to content of selected message
    set myURL to selectedMessageUrl
    set mySender to sender of selected message
    set myPlainMessage to do shell script "echo " & quoted form of myMessage & space & "| textutil  -convert txt  -stdin -stdout -format html"
    set myPlainMessage to myPlainMessage & "

" & myURL
    set myTaskLine to mySubject
end tell


tell application "OmniFocus"
    tell default document
        set theProject to make new inbox task with properties {name:myTaskLine, note:myPlainMessage}
    end tell
end tell
