# Script to fix Hindi encoding issues in all Hindi pages

# Process all Hindi HTML files
$hindiFiles = Get-ChildItem -Path "hi" -Filter "*.html" -Recurse
Write-Host "Found $($hindiFiles.Count) Hindi HTML files to process."

foreach ($file in $hindiFiles) {
    Write-Host "Processing $($file.FullName)..."
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    # Replace common Hindi text
    $content = $content -replace "???", "होम"
    $content = $content -replace "?????", "टूल्स"
    $content = $content -replace "?????", "ब्लॉग"
    $content = $content -replace "????? ???? ???", "हमारे बारे में"
    $content = $content -replace "??????", "संपर्क"
    $content = $content -replace "?????", "हिंदी"
    $content = $content -replace "???? ?????", "मेनू खोलें"
    
    # PDF Tools
    $content = $content -replace "PDF ?????", "PDF टूल्स"
    $content = $content -replace "????? ?????", "पीडीएफ टूल्स"
    $content = $content -replace "PDF ?????", "PDF एडिटर"
    $content = $content -replace "PDF ????", "PDF मर्ज"
    $content = $content -replace "???? ?? PDF", "इमेज से PDF"
    $content = $content -replace "PDF ?????", "PDF रोटेट"
    $content = $content -replace "PDF ??????", "PDF रोटेटर"
    $content = $content -replace "PDF ??????? ???????????", "PDF टेक्स्ट एक्सट्रैक्टर"
    $content = $content -replace "PDF ?? JPG", "PDF से JPG"
    $content = $content -replace "PDF ?? ????", "PDF से वर्ड"
    $content = $content -replace "PDF ?? ??????", "PDF से एक्सेल"
    $content = $content -replace "PDF ????????", "PDF स्प्लिटर"
    
    # Footer
    $content = $content -replace "?????????? ?????????", "सर्वाधिकार सुरक्षित"
    
    # Replace any remaining question mark sequences with a placeholder
    $content = $content -replace "(\?{3,})", "[हिंदी_टेक्स्ट]"
    
    # Save the file with UTF-8 encoding
    $utf8WithoutBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($file.FullName, $content, $utf8WithoutBom)
    
    Write-Host "Fixed encoding in $($file.FullName)"
}

Write-Host "Hindi encoding fixed in all files!"
