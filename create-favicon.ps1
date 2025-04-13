Add-Type -AssemblyName System.Drawing

# Load the source image
$img = [System.Drawing.Image]::FromFile("logo.png")

# Create a new bitmap with the desired size
$bitmap = New-Object System.Drawing.Bitmap($img, 32, 32)

# Save as ICO
$bitmap.Save("favicon.ico", [System.Drawing.Imaging.ImageFormat]::Icon)

# Clean up
$bitmap.Dispose()
$img.Dispose()

Write-Host "Favicon created successfully!"
