param(
  [string]$RepoRoot = (Resolve-Path "$PSScriptRoot\..").Path,
  [string]$TargetRoot = "$HOME\.agents\skills"
)

$ErrorActionPreference = "Stop"

$source = Join-Path $RepoRoot "skills\personal"

if (!(Test-Path $source)) {
  New-Item -ItemType Directory -Force -Path $source | Out-Null
}

if (!(Test-Path $TargetRoot)) {
  New-Item -ItemType Directory -Force -Path $TargetRoot | Out-Null
}

$skills = Get-ChildItem -Path $source -Directory -ErrorAction SilentlyContinue

if ($skills.Count -eq 0) {
  Write-Host "No personal skills found in $source"
  Write-Host "Add skills under skills\personal\<skill-name>\SKILL.md, then run this script again."
  exit 0
}

foreach ($skill in $skills) {
  $skillFile = Join-Path $skill.FullName "SKILL.md"

  if (!(Test-Path $skillFile)) {
    Write-Warning "Skipping $($skill.Name): missing SKILL.md"
    continue
  }

  $destination = Join-Path $TargetRoot $skill.Name

  if (Test-Path $destination) {
    Remove-Item -Path $destination -Recurse -Force
  }

  Copy-Item -Path $skill.FullName -Destination $destination -Recurse
  Write-Host "Installed skill: $($skill.Name)"
}

Write-Host ""
Write-Host "Done. Restart Codex to pick up new or updated skills."
