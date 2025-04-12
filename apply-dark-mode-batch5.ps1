# Batch 5: PDF splitter and viewer variants
$variantPages = @(
    "pdf-splitter-alternative.html",
    "pdf-splitter-basic.html",
    "pdf-splitter-client.html",
    "pdf-splitter-core.html",
    "pdf-splitter-express.html",
    "pdf-splitter-final.html",
    "pdf-splitter-fixed-jspdf.html",
    "pdf-splitter-fixed.html",
    "pdf-splitter-jspdf.html",
    "pdf-splitter-minimal-working.html",
    "pdf-splitter-minimal.html",
    "pdf-splitter-new.html",
    "pdf-splitter-server.html",
    "pdf-splitter-simple.html",
    "pdf-splitter-ultra-simple.html",
    "pdf-splitter-working.html",
    "pdf-viewer-basic.html",
    "pdf-viewer-minimal.html",
    "pdf-viewer-simple.html"
)

# Add Hindi versions
$hiVariantPages = $variantPages | ForEach-Object { "hi/$_" }
$variantPages += $hiVariantPages

foreach ($page in $variantPages) {
    Write-Host "Processing $page..."
    powershell -ExecutionPolicy Bypass -File add-dark-mode-fixed.ps1 -FilePath $page
}

Write-Host "Batch 5 completed!"
