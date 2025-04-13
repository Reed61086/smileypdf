# List of files to check
$filesToCheck = @(
    "pdf-password.html",
    "pdf-to-epub.html",
    "pdf-to-html.html",
    "pdf-to-markdown.html",
    "pdf-to-ppt.html",
    "translate-pdf.html",
    "advanced-ocr.html",
    "batch-watermark.html",
    "custom-fonts.html",
    "pdf-form-creator.html",
    "pdf-metadata.html",
    "pdf-page-numbering.html"
)

foreach ($file in $filesToCheck) {
    if (Test-Path $file) {
        Write-Host "Checking $file..."
        $content = Get-Content -Path $file -Raw
        
        # Replace the broken emoji with the correct one
        $newContent = $content -replace '<div class="text-6xl mb-6">ðŸš§</div>', '<div class="text-6xl mb-6">🚧</div>'
        
        # Write the updated content back to the file
        Set-Content -Path $file -Value $newContent -NoNewline
        Write-Host "Fixed emoji in $file"
    }
}

Write-Host "Done fixing emojis in all files."
