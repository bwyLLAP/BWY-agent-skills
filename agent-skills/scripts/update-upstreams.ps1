param(
  [string]$CacheRoot = "$HOME\.agent-skill-sources"
)

$ErrorActionPreference = "Stop"

if (!(Get-Command git -ErrorAction SilentlyContinue)) {
  Write-Error "git is required for this script. Install Git for Windows, then rerun."
}

if (!(Test-Path $CacheRoot)) {
  New-Item -ItemType Directory -Force -Path $CacheRoot | Out-Null
}

$repos = @(
  @{ Name = "superpowers"; Url = "https://github.com/obra/superpowers.git" },
  @{ Name = "impeccable"; Url = "https://github.com/pbakaus/impeccable.git" },
  @{ Name = "nature-skills"; Url = "https://github.com/yuan1z0825/nature-skills.git" }
)

foreach ($repo in $repos) {
  $path = Join-Path $CacheRoot $repo.Name

  if (Test-Path $path) {
    Write-Host "Updating $($repo.Name)..."
    git -C $path pull --ff-only
  } else {
    Write-Host "Cloning $($repo.Name)..."
    git clone $repo.Url $path
  }
}

Write-Host ""
Write-Host "Upstream sources are cached in $CacheRoot"
Write-Host "Follow each upstream README for plugin-specific installation steps."
