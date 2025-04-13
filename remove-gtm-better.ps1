# Get all HTML files
$htmlFiles = Get-ChildItem -Recurse -Include *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.FullName)"
    
    # Read the content of the file
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if GTM is present
    if ($content -match "GTM-WRM63JPK") {
        # Remove GTM script from head (using simpler pattern matching)
        $content = $content -replace "(?s)<!-- Google Tag Manager -->.*?<!-- End Google Tag Manager -->(\r?\n|\r)?", ""
        
        # Remove GTM noscript from body (using simpler pattern matching)
        $content = $content -replace "(?s)<!-- Google Tag Manager \(noscript\) -->.*?<!-- End Google Tag Manager \(noscript\) -->(\r?\n|\r)?", ""
        
        # Write the updated content back to the file
        Set-Content -Path $file.FullName -Value $content -NoNewline
        
        Write-Host "Removed GTM from $($file.Name)"
    } else {
        Write-Host "No GTM found in $($file.Name), skipping..."
    }
}

Write-Host "Done removing GTM from all HTML files."
