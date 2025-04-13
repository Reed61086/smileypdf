# Get all PDF splitter HTML files
$pdfSplitterFiles = Get-ChildItem -Path . -Filter 'pdf-splitter-*.html'

foreach ($file in $pdfSplitterFiles) {
    # Read the content of the file as bytes
    $content = [System.IO.File]::ReadAllText($file.FullName)
    
    # Check if the file contains the broken emoji
    if ($content -match 'ðŸš§') {
        Write-Host "Fixing emoji in $($file.Name)"
        
        # Replace the broken emoji with the correct one
        $newContent = $content.Replace('ðŸš§', '🚧')
        
        # Write the updated content back to the file
        [System.IO.File]::WriteAllText($file.FullName, $newContent)
    }
}

Write-Host "Done fixing emojis in PDF splitter files."
