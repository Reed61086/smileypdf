# Script to fix Hindi encoding issues

# Define Hindi translations for common terms
$hindiTranslations = @{
    "SmileyPDF" = "स्माइलीपीडीएफ"
    "Free Online PDF Tools" = "मुफ्त ऑनलाइन पीडीएफ टूल्स"
    "PDF Editor" = "पीडीएफ एडिटर"
    "Merge PDF" = "पीडीएफ मर्ज करें"
    "Split PDF" = "पीडीएफ स्प्लिट करें"
    "PDF to Word" = "पीडीएफ से वर्ड"
    "PDF to JPG" = "पीडीएफ से जेपीजी"
    "PDF to Excel" = "पीडीएफ से एक्सेल"
    "PDF to PowerPoint" = "पीडीएफ से पावरपॉइंट"
    "PDF to Text" = "पीडीएफ से टेक्स्ट"
    "Image to PDF" = "इमेज से पीडीएफ"
    "Compress PDF" = "पीडीएफ कंप्रेस करें"
    "Rotate PDF" = "पीडीएफ रोटेट करें"
    "PDF to Google Doc" = "पीडीएफ से गूगल डॉक"
    "Home" = "होम"
    "About" = "हमारे बारे में"
    "Contact" = "संपर्क करें"
    "Blog" = "ब्लॉग"
    "Tools" = "टूल्स"
    "Privacy Policy" = "गोपनीयता नीति"
    "Terms of Service" = "सेवा की शर्तें"
    "All rights reserved" = "सर्वाधिकार सुरक्षित"
    "Upload" = "अपलोड करें"
    "Download" = "डाउनलोड करें"
    "Convert" = "कन्वर्ट करें"
    "Processing" = "प्रोसेसिंग"
    "Select PDF File" = "पीडीएफ फाइल चुनें"
    "Click to select a PDF file or drag and drop here" = "पीडीएफ फाइल चुनने के लिए क्लिक करें या यहां खींचें और छोड़ें"
    "Maximum file size" = "अधिकतम फाइल साइज"
    "Convert PDF to Word" = "पीडीएफ को वर्ड में बदलें"
    "Convert PDF to JPG" = "पीडीएफ को जेपीजी में बदलें"
    "Convert PDF to Excel" = "पीडीएफ को एक्सेल में बदलें"
    "Convert PDF to PowerPoint" = "पीडीएफ को पावरपॉइंट में बदलें"
    "Convert PDF to Text" = "पीडीएफ को टेक्स्ट में बदलें"
    "Convert Image to PDF" = "इमेज को पीडीएफ में बदलें"
    "Compress PDF File" = "पीडीएफ फाइल कंप्रेस करें"
    "Rotate PDF Pages" = "पीडीएफ पेज रोटेट करें"
    "Split PDF File" = "पीडीएफ फाइल स्प्लिट करें"
    "Merge PDF Files" = "पीडीएफ फाइल्स मर्ज करें"
    "Edit PDF Online" = "पीडीएफ ऑनलाइन एडिट करें"
    "PDF Splitter" = "पीडीएफ स्प्लिटर"
    "Extract specific pages from your PDF documents" = "अपने पीडीएफ दस्तावेजों से विशिष्ट पेज निकालें"
    "Popular Tools" = "लोकप्रिय टूल्स"
    "About SmileyPDF" = "स्माइलीपीडीएफ के बारे में"
    "SmileyPDF offers free online PDF tools to help you manage your documents efficiently" = "स्माइलीपीडीएफ आपके दस्तावेजों को कुशलतापूर्वक प्रबंधित करने में मदद करने के लिए मुफ्त ऑनलाइन पीडीएफ टूल प्रदान करता है"
    "Our tools are designed to be easy to use, secure, and accessible from any device" = "हमारे टूल उपयोग में आसान, सुरक्षित और किसी भी डिवाइस से एक्सेसिबल होने के लिए डिज़ाइन किए गए हैं"
    "Legal" = "कानूनी"
    "Stay Updated" = "अपडेट रहें"
    "Your email" = "आपका ईमेल"
    "Subscribe" = "सब्सक्राइब करें"
    "Contact Us" = "हमसे संपर्क करें"
    "Have questions or feedback? We'd love to hear from you!" = "सवाल या प्रतिक्रिया है? हम आपसे सुनना पसंद करेंगे!"
    "PDF Preview" = "पीडीएफ प्रीव्यू"
    "Split Options" = "स्प्लिट विकल्प"
    "Enter page numbers or ranges to extract" = "निकालने के लिए पेज नंबर या रेंज दर्ज करें"
    "Split PDF" = "पीडीएफ स्प्लिट करें"
    "Separate individual pages with commas and specify ranges with hyphens" = "अलग-अलग पेजों को कॉमा से अलग करें और रेंज को हाइफन से निर्दिष्ट करें"
    "Processing..." = "प्रोसेसिंग..."
    "Results" = "परिणाम"
    "How to Split a PDF File Online" = "पीडीएफ फाइल को ऑनलाइन कैसे स्प्लिट करें"
    "Our free PDF splitter tool allows you to extract specific pages from your PDF documents in just a few simple steps" = "हमारा मुफ्त पीडीएफ स्प्लिटर टूल आपको कुछ ही सरल चरणों में अपने पीडीएफ दस्तावेजों से विशिष्ट पेज निकालने की अनुमति देता है"
    "Whether you need to separate chapters from an e-book, extract specific sections from a report, or split a scanned document into individual pages, our tool makes it quick and easy" = "चाहे आपको ई-बुक से अध्याय अलग करने की आवश्यकता हो, रिपोर्ट से विशिष्ट खंडों को निकालने की आवश्यकता हो, या स्कैन किए गए दस्तावेज़ को अलग-अलग पेजों में विभाजित करने की आवश्यकता हो, हमारा टूल इसे त्वरित और आसान बनाता है"
}

