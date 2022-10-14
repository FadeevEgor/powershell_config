# python virtual enviroment
Set-Alias vrun .\venv\Scripts\activate # activate existing virtual environment
function mkv{                          # create new virtual environment
    python -m venv venv
}

# command prompt configuration 
function prompt {
    # show only directory name in the prompt. 
    # if it is home directory show only symbol "~"
    $currentDirectory = $(Get-Location)
    if ($currentDirectory.Path -eq "C:\Users\$env:UserName"){
        $directoryName = "~"
    }
    else{
        $directoryName = Split-Path $currentDirectory -leaf
    }
    
    # if current directory is a git repository, display active branch name in the prompt
    $isRepository = git rev-parse --is-inside-work-tree
    if ($isRepository){
        $branchName = git rev-parse --abbrev-ref HEAD
        $gitEmojiCode= [System.Convert]::toInt32("2387", 16)
        $gitEmoji = [System.Char]::ConvertFromUtf32($gitEmojiCode)
        
    }
    else{
        $branchName = ""
        $gitEmoji = ""
    }
    
    # write all the information 
    write-host "$branchName" -NoNewLine -ForegroundColor Red
    write-host "$gitEmoji" -NoNewLine 
    write-host "$directoryName" -NoNewline -ForegroundColor DarkYellow
    write-host "$" -NoNewline -ForegroundColor Green
    return " "
}
