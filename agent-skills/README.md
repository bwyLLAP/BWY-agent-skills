# BWY Agent Skills

Personal agent skills and setup notes for syncing Codex workflows across PCs.

This repo intentionally excludes the Claude Code review plugin, because this setup is for Codex and you do not use Claude Code.

## Included

- Superpowers: workflow discipline for planning, implementation, testing, and debugging.
- Impeccable: frontend design taste and UI review guidance.
- Nature Skills: academic and nature/science visual generation guidance.
- Skill Creator: documented here as a built-in Codex system skill; do not vendor or reinstall it.

## Recommended Layout

```text
agent-skills/
  README.md
  sources/
    upstream.md
  skills/
    personal/
  scripts/
    install-codex.ps1
    update-upstreams.ps1
  templates/
    AGENTS.md
```

## First-Time Setup On A PC

Clone this repository, then run:

```powershell
.\scripts\install-codex.ps1
```

The script syncs this repo's personal skills into:

```text
$HOME\.agents\skills
```

Restart Codex after installing or updating skills.

## Upstream Skills

The external skills/plugins are tracked in [sources/upstream.md](sources/upstream.md).

Install upstream projects using their own instructions, or use `scripts/update-upstreams.ps1` as a starting point for downloading them into a local cache. I recommend keeping upstream projects as sources rather than editing their files directly. Put your own custom workflows under `skills/personal/`.

## Project Guidance

Use [templates/AGENTS.md](templates/AGENTS.md) as a starting point for repository-specific Codex rules. Copy it into a project as `AGENTS.md` and edit it for that codebase.
