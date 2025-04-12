$additionalPages = @(
    "pdf-password.html|PDF Password Protector",
    "pdf-to-ppt.html|PDF to PowerPoint",
    "pdf-page-numbering.html|PDF Page Numbering",
    "translate-pdf.html|Multi-Language Translation",
    "advanced-ocr.html|Advanced Image OCR",
    "custom-fonts.html|Custom Fonts and Styles",
    "batch-watermark.html|Batch Watermarking",
    "pdf-to-markdown.html|PDF to Markdown",
    "pdf-to-epub.html|PDF to EPUB",
    "pdf-form-creator.html|PDF Form Creator",
    "pdf-metadata.html|PDF Metadata Editor",
    "pdf-to-html.html|PDF to HTML"
)

$templatePath = "coming-soon.html"
$template = Get-Content -Path $templatePath -Raw

# Create backup directory if it doesn't exist
if (-not (Test-Path -Path "backup")) {
    New-Item -Path "backup" -ItemType Directory
}

# Process additional pages
foreach ($page in $additionalPages) {
    $parts = $page.Split('|')
    $filename = $parts[0]
    $title = $parts[1]
    
    # Backup the original file if it exists
    if (Test-Path -Path $filename) {
        Copy-Item -Path $filename -Destination "backup\$filename"
    }
    
    $content = $template -replace "Coming Soon - PDF Tools", "$title - Coming Soon - PDF Tools"
    $content = $content -replace "Coming Soon!", "$title - Coming Soon!"
    $content = $content -replace "We're working on this page", "We're working on this $title page"
    $content = $content -replace 'href="coming-soon.html"', "href=`"$filename`""
    $content = $content -replace 'href="hi/coming-soon.html"', "href=`"hi/$filename`""
    
    $content | Out-File -FilePath $filename -Encoding utf8
    
    Write-Host "Created $filename"
    
    # Create Hindi version if it doesn't exist
    $hiFilename = "hi\$filename"
    if (-not (Test-Path -Path $hiFilename)) {
        $hiTemplate = Get-Content -Path "hi\coming-soon.html" -Raw
        
        $hiContent = $hiTemplate -replace "जल्द आ रहा है - PDF Tools", "$title - जल्द आ रहा है - PDF Tools"
        $hiContent = $hiContent -replace "जल्द आ रहा है!", "$title - जल्द आ रहा है!"
        $hiContent = $hiContent -replace "हम इस पेज पर काम कर रहे हैं", "हम इस $title पेज पर काम कर रहे हैं"
        $hiContent = $hiContent -replace 'href="coming-soon.html"', "href=`"$filename`""
        $hiContent = $hiContent -replace 'href="../coming-soon.html"', "href=`"../$filename`""
        
        $hiContent | Out-File -FilePath $hiFilename -Encoding utf8
        
        Write-Host "Created $hiFilename"
    }
}

Write-Host "All additional coming soon pages created successfully!"
