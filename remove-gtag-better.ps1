# Get all HTML files
$htmlFiles = Get-ChildItem -Recurse -Include *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.FullName)"
    
    # Read the content of the file
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if Google Analytics is present
    if ($content -match "googletagmanager.com/gtag" -or $content -match "dataLayer") {
        # Remove the entire Google Analytics script block
        $startTag = "<!-- Google tag \(gtag\.js\) -->"
        $endTag = "</script>"
        
        if ($content -match "$startTag(.*?)$endTag") {
            $scriptBlock = [regex]::Match($content, "$startTag(.*?)$endTag", [System.Text.RegularExpressions.RegexOptions]::Singleline).Value
            $content = $content.Replace($scriptBlock, "")
            Write-Host "Removed Google Analytics from $($file.Name)"
        }
        
        # Write the updated content back to the file
        Set-Content -Path $file.FullName -Value $content -NoNewline
    } else {
        Write-Host "No Google Analytics found in $($file.Name), skipping..."
    }
}

Write-Host "Done removing Google Analytics from all HTML files."
