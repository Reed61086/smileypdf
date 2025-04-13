# Get all HTML files
$htmlFiles = Get-ChildItem -Recurse -Include *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.FullName)"
    
    # Read the content of the file
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if Google Analytics is present
    if ($content -match "googletagmanager.com/gtag" -or $content -match "dataLayer") {
        # Remove Google Analytics script block
        $gtagPattern = @"
(?s)<!-- Google tag \(gtag\.js\) -->.*?gtag\('config', '.*?'\);.*?</script>
"@
        
        # Remove the Google Analytics code
        $content = $content -replace $gtagPattern, ""
        
        # Write the updated content back to the file
        Set-Content -Path $file.FullName -Value $content -NoNewline
        
        Write-Host "Removed Google Analytics from $($file.Name)"
    } else {
        Write-Host "No Google Analytics found in $($file.Name), skipping..."
    }
}

Write-Host "Done removing Google Analytics from all HTML files."
