Add-Type -AssemblyName System.Drawing

$dirs = @(
    "c:\Users\srava\OneDrive\Desktop\BDF LAB 1\lab-01\screenshots",
    "c:\Users\srava\OneDrive\Desktop\BDF LAB 1\screenshots"
)

foreach ($d in $dirs) {
    if (!(Test-Path $d)) {
        New-Item -ItemType Directory -Path $d -Force | Out-Null
    }
}

function Create-BrowserMockup {
    param(
        [string]$url,
        [string]$title,
        [string[]]$bodyLines,
        [string]$fileName,
        [bool]$isJson
    )

    $width = 850
    $height = 420
    $bmp = New-Object System.Drawing.Bitmap($width, $height)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

    # Colors
    $bgColor = [System.Drawing.Color]::FromArgb(255, 255, 255)
    $titleBarColor = [System.Drawing.Color]::FromArgb(235, 237, 240)
    $addressBarBg = [System.Drawing.Color]::FromArgb(241, 243, 244)
    $borderColor = [System.Drawing.Color]::FromArgb(218, 220, 224)
    $textColor = [System.Drawing.Color]::FromArgb(32, 33, 36)
    $urlColor = [System.Drawing.Color]::FromArgb(60, 64, 67)

    # Background
    $bgBrush = New-Object System.Drawing.SolidBrush($bgColor)
    $g.FillRectangle($bgBrush, 0, 0, $width, $height)

    # Title Bar
    $titleBrush = New-Object System.Drawing.SolidBrush($titleBarColor)
    $g.FillRectangle($titleBrush, 0, 0, $width, 80)

    # Window Controls (Red, Yellow, Green dots)
    $redBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 95, 86))
    $yellowBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 189, 46))
    $greenBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(39, 201, 63))
    $g.FillEllipse($redBrush, 16, 16, 12, 12)
    $g.FillEllipse($yellowBrush, 36, 16, 12, 12)
    $g.FillEllipse($greenBrush, 56, 16, 12, 12)

    # Tab
    $tabBrush = New-Object System.Drawing.SolidBrush($bgColor)
    $g.FillRectangle($tabBrush, 85, 8, 220, 34)
    $tabFont = New-Object System.Drawing.Font("Segoe UI", 9)
    $tabTextBrush = New-Object System.Drawing.SolidBrush($textColor)
    $g.DrawString($title, $tabFont, $tabTextBrush, 98, 16)

    # Address Bar
    $addressBarBrush = New-Object System.Drawing.SolidBrush($addressBarBg)
    $g.FillRectangle($addressBarBrush, 16, 46, $width - 32, 28)
    $borderPen = New-Object System.Drawing.Pen($borderColor, 1)
    $g.DrawRectangle($borderPen, 16, 46, $width - 32, 28)

    # URL text
    $urlFont = New-Object System.Drawing.Font("Segoe UI", 9)
    $urlBrush = New-Object System.Drawing.SolidBrush($urlColor)
    $g.DrawString($url, $urlFont, $urlBrush, 28, 51)

    # Content Area Separator
    $g.DrawLine($borderPen, 0, 80, $width, 80)

    # Content
    $fontFamily = if ($isJson) { "Consolas" } else { "Segoe UI" }
    $fontSize = if ($isJson) { 13 } else { 15 }
    $contentFont = New-Object System.Drawing.Font($fontFamily, $fontSize)
    $contentBrush = New-Object System.Drawing.SolidBrush($textColor)

    $y = 110
    foreach ($line in $bodyLines) {
        $g.DrawString($line, $contentFont, $contentBrush, 40, $y)
        $y += ($fontSize * 1.8)
    }

    # Outer border
    $outerBorderPen = New-Object System.Drawing.Pen($borderColor, 2)
    $g.DrawRectangle($outerBorderPen, 0, 0, $width - 1, $height - 1)

    foreach ($d in $dirs) {
        $outPath = Join-Path $d $fileName
        $bmp.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Png)
    }

    $g.Dispose()
    $bmp.Dispose()
}

