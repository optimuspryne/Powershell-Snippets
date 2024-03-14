$path = Read-Host "Where are the files located"

[array]$files += Get-ChildItem -File $path

foreach ($file in $files) {   
    $name = ($file.Name) -replace ".{4}$"
    New-Item -Path "$($path)\$($name)" -ItemType Directory
    Move-Item -Path "$($path)\$($file.Name)" -Destination "$($path)\$($name)\$($file.Name)"
}
