# Get all HTML files
$htmlFiles = Get-ChildItem -Recurse -Include *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.FullName)"
    
    # Read the content of the file
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if the file contains the counter image
    if ($content -match '<img src="https://hitscounter.dev/api/hit\?url=www\.smileypdf\.com&label=SmileyPDF&icon=check2&color=%23052c65">') {
        # Replace with a smaller version
        $content = $content -replace '<img src="https://hitscounter.dev/api/hit\?url=www\.smileypdf\.com&label=SmileyPDF&icon=check2&color=%23052c65">', '<img src="https://hitscounter.dev/api/hit?url=www.smileypdf.com&label=SmileyPDF&icon=check2&color=%23052c65" width="1" height="1" style="opacity:0.1">'
        
        # Write the modified content back to the file
        Set-Content -Path $file.FullName -Value $content -NoNewline
        
        Write-Host "Updated counter size in $($file.Name)"
    } else {
        Write-Host "No counter found in $($file.Name), skipping..."
    }
}

Write-Host "Done updating counter size in all HTML files."
