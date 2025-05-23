# Script to fix Hindi encoding issues in all Hindi pages

# Define Hindi translations for common terms
$hindiTranslations = @{
    # Navigation
    "???" = "होम"
    "?????" = "टूल्स"
    "?????" = "ब्लॉग"
    "????? ???? ???" = "हमारे बारे में"
    "??????" = "संपर्क"
    "?????" = "हिंदी"
    "???? ?????" = "मेनू खोलें"
    
    # PDF Tools
    "PDF ?????" = "PDF टूल्स"
    "PDF ?????" = "PDF एडिटर"
    "PDF ????" = "PDF मर्ज"
    "???? ?? PDF" = "इमेज से PDF"
    "PDF ?????" = "PDF रोटेट"
    "PDF ??????? ???????????" = "PDF टेक्स्ट एक्सट्रैक्टर"
    "PDF ?? JPG" = "PDF से JPG"
    "PDF ?? ????" = "PDF से वर्ड"
    "PDF ?? ??????" = "PDF से एक्सेल"
    "PDF ????????" = "PDF स्प्लिटर"
    
    # Common UI elements
    "??????" = "अपलोड"
    "???????" = "डाउनलोड"
    "???????" = "प्रोसेस"
    "??????..." = "प्रोसेसिंग..."
    "???? ??????" = "फाइल चुनें"
    "???? ?? ????? ??? ???? ?? ???? ??? ??????" = "फाइल को चुनने के लिए या यहां ड्रैग करें"
    "??????? ???? ????" = "अधिकतम फाइल साइज"
    
    # Footer
    "SmileyPDF ?? ???? ???" = "SmileyPDF के बारे में"
    "????? ??????" = "त्वरित लिंक्स"
    "?????? ?? ??????" = "कानूनी व सहायता"
    "???????? ????" = "प्राइवेसी पॉलिसी"
    "???? ?? ??????" = "सेवा की शर्तें"
    "????? ?????" = "सहायता प्राप्त करें"
    "?? ???????? ?? ??? ????? ????" = "नए अपडेट्स के लिए साइन अप्प"
    "?????? PDF ????? ?? ????? ?? ??? ????? ?????????? ?? ??????? ????" = "नवीनतम PDF टूल्स के लॉन्च के बारे में सबसे पहले जानकारी पाएं"
    "???? ???? ???" = "आपका ईमेल पता"
    "??????? ???" = "सब्सक्राइब करें"
    "?? ???? ???????? ?? ?????? ???? ???? ???? ?? ??? ??????? ?????? ?????" = "हम आपकी प्राइवेसी का सम्मान करते हैं और कभी स्पैम नहीं भेजेंगे"
    "?????????? ?????????" = "सर्वाधिकार सुरक्षित"
    
    # PDF Splitter specific
    "?????? ??????" = "स्प्लिट विकल्प"
    "??????? ?? ??? ?????" = "निकालने के लिए पेजेस"
    "????? ???????? ??/?? ????? ???? ?? ????????? ?? ??? ???? ???? ?????" = "अलग पृष्ठों को/या पेज रेंज को अल्पविराम से अलग करके दर्ज करें"
    "??????" = "उदाहरण"
    "?????? ????" = "स्प्लिट मोड"
    "????? ??????? ?? ?? ?? PDF ??? ???????" = "चुने पृष्ठों को एक नई PDF में निकालें"
    "????? ??????? ?? ????? ?? ?? PDF ?????" = "चुने पृष्ठों को हटाकर नई PDF बनाएं"
    "???????? ????? ?? ??? PDF ??? ??????? ????" = "प्रत्येक पृष्ठ को अलग PDF में विभाजित करें"
    "?? N ??????? ?? ??? ??????? ????" = "हर N पृष्ठों के बाद विभाजित करें"
    "???????? PDF ??? ??????? ?? ??????" = "प्रत्येक PDF में पृष्ठों की संख्या"
    "PDF ??????? ????" = "PDF विभाजित करें"
    "PDF ??????? ?? ??? ??" = "PDF प्रोसेसिंग की जा रही है"
    "??????" = "परिणाम"
    "?? PDF ?? ??? ???? ????" = "नई PDF के साथ शुरू करें"
    "??????" = "त्रुटि"
    "PDF ??????? ???? ??? ?? ?????? ???? ????? ?????? ????? ?????" = "PDF प्रोसेसिंग करते समय एक समस्या हुई। कृपया दोबारा प्रयास करें।"
    
    # PDF to Word specific
    "PDF ?? ???? - PDF ?? Word ????????? ??? ?????" = "PDF से वर्ड - PDF को Word दस्तावेज़ में बदलें"
    "????? ????? ?????? PDF ?? Word ???????? ?? ??? PDF ?????? ?? ?????? ????? Word ??????????? ??? ?????? ?????????? ???? ???? ?? ???? ?????? ?? ???????? ?????" = "हमारे मुफ्त ऑनलाइन PDF से Word कन्वर्टर के साथ PDF फाइलों को आसानी से संपादन योग्य Word दस्तावेज़ों में बदलें। पाठ्य और फॉर्मेटिंग को सुरक्षित रखें"
    "PDF ?? ????, PDF ?? Word ????????, PDF ?? Word ??? ?????, PDF ?? DOCX, ?????? PDF ????????" = "PDF से वर्ड, PDF से Word कन्वर्टर, PDF से Word में बदलें, PDF से DOCX, हिंदी PDF कन्वर्टर"
    "PDF ?? ???? ????????" = "PDF से वर्ड कन्वर्टर"
    "???? PDF ?????? ?? ????? ?? ?????? ????? Word ??????????? ??? ?????? ????? ????? ?????? ??? ?????????? ?? ????? ?? ???? ???? ???" = "अपनी PDF फाइलों को आसानी से संपादन योग्य Word दस्तावेज़ों में बदलें और पाठ्य सामग्री की फॉर्मेटिंग को बनाए रखें"
    "???? PDF ???? ????? ?? ???? ??????" = "अपनी PDF फाइल चुनें या यहाँ खींचें"
    "?????? ???? ?????" = "अधिकतम फाइल साइज"
    "???? ?????" = "फाइल चुनें"
    "???? ?????? ???????? ???? ??? ?????? ???? ???????? ??? ?? ??????? ?? ???? ??? ?? ????? ????? ?? ????? ???? ???? ????" = "आपकी फाइलें सुरक्षित रहती हैं क्योंकि सभी प्रोसेसिंग आपके ब्राउजर में ही होती है और कोई फाइल हमारे सर्वर पर अपलोड नहीं होती हैं"
    "???? PDF ???? ?? Word ????????? ??? ???? ?? ??? ??" = "आपकी PDF फाइल को Word दस्तावेज़ में बदला जा रहा है"
    "?? ????????? ???? ?? ???? ?? ?????? ?? ???? ?? ??? ????? ?? ??? ???? ?? ?? ???? ???" = "यह प्रक्रिया फाइल के आकार के आधार पर कुछ सेकंड से कुछ मिनट तक ले सकती है"
    "???????? ???? ???!" = "कन्वर्ट हो गया है!"
    "???? PDF ???? ??????????? Word ????????? ??? ??? ?? ?? ???" = "आपकी PDF फाइल सफलतापूर्वक Word दस्तावेज़ में बदल दी गई है"
    "Word ???? ??????? ????" = "Word फाइल डाउनलोड करें"
    "????? ???? ??????? ????" = "दूसरी फाइल कन्वर्ट करें"
    "??? ??? ?? ???!" = "कुछ गड़बड़ हो गई!"
    "???? ???? ?? ??????? ???? ??? ?? ?????? ???? ????? ?????? ????? ???? ?? ????? ???? ?? ????? ?????" = "आपकी फाइल को कन्वर्ट करते समय एक समस्या हुई। कृपया दोबारा प्रयास करें या दूसरी फाइल के साथ कोशिश करें"
    "?????? ????? ????" = "दोबारा प्रयास करें"
    "????? PDF ?? ???? ???????? ?? ?????????" = "हमारे PDF से वर्ड कन्वर्टर की विशेषताएं"
    "100% ????????" = "100% सुरक्षित"
    "???? ?????? ???? ??? ?? ???????? ???? ????? ??? ???????-???? ?????????? ?? ????? ???? ??, ????? ???? ?? ?? ???? ?????? ???? ???????? ??? ?? ??????? ?? ???? ??? ?? ????? ????? ?? ??? ????? ???? ???? ????" = "आपकी फाइलें आपके ब्राउजर में ही प्रोसेस की जाती हैं और हमारे सर्वर पर कभी अपलोड नहीं होती हैं। आपकी फाइल की गोपनीयता सुनिश्चित रहती है"
    "???? ????????" = "उच्च गुणवत्ता"
    "????? ??? ???? PDF ????????? ?? ??? ??????????, ????? ?? ????? ?? ???? ???? ??, ????? ???? Word ??? ??????? ?????? ???? ????? ???" = "हमारा टूल आपके PDF दस्तावेज़ की फॉर्मेटिंग, लेआउट और स्टाइल को बनाए रखता है, जिससे आपको Word में सटीकता सुनिश्चित होती है"
    "???? ??? ?????" = "पूरी तरह मुफ्त"
    "????? PDF ?? ???? ???????? 100% ????? ??? ??? ???? ??? ?????, ??? ?????????, ?? ??? ???? ????? ?? ???? ???? ???" = "हमारा PDF से वर्ड कन्वर्टर 100% मुफ्त है और कोई छिपी लागत, कोई सदस्यता, या कोई क्रेडिट कार्ड विवरण की मांग नहीं है"
    "?? ???? ??? ???? ??" = "यह कैसे काम करता है"
    "PDF ????? ????" = "PDF अपलोड करें"
    "???? PDF ???? ????? ?? ??? ????? ??? ????? ????? ?? ?? ??? ??? ?? ???? ????? ?? ???? ????" = "अपनी PDF फाइल चुनें या उसे अपलोड क्षेत्र में खींचें या ड्रॉप करें और हमारा टूल उसे लोड करेगा"
    "??????? ????" = "प्रोसेस करें"
    "\"??????? ????\" ??? ?? ????? ???? ?? ????? ??? ???? PDF ???? ?? Word ????????? ??? ??? ?????" = "\"प्रोसेस करें\" बटन पर क्लिक करें और हमारा टूल आपकी PDF फाइल को Word दस्तावेज़ में बदल देगा"
    "??????? ????" = "डाउनलोड करें"
    "???????? ???? ???? ?? ???, ???? ?? Word ???? ??????? ???? ?? ??? Microsoft Word ?? ???? ???? ????????? ??? ??????? ?????" = "प्रोसेसिंग पूरी होने के बाद, अपनी नई Word फाइल डाउनलोड करें और इसे Microsoft Word या किसी अन्य संगत प्रोग्राम में संपादित करें"
    "????? ???? ???? ???? ??????" = "अक्सर पूछे जाने वाले प्रश्न"
    "???? ???? PDF ?????? ???????? ????" = "क्या मेरी PDF फाइलें सुरक्षित हैं?"
    "???, ???? ?????? ???? ??? ?? ???????? ???? ????? ??? ???????-???? ?????????? ?? ????? ???? ??, ????? ???? ?? ?? ???? ?????? ???? ???????? ??? ?? ??????? ?? ???? ??? ?? ????? ????? ?? ??? ????? ???? ???? ????" = "हाँ, आपकी फाइलों की सुरक्षा हमारी सबसे बड़ी प्राथमिकता है। हमारा टूल क्लाइंट-साइड प्रोसेसिंग का उपयोग करता है, जिसका अर्थ है कि आपकी फाइलें आपके ब्राउजर में ही प्रोसेस की जाती हैं और हमारे सर्वर पर कभी अपलोड नहीं होती हैं"
    "???? ??? ??????? ?? ???????? PDF ?????? ?? ??????? ?? ???? ????" = "क्या मैं पासवर्ड से सुरक्षित PDF फाइलों को कन्वर्ट कर सकता हूँ?"
    "????, ????? ??? ??????? ??? ??????? ?? ???????? PDF ?????? ?? ??????? ???? ?? ???? ??? ???? ???? ???? ???? ?? ??????? ??????? ????? ?????" = "नहीं, वर्तमान में हमारा टूल पासवर्ड से सुरक्षित PDF फाइलों को कन्वर्ट नहीं कर सकता है। आपको पहले फाइल का पासवर्ड हटाना होगा"
    "???? ?????????? ??? ??????" = "क्या फॉर्मेटिंग बनी रहेगी?"
    "????? ??? ??????? ?????????? ?? ???? ???? ?? ?????? ???? ??, ?????? ?????, ?????????, ????? ????? ?? ???? ????? ???? ???????, ???? ????? ???? ??????????? ??? ??? ?????? ?????????? ???? ?? ???? ????" = "हमारा टूल अधिकांश फॉर्मेटिंग को बनाए रखने का प्रयास करता है, जिसमें फॉन्ट, पैराग्राफ, इमेज आदि शामिल हैं। हालांकि, कुछ जटिल फॉर्मेटिंग में थोड़ा परिवर्तन हो सकता है"
    "??? ??? ?????? ?? PDF ?????? ??????? ?? ???? ????" = "क्या मैं स्कैन की PDF फाइलें कन्वर्ट कर सकता हूँ?"
    "?? ???? ?? ???? PDF ???? ?? ??????? ?? ???? ???? ????? ??? ???????-?????? PDF ?? ????? ??? ?? ??????????? ????? ?? ??? ??? ???? ??, ??????? ????? ??? ?? ??????????? ?? ??? OCR (??????? ???????? ?????????) ?? ???????? ???? ??, ????? ?????? ????? ?? ???? ?? ???? ????" = "यह निर्भर करता है कि आपकी PDF फाइल कैसी है। हमारा टूल सामान्य-टेक्स्ट PDF के साथ सबसे अच्छा परिणाम देता है, लेकिन स्कैन की गई दस्तावेज़ों के लिए OCR (ऑप्टिकल कैरेक्टर रेकग्निशन) की आवश्यकता होती है, जिसका समर्थन हमारे टूल में सीमित है"
    "???? ???? Microsoft Word ?? ???????? ???" = "क्या मुझे Microsoft Word की आवश्यकता है?"
    "???? ????????? ???? ?? ????? ?? ??????? ???? ?? ??? Microsoft Word ?? ???? ???? ???? ???? ???????? (???? LibreOffice Writer ?? Google Docs) ?? ???????? ?????" = "आपको डाउनलोड की गई फाइल को देखने या संपादित करने के लिए Microsoft Word या किसी अन्य वर्ड प्रोसेसर (जैसे LibreOffice Writer या Google Docs) की आवश्यकता होगी"
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
        if ($content -match [regex]::Escape($key)) {
            $content = $content -replace [regex]::Escape($key), $hindiTranslations[$key]
        }
    }
    
    # Save the file with UTF-8 encoding
    $utf8WithoutBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($filePath, $content, $utf8WithoutBom)
    
    Write-Host "Fixed encoding in $filePath"
}

# Process all Hindi HTML files
$hindiFiles = Get-ChildItem -Path "hi" -Filter "*.html" -Recurse
Write-Host "Found $($hindiFiles.Count) Hindi HTML files to process."

foreach ($file in $hindiFiles) {
    Fix-HindiEncoding -filePath $file.FullName
}

Write-Host "Hindi encoding fixed in all files!"
