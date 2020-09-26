
function touch {
    <#
    .SYNOPSIS
        Mimics 'touch' command from linux.

    .EXAMPLE
        touch testfile.md
        testfile.md

    .EXAMPLE
        touch rubberDuckies.txt
        rubberDuckies.txt   
    
    .OUTPUTS
        Specified File
     
    .NOTES
        Author:  Tyler Streu - https://github.com/Streudal/Custom-Powershell-Commands/tree/master/CustomToolkit/Toolkit/Random/touch.psm1
    #>

    $file = $args[0]
    if($file -eq $null) {
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        New-Item $file
    }
}