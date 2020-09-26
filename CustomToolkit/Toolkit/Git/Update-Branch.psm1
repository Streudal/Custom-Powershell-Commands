function Update-Branch {
    <#
    .SYNOPSIS
        This will update the current working branch with a rebase of the latest remote master changes.

        Note: This will fail if branch is not in the remote origin but should display resulting error.
        
    .EXAMPLE
        Update-Branch
        Updating branch: master
        Already up to date.
        Current branch master is up to date.

        OR 

        Whatever was updated...

    .EXAMPLE
        Update-Branch
        Updating branch: new-changes
        Already up to date.
        Current branch master is up to date.

        OR

        Whatever was updated...

    .NOTES
        Author:  Tyler Streu - https://github.com/Streudal/Custom-Powershell-Commands/tree/master/CustomToolkit/Toolkit/Git/Update-Branch.psm1
    #>

    $currentBranch = Get-CurrentBranchName

    if ($currentBranch = 'master'){
        Write-Host ("Updating branch: $currentBranch")
        git pull --rebase
    } else {
        Write-Host ("Updating branch: $currentBranch")
        git checkout master | git pull | git checkout $currentBranch | git rebase master
    }
}