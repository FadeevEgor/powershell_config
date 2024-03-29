# python virtual enviroment
# 1. activate an existing virtual environment
function vrun { 
    $venvBinDirectory = "$(Get-Location)\venv\bin"
    # $venvBinDirectory = "$(Get-Location)\venv\Scrpits" 
    if (Test-Path -Path $venvBinDirectory){
        .\venv\bin\activate
    } else {
        .\venv\Scripts\activate
    }
}

# 2. create a new virtual environment
function mkv{                         
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
        $anythinToCommit = git status --porcelain
        if ($anythinToCommit){
            $opts = @{ForegroundColor="red";}
        } else {
            $opts = @{ForegroundColor="darkgreen";}
        }
        $gitEmojiCode= [System.Convert]::toInt32("2387", 16)
        $gitEmoji = [System.Char]::ConvertFromUtf32($gitEmojiCode)
        write-host  -NoNewLine @opts -object "$branchName"
        write-host  -NoNewLine -object "$gitEmoji" -ForegroundColor Blue   
    }
    
    # write all the information 
    write-host "$directoryName" -NoNewline -ForegroundColor DarkYellow
    write-host "$" -NoNewline -ForegroundColor Green
    return " "
}
