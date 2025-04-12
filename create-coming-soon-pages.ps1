$pages = @(
    "blog-post-3.html|ब्लॉग पोस्ट 3",
    "blog-post-4.html|ब्लॉग पोस्ट 4",
    "blog-post-5.html|ब्लॉग पोस्ट 5",
    "blog-post-6.html|ब्लॉग पोस्ट 6",
    "blog-post-7.html|ब्लॉग पोस्ट 7",
    "blog-post-8.html|ब्लॉग पोस्ट 8",
    "blog-post-9.html|ब्लॉग पोस्ट 9",
    "emoji-tool.html|इमोजी टूल",
    "formula-recognition.html|फॉर्मूला रिकग्निशन",
    "og-image-creation.html|OG इमेज क्रिएशन",
    "pdf-accessibility.html|PDF एक्सेसिबिलिटी",
    "pdf-bates.html|PDF बेट्स नंबरिंग",
    "pdf-compressor.html|PDF कंप्रेसर",
    "pdf-ocr-languages.html|PDF OCR भाषाएँ",
    "pdf-redaction.html|PDF रिडैक्शन",
    "pdf-signature.html|PDF सिग्नेचर",
    "pdf-templates.html|PDF टेम्पलेट्स",
    "text-to-speech.html|टेक्स्ट से स्पीच",
    "visual-insights.html|विजुअल इनसाइट्स"
)

$templatePath = "hi/coming-soon.html"
$template = Get-Content -Path $templatePath -Raw

foreach ($page in $pages) {
    $parts = $page.Split('|')
    $filename = $parts[0]
    $title = $parts[1]
    
    $content = $template -replace "जल्द आ रहा है - PDF Tools", "$title - जल्द आ रहा है - PDF Tools"
    $content = $content -replace "जल्द आ रहा है!", "$title - जल्द आ रहा है!"
    $content = $content -replace "हम इस पेज पर काम कर रहे हैं", "हम इस $title पेज पर काम कर रहे हैं"
    $content = $content -replace 'href="coming-soon.html"', "href=`"$filename`""
    $content = $content -replace 'href="../coming-soon.html"', "href=`"../$filename`""
    
    $outputPath = "hi/$filename"
    $content | Out-File -FilePath $outputPath -Encoding utf8
    
    Write-Host "Created $outputPath"
}

Write-Host "All coming soon pages created successfully!"
