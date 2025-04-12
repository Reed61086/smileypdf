# Batch 1: Main pages (index, about, contact)
$mainPages = @(
    "index.html",
    "about.html",
    "contact.html",
    "faq.html",
    "privacy.html",
    "terms.html",
    "hi/index.html",
    "hi/about.html",
    "hi/contact.html",
    "hi/faq.html",
    "hi/privacy.html",
    "hi/terms.html"
)

foreach ($page in $mainPages) {
    Write-Host "Processing $page..."
    powershell -ExecutionPolicy Bypass -File add-dark-mode-fixed.ps1 -FilePath $page
}

Write-Host "Batch 1 completed!"
