# Get all PDF splitter HTML files
$pdfSplitterFiles = Get-ChildItem -Path . -Filter 'pdf-splitter-*.html'

foreach ($file in $pdfSplitterFiles) {
    # Read the content of the file
    $content = Get-Content -Path $file.FullName -Raw
    
    # Replace the broken emoji with the correct one
    if ($content -match '<div class="text-6xl mb-6">ðŸš§</div>') {
        Write-Host "Fixing emoji in $($file.Name)"
        
        $newContent = $content -replace '<div class="text-6xl mb-6">ðŸš§</div>', '<div class="text-6xl mb-6">🚧</div>'
        
        # Write the updated content back to the file
        Set-Content -Path $file.FullName -Value $newContent -NoNewline
    }
}

Write-Host "Done fixing emojis in PDF splitter files."
