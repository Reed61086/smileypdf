# Get all HTML files
$htmlFiles = Get-ChildItem -Recurse -Include *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.FullName)"
    
    # Read the content of the file
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if hit counter is already added
    if ($content -match "hitscounter.dev") {
        Write-Host "Hit counter already exists in $($file.Name), skipping..."
        continue
    }
    
    # Add hit counter image before closing body tag
    $hitCounterCode = @"

<img src="https://hitscounter.dev/api/hit?url=www.smileypdf.com&label=SmileyPDF&icon=check2&color=%23052c65">

"@

    # Insert hit counter code before closing body tag
    $content = $content -replace "(?s)(</body>)", "$hitCounterCode`$1"
    
    # Write the updated content back to the file
    Set-Content -Path $file.FullName -Value $content -NoNewline
    
    Write-Host "Added hit counter to $($file.Name)"
}

Write-Host "Done adding hit counter to all HTML files."
