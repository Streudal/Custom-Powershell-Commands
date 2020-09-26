function Get-CurrentBranchName {
    <#
    .SYNOPSIS
        This will get your current branch's name.

        Note: This is also used within the Update-Branch module in this repo.
              https://github.com/Streudal/Custom-Powershell-Commands/tree/master/CustomToolkit/Toolkit/Git/Update-Branch.psm1
              
    .EXAMPLE
        Get-CurrentBranchName
        your-branch-name

    .EXAMPLE
        Get-CurrentBranchName
        master

    .NOTES
        Author:  Tyler Streu - https://github.com/Streudal/Custom-Powershell-Commands/tree/master/CustomToolkit/Toolkit/Git/Get-CurrentBranchName.psm1
    #>

    $currentBranch = ''
    git branch | ForEach-Object {
        if ($_ -match "^\* (.*)") {
            $currentBranch += $matches[1]
        }
    }
    return $currentBranch
}