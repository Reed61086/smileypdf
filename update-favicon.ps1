# Get all HTML files
$htmlFiles = Get-ChildItem -Recurse -Include *.html

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.FullName)"
    
    # Read the content of the file
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if there's already a favicon link
    if ($content -match '<link rel="icon"') {
        # Replace the existing favicon link
        if ($file.DirectoryName -like "*\hi*") {
            # For files in the 'hi' directory
            $content = $content -replace '<link rel="icon".*?>', '<link rel="icon" type="image/x-icon" href="../favicon.ico">'
        } else {
            # For files in the root directory
            $content = $content -replace '<link rel="icon".*?>', '<link rel="icon" type="image/x-icon" href="favicon.ico">'
        }
        
        Write-Host "Updated favicon in $($file.Name)"
    } else {
        # Add a new favicon link after the meta tags
        if ($file.DirectoryName -like "*\hi*") {
            # For files in the 'hi' directory
            $content = $content -replace '(<meta.*?>)(?!.*<meta)', "$1`n    <link rel=""icon"" type=""image/x-icon"" href=""../favicon.ico"">"
        } else {
            # For files in the root directory
            $content = $content -replace '(<meta.*?>)(?!.*<meta)', "$1`n    <link rel=""icon"" type=""image/x-icon"" href=""favicon.ico"">"
        }
        
        Write-Host "Added favicon to $($file.Name)"
    }
    
    # Write the updated content back to the file
    Set-Content -Path $file.FullName -Value $content -NoNewline
}

Write-Host "Done updating favicon in all HTML files."
