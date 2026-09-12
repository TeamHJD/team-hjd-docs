Add-Type -AssemblyName System.Drawing

$sourcePath = Join-Path $PSScriptRoot "..\static\img\brand\teamhjd-light.png"
$outputPath = Join-Path $PSScriptRoot "..\static\img\teamhjd-social-card.png"
$faviconPath = Join-Path $PSScriptRoot "..\static\img\brand\favicon.png"

$canvas = New-Object System.Drawing.Bitmap 1200, 630
$graphics = [System.Drawing.Graphics]::FromImage($canvas)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

$background = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
  (New-Object System.Drawing.Rectangle 0, 0, 1200, 630),
  ([System.Drawing.Color]::FromArgb(12, 31, 42)),
  ([System.Drawing.Color]::FromArgb(17, 57, 67)),
  0
)
$graphics.FillRectangle($background, 0, 0, 1200, 630)

$halo = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(24, 94, 234, 212))
$graphics.FillEllipse($halo, 55, 80, 470, 470)

$divider = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(77, 94, 234, 212))
$graphics.FillRectangle($divider, 590, 132, 2, 368)

$logo = [System.Drawing.Image]::FromFile($sourcePath)
$graphics.DrawImage($logo, (New-Object System.Drawing.Rectangle 75, 95, 430, 430))

$accentFont = New-Object System.Drawing.Font "Arial", 17, ([System.Drawing.FontStyle]::Bold)
$titleFont = New-Object System.Drawing.Font "Arial", 104, ([System.Drawing.FontStyle]::Bold)
$subtitleFont = New-Object System.Drawing.Font "Arial", 22, ([System.Drawing.FontStyle]::Regular)
$accentBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(94, 234, 212))
$textBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(240, 251, 250))
$mutedBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(184, 211, 215))

$graphics.DrawString("TEAMHJD", $accentFont, $accentBrush, 665, 180)
$graphics.DrawString("DOCS", $titleFont, $textBrush, 655, 210)
$graphics.DrawString("KNOWLEDGE BASE", $subtitleFont, $mutedBrush, 665, 365)

$canvas.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

$mutedBrush.Dispose()
$textBrush.Dispose()
$accentBrush.Dispose()
$subtitleFont.Dispose()
$titleFont.Dispose()
$accentFont.Dispose()
$logo.Dispose()
$divider.Dispose()
$halo.Dispose()
$background.Dispose()
$graphics.Dispose()
$canvas.Dispose()

$favicon = New-Object System.Drawing.Bitmap 256, 256
$faviconGraphics = [System.Drawing.Graphics]::FromImage($favicon)
$faviconGraphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$faviconGraphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$faviconGraphics.Clear([System.Drawing.Color]::Transparent)
$faviconBackground = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(16, 52, 66))
$faviconGraphics.FillEllipse($faviconBackground, 4, 4, 248, 248)
$faviconLogo = [System.Drawing.Image]::FromFile($sourcePath)
$faviconGraphics.DrawImage($faviconLogo, (New-Object System.Drawing.Rectangle 27, 20, 202, 220), 195, 75, 270, 285, [System.Drawing.GraphicsUnit]::Pixel)
$favicon.Save($faviconPath, [System.Drawing.Imaging.ImageFormat]::Png)

$faviconLogo.Dispose()
$faviconBackground.Dispose()
$faviconGraphics.Dispose()
$favicon.Dispose()
