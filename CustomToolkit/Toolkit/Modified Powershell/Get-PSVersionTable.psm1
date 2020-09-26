function Get-PSVersionTable {
	<#
    .SYNOPSIS
        Command module to get PowerShell Version which is similar to $PSVersionTable but more controllable. Multiple switches are allowed.

        Note: Running the default command: Get-PSVersionTable with multiple switches has weirdly formatted output. Also, running multiple commands in the terminal 
              may result in slightly different output than what is expected. For example, Get-PSVersionTable; Get-PSVersionTable -Version -Edition -CompatibleVersions 
              will result in a different formatting.
    
    .PARAMETER Verion
        Fetches PowerShell version number. (Major, Minor, Build, Revision)
    
    .EXAMPLE
        Get-PSVersionTable -Version
        Major  Minor  Build  Revision
        -----  -----  -----  --------
        5      1      14409  1018
    
    .PARAMETER Edition
        Fetches PowerShell edition: Desktop, Core, etc.

    .EXAMPLE
        Get-PSVersionTable -Edition
        Desktop

    .PARAMETER CompatibleVersions
        Lists compatible version numbers.

    .EXAMPLE
        Get-PSVersionTable -Version
        Major  Minor  Build  Revision
        -----  -----  -----  --------
        1      0      -1     -1
        2      0      -1     -1
        3      0      -1     -1
        4      0      -1     -1
        5      0      -1     -1
        5      1      14409  1018

    .PARAMETER BuildVersion
        Fetches build version.

    .EXAMPLE
        Get-PSVersionTable -Version
        Major  Minor  Build  Revision
        -----  -----  -----  --------
        10     0      14409  1018

    .PARAMETER CLRVersion
        Fetches .NET runtime version. Otherwise known as: Common Language Runtime (CLR).

    .EXAMPLE
        Get-PSVersionTable -Version
        Major  Minor  Build  Revision
        -----  -----  -----  --------
        4      0      30319  42000

    .PARAMETER WSManStackVersion
        Fetches the version number of the WS-Management stack.

    .EXAMPLE
        Get-PSVersionTable -Version
        Major  Minor  Build  Revision
        -----  -----  -----  --------
        3      0      -1     -1

    .PARAMETER RemotingProtocolVersion
        Fetches the version of the Windows PowerShell remote management protocol.

    .EXAMPLE
        Get-PSVersionTable -Version
        Major  Minor  Build  Revision
        -----  -----  -----  --------
        2      3      -1     -1

    .PARAMETER SerializationVersion
        Fetches the version of the serialization method.

    .EXAMPLE
        Get-PSVersionTable -Version
        Major  Minor  Build  Revision
        -----  -----  -----  --------
        1      1      0      1
    
    .NOTES
        Author:  Tyler Streu - https://github.com/Streudal/Custom-Powershell-Commands/Toolkit/
	#>

    [CmdletBinding()]

    param (
        #[Parameter(ValueFromPipeline)]
        [switch] $Version,
        [switch] $Edition,
        [switch] $CompatibleVersions,
        [switch] $BuildVersion,
        [switch] $CLRVersion,
        [switch] $WSManStackVersion,
        [switch] $RemotingProtocolVersion,
        [switch] $SerializationVersion
    )
    
    try {
        Switch ($PSBoundParameters.GetEnumerator().Where({$_.Value -eq $True}).Key)
        {   
            'Version' {$PSVersionTable.PSVersion; "`n"}
            'Edition' {$PSVersionTable.PSEdition; "`n"}
            'CompatibleVersions' {$PSVersionTable.PSCompatibleVersions; "`n"}
            'BuildVersion' {$PSVersionTable.BuildVersion; "`n"}
            'CLRVersion' {$PSVersionTable.CLRVersion; "`n"}
            'WSManStackVersion' {$PSVersionTable.WSManStackVersion; "`n"}
            'RemotingProtocolVersion' {$PSVersionTable.PSRemotingProtocolVersion; "`n"}
            'SerializationVersion' {$PSVersionTable.SerializationVersion; "`n"}
    
            default {
                $PSVersionTable; "`n"
            }
        }
    } catch {
        Write-Warning "You're doing something wrong... or you know... something is broken :p"
    }
}