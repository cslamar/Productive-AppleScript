tell application "iTerm"
    activate
    
    set myTerm to (make new terminal)
    
    tell myTerm
        launch session "Default Session"
    end tell
    
end tell