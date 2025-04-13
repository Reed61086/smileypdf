# Get all HTML files
$htmlFiles = Get-ChildItem -Recurse -Include *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.FullName)"
    
    # Read the content of the file
    $content = Get-Content -Path $file.FullName -Raw
    
    # Define the pattern to search for
    $pattern = '<!-- Google tag \(gtag\.js\) -->\s*<script async src="https://www\.googletagmanager\.com/gtag/js\?id=.*?"></script>\s*<script>\s*window\.dataLayer = window\.dataLayer \|\| \[\];\s*function gtag\(\)\{dataLayer\.push\(arguments\);\}\s*gtag\(''js'', new Date\(\)\);\s*gtag\(''config'', ''.*?''\);\s*</script>'
    
    # Check if the pattern exists in the content
    if ($content -match $pattern) {
        # Remove the Google Analytics code
        $content = [regex]::Replace($content, $pattern, "", [System.Text.RegularExpressions.RegexOptions]::Singleline)
        
        # Write the updated content back to the file
        Set-Content -Path $file.FullName -Value $content -NoNewline
        
        Write-Host "Removed Google Analytics from $($file.Name)"
    } else {
        Write-Host "No Google Analytics found in $($file.Name), skipping..."
    }
}

Write-Host "Done removing Google Analytics from all HTML files."
