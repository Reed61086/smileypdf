param (
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)

# Read the HTML file
$content = Get-Content -Path $FilePath -Raw -Encoding UTF8

# Check if dark mode is already added
if ($content -match "dark-mode\.js" -or $content -match "dark-mode\.css") {
    Write-Host "Dark mode already added to $FilePath"
    return
}

# Add dark mode CSS link in the head section
$headPattern = "</head>"
$darkModeCssLink = '<link rel="stylesheet" href="' + (Split-Path -Path $FilePath -IsAbsolute ? "" : (("../" * (($FilePath.Split([IO.Path]::DirectorySeparatorChar) | Where-Object { $_ -eq "hi" }).Count))) + 'dark-mode.css">' + "`n</head>"
$content = $content -replace $headPattern, $darkModeCssLink

# Add dark mode JS script before the closing body tag
$bodyPattern = "</body>"
$darkModeJsScript = '<script src="' + (Split-Path -Path $FilePath -IsAbsolute ? "" : (("../" * (($FilePath.Split([IO.Path]::DirectorySeparatorChar) | Where-Object { $_ -eq "hi" }).Count))) + 'dark-mode.js"></script>' + "`n</body>"
$content = $content -replace $bodyPattern, $darkModeJsScript

# Add dark mode toggle button in the header (assuming there's a language selector div)
$langSelectorPattern = '<div class="flex items-center">'
$darkModeToggle = @"
<div class="flex items-center">
    <button class="theme-toggle ml-4 text-white hover:text-blue-200 focus:outline-none" aria-label="Toggle Dark Mode">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 moon-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z" />
        </svg>
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 sun-icon hidden" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z" />
        </svg>
    </button>
"@

if ($content -match $langSelectorPattern) {
    $content = $content -replace $langSelectorPattern, $darkModeToggle
} else {
    # If language selector div is not found, try to add it to the header
    $headerPattern = '<div class="md:hidden">'
    $darkModeToggleAlt = @"
<div class="flex items-center mr-4">
    <button class="theme-toggle text-white hover:text-blue-200 focus:outline-none" aria-label="Toggle Dark Mode">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 moon-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z" />
        </svg>
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 sun-icon hidden" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z" />
        </svg>
    </button>
</div>
<div class="md:hidden">
"@
    $content = $content -replace $headerPattern, $darkModeToggleAlt
}

# Add dark mode class to html tag
$htmlPattern = '<html'
$darkModeHtml = '<html class="light"'
$content = $content -replace $htmlPattern, $darkModeHtml

# Update Tailwind config to support dark mode
$tailwindPattern = '<script src="https://cdn.tailwindcss.com"></script>'
$tailwindConfig = @"
<script src="https://cdn.tailwindcss.com"></script>
<script>
    tailwind.config = {
        darkMode: 'class',
        theme: {
            extend: {}
        }
    }
</script>
"@
$content = $content -replace $tailwindPattern, $tailwindConfig

# Write the modified content back to the file
$content | Set-Content -Path $FilePath -Encoding UTF8

Write-Host "Added dark mode to $FilePath"
