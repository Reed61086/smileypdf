# Get all HTML files
$htmlFiles = Get-ChildItem -Recurse -Include *.html

foreach ($file in $htmlFiles) {
    # Read the content of the file
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if the file contains the broken emoji
    if ($content -match 'ðŸš§') {
        Write-Host "Fixing emoji in $($file.FullName)"
        
        # Replace the broken emoji with the correct one
        $newContent = $content -replace 'ðŸš§', '🚧'
        
        # Write the updated content back to the file
        Set-Content -Path $file.FullName -Value $newContent -NoNewline
    }
}

Write-Host "Done fixing emojis in all files."
