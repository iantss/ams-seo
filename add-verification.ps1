$tag = '<meta name="google-site-verification" content="yVE17U3gN1mvk0W0pWRRMzSd1YqqqB6hKACZSiYtGYc" />'
$old = '<meta charset="UTF-8">'
$new = '<meta charset="UTF-8">' + "`r`n  " + $tag

Get-ChildItem -Recurse -Filter *.html | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    if ($content -notmatch 'google-site-verification') {
        $content = $content -replace [regex]::Escape('<meta charset="UTF-8">'), $new
        Set-Content $_.FullName $content -NoNewline
        Write-Host "Updated: $($_.Name)"
    }
}
Write-Host "Done!"