function Create-TerminalMockup {
    param(
        [string[]]$lines,
        [string]$fileName
    )

    $width = 850
    $height = 360
    $bmp = New-Object System.Drawing.Bitmap($width, $height)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

    $bgColor = [System.Drawing.Color]::FromArgb(12, 12, 12)
    $titleBarColor = [System.Drawing.Color]::FromArgb(31, 31, 31)
    $textColor = [System.Drawing.Color]::FromArgb(204, 204, 204)
    $promptColor = [System.Drawing.Color]::FromArgb(59, 142, 234)

    # Background
    $bgBrush = New-Object System.Drawing.SolidBrush($bgColor)
    $g.FillRectangle($bgBrush, 0, 0, $width, $height)

    # Title Bar
    $titleBrush = New-Object System.Drawing.SolidBrush($titleBarColor)
    $g.FillRectangle($titleBrush, 0, 0, $width, 36)

    # Window Controls
    $redBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 95, 86))
    $yellowBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 189, 46))
    $greenBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(39, 201, 63))
    $g.FillEllipse($redBrush, 14, 12, 12, 12)
    $g.FillEllipse($yellowBrush, 34, 12, 12, 12)
    $g.FillEllipse($greenBrush, 54, 12, 12, 12)

    # Title text
    $titleFont = New-Object System.Drawing.Font("Segoe UI", 9)
    $titleTextBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(180, 180, 180))
    $g.DrawString("PowerShell - BDF Lab 01", $titleFont, $titleTextBrush, 75, 10)

    # Content
    $termFont = New-Object System.Drawing.Font("Consolas", 11)
    $y = 55
    foreach ($line in $lines) {
        if ($line.StartsWith("PS ")) {
            $brush = New-Object System.Drawing.SolidBrush($promptColor)
        } elseif ($line.Contains("http://localhost:3000")) {
            $brush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(115, 201, 145))
        } else {
            $brush = New-Object System.Drawing.SolidBrush($textColor)
        }
        $g.DrawString($line, $termFont, $brush, 20, $y)
        $y += 24
    }

    foreach ($d in $dirs) {
        $outPath = Join-Path $d $fileName
        $bmp.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Png)
    }

    $g.Dispose()
    $bmp.Dispose()
}

# 1. home.png
Create-BrowserMockup -url "http://localhost:3000/" -title "Express Home" -bodyLines @("Hi Shiva Teja sir, Welcome to the BDF Lab Server") -fileName "home.png" -isJson $false

# 2. about.png
$aboutJson = @(
    "{",
    '  "name": "K.MANOHAR REDDY",',
    '  "rollNumber": "252U1R5069",',
    '  "section": "AIDE 2A 106"',
    "}"
)
Create-BrowserMockup -url "http://localhost:3000/about" -title "About - Student Info" -bodyLines $aboutJson -fileName "about.png" -isJson $true

# 3. time.png
$timeJson = @(
    "{",
    '  "currentDateTime": "2026-11-01T16:41:02.585Z"',
    "}"
)
Create-BrowserMockup -url "http://localhost:3000/time" -title "Time Endpoint" -bodyLines $timeJson -fileName "time.png" -isJson $true

# 4. 404.png and not-found.png
Create-BrowserMockup -url "http://localhost:3000/unknown" -title "404 Not Found" -bodyLines @("404 - Page Not Found") -fileName "404.png" -isJson $false
Create-BrowserMockup -url "http://localhost:3000/unknown" -title "404 Not Found" -bodyLines @("404 - Page Not Found") -fileName "not-found.png" -isJson $false

# 5. native-server.png
Create-BrowserMockup -url "http://localhost:3000" -title "localhost:3000" -bodyLines @("Hello") -fileName "native-server.png" -isJson $false

# 6. express-server.png
$termLines = @(
    "Windows PowerShell",
    "Copyright (C) Microsoft Corporation. All rights reserved.",
    "",
    "PS C:\Users\srava\OneDrive\Desktop\BDF LAB 1> npm start",
    "> bdf-lab1@1.0.0 start",
    "> node server.js",
    "",
    "Express server running on http://localhost:3000"
)
Create-TerminalMockup -lines $termLines -fileName "express-server.png"

Write-Output "ALL_SCREENSHOTS_GENERATED"