# Function to fix Hindi encoding in a file
function Fix-HindiEncoding {
    param (
        [string]$filePath
    )
    
    Write-Host "Processing $filePath..."
    
    # Read the file content
    $content = Get-Content -Path $filePath -Raw -Encoding UTF8
    
    # Replace question marks with proper Hindi text
    foreach ($key in $hindiTranslations.Keys) {
        $pattern = [regex]::Escape($key)
        $content = $content -replace "(?i)$pattern", $hindiTranslations[$key]
    }
    
    # Replace question marks in title and meta tags
    $content = $content -replace '<title>SmileyPDF - \?+', '<title>स्माइलीपीडीएफ - मुफ्त ऑनलाइन पीडीएफ टूल्स'
    $content = $content -replace '<meta name="description" content="\?+', '<meta name="description" content="स्माइलीपीडीएफ के साथ अपने पीडीएफ दस्तावेजों को आसानी से प्रबंधित करें। पीडीएफ एडिट करें, मर्ज करें, स्प्लिट करें और कन्वर्ट करें - 100% मुफ्त, कोई पंजीकरण नहीं, कोई वॉटरमार्क नहीं।'
    $content = $content -replace '<meta name="keywords" content="\?+', '<meta name="keywords" content="मुफ्त पीडीएफ टूल्स, पीडीएफ एडिटर, पीडीएफ स्प्लिटर, पीडीएफ मर्जर, पीडीएफ कन्वर्टर, पीडीएफ से वर्ड, पीडीएफ से जेपीजी'
    
    # Save the file with UTF-8 encoding
    $utf8WithoutBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($filePath, $content, $utf8WithoutBom)
    
    Write-Host "Fixed encoding in $filePath"
}

# Process all Hindi HTML files
$hindiFiles = Get-ChildItem -Path "hi" -Filter "*.html" -Recurse
foreach ($file in $hindiFiles) {
    Fix-HindiEncoding -filePath $file.FullName
}

Write-Host "Hindi encoding fixed in all files!"
