# PowerShell script to update all Hindi HTML files with new header and footer

# Read the template files
$header = Get-Content -Path "templates/header.html" -Raw
$footer = Get-Content -Path "templates/footer.html" -Raw

# Modify header for Hindi version
$hindiHeader = $header -replace 'href="index.html"', 'href="../index.html"'
$hindiHeader = $hindiHeader -replace 'href="([\w-]+)\.html"', 'href="$1.html"'
$hindiHeader = $hindiHeader -replace '<img src="logo.webp"', '<img src="../logo.webp"'
$hindiHeader = $hindiHeader -replace '<span class="font-bold text-xl hidden sm:inline-block">SmileyPDF</span>', '<span class="font-bold text-xl hidden sm:inline-block">SmileyPDF हिंदी</span>'

# Modify footer for Hindi version
$hindiFooter = $footer -replace 'href="index.html"', 'href="../index.html"'
$hindiFooter = $hindiFooter -replace 'href="([\w-]+)\.html"', 'href="$1.html"'

# Get all HTML files in the Hindi directory
$htmlFiles = Get-ChildItem -Path "hi/*.html" -File

# Process each HTML file
foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.Name)..."
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Skip already updated files (those that have the new indigo-700 to-purple-800 gradient)
    if ($content -match "from-indigo-700 to-purple-800") {
        Write-Host "  File already updated, skipping."
        continue
    }
    
    # Update the header
    $newContent = $content -replace '(?s)<!-- Header -->.*?</header>', $hindiHeader
    
    # Update the footer
    $newContent = $newContent -replace '(?s)<!-- Footer -->.*?</footer>', $hindiFooter
    
    # Update favicon references
    $newContent = $newContent -replace '<link rel="icon" type="image/x-icon" href="favicon.ico">', '<link rel="icon" type="image/svg+xml" href="../images/favicon.svg">
    <link rel="icon" type="image/x-icon" href="../favicon.ico">'
    
    # Update logo references
    $newContent = $newContent -replace 'logo.png', '../logo.webp'
    $newContent = $newContent -replace 'src="logo.webp"', 'src="../logo.webp"'
    
    # Remove Google Tag Manager code
    $newContent = $newContent -replace '(?s)<!-- AdSense Script -->.*?</script>', '<!-- No external scripts for privacy -->'
    
    # Update color scheme
    $newContent = $newContent -replace 'bg-blue-600', 'bg-indigo-600'
    $newContent = $newContent -replace 'hover:bg-blue-700', 'hover:bg-indigo-700'
    $newContent = $newContent -replace 'text-blue-600', 'text-indigo-600'
    $newContent = $newContent -replace 'text-blue-700', 'text-indigo-700'
    $newContent = $newContent -replace 'bg-blue-100', 'bg-indigo-100'
    $newContent = $newContent -replace 'bg-blue-50', 'bg-indigo-50'
    $newContent = $newContent -replace 'text-blue-800', 'text-indigo-800'
    $newContent = $newContent -replace 'border-blue-200', 'border-indigo-200'
    $newContent = $newContent -replace 'from-blue-500 to-blue-700', 'from-indigo-700 to-purple-800'
    
    # Add hit counter to bottom of page if not already present
    if (-not ($newContent -match "hitscounter.dev")) {
        $newContent = $newContent -replace '</body>', '<img src="https://hitscounter.dev/api/hit?url=www.smileypdf.com/hi&label=SmileyPDF-Hindi&icon=check2&color=%23052c65" width="1" height="1" style="opacity:0.1">
</body>'
    }
    
    # Fix CSS and JS references
    $newContent = $newContent -replace 'href="styles.css"', 'href="../styles.css"'
    $newContent = $newContent -replace 'src="dark-mode.js"', 'src="../dark-mode.js"'
    
    # Write the updated content back to the file
    Set-Content -Path $file.FullName -Value $newContent
    
    Write-Host "  Updated successfully."
}

Write-Host "All Hindi files have been updated!"
