$pdfViewerPages = @(
    "pdf-viewer-basic.html|Basic PDF Viewer",
    "pdf-viewer-minimal.html|Minimal PDF Viewer",
    "pdf-viewer-simple.html|Simple PDF Viewer"
)

$pdfSplitterPages = @(
    "pdf-splitter-alternative.html|Alternative PDF Splitter",
    "pdf-splitter-basic.html|Basic PDF Splitter",
    "pdf-splitter-client.html|Client-side PDF Splitter",
    "pdf-splitter-core.html|Core PDF Splitter",
    "pdf-splitter-express.html|Express PDF Splitter",
    "pdf-splitter-final.html|Final PDF Splitter",
    "pdf-splitter-fixed-jspdf.html|Fixed jsPDF Splitter",
    "pdf-splitter-fixed.html|Fixed PDF Splitter",
    "pdf-splitter-jspdf.html|jsPDF Splitter",
    "pdf-splitter-minimal-working.html|Minimal Working PDF Splitter",
    "pdf-splitter-minimal.html|Minimal PDF Splitter",
    "pdf-splitter-new.html|New PDF Splitter",
    "pdf-splitter-server.html|Server-side PDF Splitter",
    "pdf-splitter-simple.html|Simple PDF Splitter",
    "pdf-splitter-ultra-simple.html|Ultra Simple PDF Splitter",
    "pdf-splitter-working.html|Working PDF Splitter"
)

$templatePath = "coming-soon.html"
$template = Get-Content -Path $templatePath -Raw

# Create backup directory if it doesn't exist
if (-not (Test-Path -Path "backup")) {
    New-Item -Path "backup" -ItemType Directory
}

# Process PDF Viewer pages
foreach ($page in $pdfViewerPages) {
    $parts = $page.Split('|')
    $filename = $parts[0]
    $title = $parts[1]
    
    # Backup the original file
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

# Process PDF Splitter pages
foreach ($page in $pdfSplitterPages) {
    $parts = $page.Split('|')
    $filename = $parts[0]
    $title = $parts[1]
    
    # Backup the original file
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

Write-Host "All coming soon pages created successfully!"
