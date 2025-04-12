# Batch 3: Coming soon pages
$comingSoonPages = @(
    "coming-soon.html",
    "hi/coming-soon.html",
    "advanced-ocr.html",
    "ai-summarize.html",
    "batch-watermark.html",
    "chat-with-pdf.html",
    "custom-fonts.html",
    "emoji-tool.html",
    "formula-recognition.html",
    "og-image-creation.html",
    "pdf-accessibility.html",
    "pdf-bates.html",
    "pdf-form-creator.html",
    "pdf-metadata.html",
    "pdf-ocr-languages.html",
    "pdf-page-numbering.html",
    "pdf-password.html",
    "pdf-redaction.html",
    "pdf-signature.html",
    "pdf-templates.html",
    "pdf-to-epub.html",
    "pdf-to-html.html",
    "pdf-to-markdown.html",
    "pdf-to-ppt.html",
    "text-to-speech.html",
    "translate-pdf.html",
    "visual-insights.html"
)

# Add Hindi versions
$hiComingSoonPages = $comingSoonPages | Where-Object { $_ -ne "coming-soon.html" -and $_ -ne "hi/coming-soon.html" } | ForEach-Object { "hi/$_" }
$comingSoonPages += $hiComingSoonPages

foreach ($page in $comingSoonPages) {
    Write-Host "Processing $page..."
    powershell -ExecutionPolicy Bypass -File add-dark-mode-fixed.ps1 -FilePath $page
}

Write-Host "Batch 3 completed!"
