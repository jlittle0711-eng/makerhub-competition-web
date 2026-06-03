$ErrorActionPreference = "Stop"

$Root = Resolve-Path (Join-Path $PSScriptRoot "..")

$Files = @(
    "docs/index.html",
    "docs/admin.html",
    "docs/dashboard.html",
    "docs/ecosystem.html",
    "docs/firebase-config.js",
    "docs/live-data.js"
)

$FirebasePatterns = @(
    "gstatic\.com/firebasejs",
    "\bfirebase\b",
    "\bfirestore\b",
    "\bauth\b",
    "\bapiKey\b",
    "\bprojectId\b",
    "\bappId\b",
    "\bdatabaseURL\b",
    "\bstorageBucket\b",
    "\bmessagingSenderId\b"
)

$Failures = [System.Collections.Generic.List[string]]::new()

function Read-RepoFile {
    param([string]$RelativePath)

    $FullPath = Join-Path $Root $RelativePath
    if (-not (Test-Path -LiteralPath $FullPath)) {
        $Failures.Add("$RelativePath is missing")
        return ""
    }

    return Get-Content -LiteralPath $FullPath -Raw
}

foreach ($File in $Files) {
    $Content = Read-RepoFile $File
    if ([string]::IsNullOrWhiteSpace($Content)) {
        $Failures.Add("$File is empty")
    }
}

foreach ($File in @("docs/index.html", "docs/admin.html", "docs/dashboard.html", "docs/ecosystem.html")) {
    $Content = Read-RepoFile $File
    if ($Content -notmatch "prototype/reference") {
        $Failures.Add("$File is missing a visible prototype/reference notice")
    }
}

foreach ($File in $Files) {
    $Content = Read-RepoFile $File
    foreach ($Pattern in $FirebasePatterns) {
        if ($Content -match $Pattern) {
            $Failures.Add("$File contains live Firebase dependency marker $Pattern")
        }
    }
}

$LiveData = Read-RepoFile "docs/live-data.js"
if ($LiveData -notmatch "DEMO_COMPETITIONS") {
    $Failures.Add("docs/live-data.js does not expose static demo competition data")
}

if ($Failures.Count -gt 0) {
    Write-Error ("Public prototype verification failed:`n- " + ($Failures -join "`n- "))
    exit 1
}

Write-Host "Public prototype verification passed."
