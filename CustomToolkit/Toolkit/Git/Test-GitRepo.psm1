function Test-GitRepo {
    <#
    .SYNOPSIS
        This will check to see if the current directory is a git repository.

    .EXAMPLE
        Test-GitRepo
        True

    .EXAMPLE
        Test-GitRepo
        False

    .NOTES
        Author:  Tyler Streu - https://github.com/Streudal/Custom-Powershell-Commands/tree/master/CustomToolkit/Toolkit/Git/Test-GitRepo.psm1
    #>

    if ((Test-Path ".git") -eq $TRUE) {
        return $TRUE
    } else {
        return $FALSE

    }
}