# Get all HTML files
$htmlFiles = Get-ChildItem -Recurse -Include *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.FullName)"
    
    # Read the content of the file
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if GTM is present
    if ($content -match "GTM-WRM63JPK") {
        # Remove GTM script from head
        $gtmHeadPattern = @"
<!-- Google Tag Manager -->
<script>\(function\(w,d,s,l,i\){w\[l\]=w\[l\]\|\|\[\];w\[l\]\.push\({'gtm\.start':
new Date\(\)\.getTime\(\),event:'gtm\.js'\}\);var f=d\.getElementsByTagName\(s\)\[0\],
j=d\.createElement\(s\),dl=l!='dataLayer'\?'&l='\+l:'';j\.async=true;j\.src=
'https://www\.googletagmanager\.com/gtm\.js\?id='\+i\+dl;f\.parentNode\.insertBefore\(j,f\);
}\)\(window,document,'script','dataLayer','GTM-WRM63JPK'\);</script>
<!-- End Google Tag Manager -->

"@
        
        # Remove GTM noscript from body
        $gtmBodyPattern = @"
<!-- Google Tag Manager \(noscript\) -->
<noscript><iframe src="https://www\.googletagmanager\.com/ns\.html\?id=GTM-WRM63JPK"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager \(noscript\) -->

"@
        
        # Remove both GTM code blocks
        $content = $content -replace $gtmHeadPattern, ""
        $content = $content -replace $gtmBodyPattern, ""
        
        # Write the updated content back to the file
        Set-Content -Path $file.FullName -Value $content -NoNewline
        
        Write-Host "Removed GTM from $($file.Name)"
    } else {
        Write-Host "No GTM found in $($file.Name), skipping..."
    }
}

Write-Host "Done removing GTM from all HTML files."
