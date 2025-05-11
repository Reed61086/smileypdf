Add-Type -AssemblyName System.Drawing

# Load the source image
$img = [System.Drawing.Image]::FromFile("logo.png")

# Create multiple sizes for better browser compatibility
$sizes = @(16, 32, 48)
$bitmaps = @()

foreach ($size in $sizes) {
    $bitmap = New-Object System.Drawing.Bitmap($img, $size, $size)
    $bitmaps += $bitmap
}

# Save as ICO with multiple sizes
$ms = New-Object System.IO.MemoryStream
$bw = New-Object System.IO.BinaryWriter($ms)

# ICO header
$bw.Write([Int16]0) # reserved
$bw.Write([Int16]1) # type: 1 = ICO
$bw.Write([Int16]$bitmaps.Count) # number of images

# Directory entries
$offset = 6 + (16 * $bitmaps.Count)

foreach ($bitmap in $bitmaps) {
    $width = if ($bitmap.Width -eq 256) { 0 } else { $bitmap.Width }
    $height = if ($bitmap.Height -eq 256) { 0 } else { $bitmap.Height }
    
    # Save bitmap to memory
    $imgMs = New-Object System.IO.MemoryStream
    $bitmap.Save($imgMs, [System.Drawing.Imaging.ImageFormat]::Png)
    $imgBytes = $imgMs.ToArray()
    $imgSize = $imgBytes.Length
    
    # Write directory entry
    $bw.Write([Byte]$width)
    $bw.Write([Byte]$height)
    $bw.Write([Byte]0) # color palette
    $bw.Write([Byte]0) # reserved
    $bw.Write([Int16]1) # color planes
    $bw.Write([Int16]32) # bits per pixel
    $bw.Write([Int32]$imgSize) # image size
    $bw.Write([Int32]$offset) # image offset
    
    $offset += $imgSize
    $imgMs.Close()
}

# Write image data
foreach ($bitmap in $bitmaps) {
    $imgMs = New-Object System.IO.MemoryStream
    $bitmap.Save($imgMs, [System.Drawing.Imaging.ImageFormat]::Png)
    $imgBytes = $imgMs.ToArray()
    $bw.Write($imgBytes)
    $imgMs.Close()
}

# Save to file
$bytes = $ms.ToArray()
[System.IO.File]::WriteAllBytes("favicon.ico", $bytes)

# Clean up
$ms.Close()
$bw.Close()
foreach ($bitmap in $bitmaps) {
    $bitmap.Dispose()
}
$img.Dispose()

Write-Host "Better favicon created successfully!"
