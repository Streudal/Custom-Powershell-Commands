$getModules = Get-ChildItem -Path .\CustomToolkit\ -Include *.psm1, *.ps1 -Recurse

foreach ($module in $getModules) {
    Import-Module $module
}
