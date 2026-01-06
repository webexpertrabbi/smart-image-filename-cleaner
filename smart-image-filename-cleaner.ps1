# ==============================
# USER CONFIGURATION ZONE
# ==============================

# Supported image extensions
$imageExtensions = @(
    ".webp", ".jpg", ".jpeg", ".png",
    ".gif", ".bmp", ".svg", ".avif"
)

# Words to remove from filename (anywhere)
$removeWords = @(
    "https",
    "www",
    "com",
    "co",
    "net",
    "io",
    "info",
    "net",
    "combd"
)

# Remove characters from START of filename
$removeFromStart = 0   # example: 3 = remove first 3 chars

# Remove characters from END of filename (before extension)
$removeFromEnd = 0     # example: 5 = remove last 5 chars

# Remove dash + hash like -695cbe1522b04
$removeHashSuffix = $true
$hashRegex = '-[a-f0-9]{8,20}$'

# DRY RUN (true = preview only, false = real rename)
$dryRun = $false


# ==============================
# ENGINE (DO NOT TOUCH)
# ==============================

Get-ChildItem | Where-Object {
    $imageExtensions -contains $_.Extension.ToLower()
} | ForEach-Object {

    $original = $_.Name
    $name = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
    $ext  = $_.Extension

    # Remove words
    foreach ($word in $removeWords) {
        $name = $name -replace [regex]::Escape($word), ""
    }

    # Remove hash suffix
    if ($removeHashSuffix) {
        $name = $name -replace $hashRegex, ""
    }

    # Remove from start
    if ($removeFromStart -gt 0 -and $name.Length -gt $removeFromStart) {
        $name = $name.Substring($removeFromStart)
    }

    # Remove from end
    if ($removeFromEnd -gt 0 -and $name.Length -gt $removeFromEnd) {
        $name = $name.Substring(0, $name.Length - $removeFromEnd)
    }

    # Clean double hyphens or underscores
    $name = $name -replace '[-_]{2,}', '-'
    $name = $name.Trim('-', '_', ' ')

    $newName = "$name$ext"

    if ($newName -ne $original) {
        if ($dryRun) {
            Write-Host "[PREVIEW] $original  ->  $newName"
        } else {
            Rename-Item $_.FullName $newName
        }
    }
}
