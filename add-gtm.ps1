# Get all HTML files
$htmlFiles = Get-ChildItem -Recurse -Include *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.FullName)"
    
    # Read the content of the file
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if GTM is already added
    if ($content -match "GTM-WRM63JPK") {
        Write-Host "GTM already exists in $($file.Name), skipping..."
        continue
    }
    
    # Add GTM script to head
    $gtmHeadCode = @"
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-WRM63JPK');</script>
<!-- End Google Tag Manager -->

"@

    # Add GTM noscript to body
    $gtmBodyCode = @"
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WRM63JPK"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

"@

    # Insert GTM head code after <head>
    $content = $content -replace "(<head>)", "`$1`n$gtmHeadCode"
    
    # Insert GTM body code after <body>
    $content = $content -replace "(<body[^>]*>)", "`$1`n$gtmBodyCode"
    
    # Write the updated content back to the file
    Set-Content -Path $file.FullName -Value $content -NoNewline
    
    Write-Host "Added GTM to $($file.Name)"
}

Write-Host "Done adding GTM to all HTML files."
