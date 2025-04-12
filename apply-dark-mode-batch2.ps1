# Batch 2: Basic tool pages
$basicToolPages = @(
    "pdf-editor.html",
    "merge-pdf.html",
    "image-to-pdf.html",
    "pdf-rotator.html",
    "pdf-text-extractor.html",
    "pdf-to-jpg.html",
    "pdf-to-word.html",
    "pdf-to-excel.html",
    "pdf-splitter.html",
    "pdf-compressor.html",
    "hi/pdf-editor.html",
    "hi/merge-pdf.html",
    "hi/image-to-pdf.html",
    "hi/pdf-rotator.html",
    "hi/pdf-text-extractor.html",
    "hi/pdf-to-jpg.html",
    "hi/pdf-to-word.html",
    "hi/pdf-to-excel.html",
    "hi/pdf-splitter.html"
)

foreach ($page in $basicToolPages) {
    Write-Host "Processing $page..."
    powershell -ExecutionPolicy Bypass -File add-dark-mode-fixed.ps1 -FilePath $page
}

Write-Host "Batch 2 completed!"
