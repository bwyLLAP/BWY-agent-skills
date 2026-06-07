# Upstream Sources

This repo tracks the small starter set you selected for Codex.

## Keep

### Superpowers

- Repo: https://github.com/obra/superpowers
- Purpose: Keeps agent workflows disciplined: clarify requirements, design, implement, test, debug, and reflect.
- Install note: Prefer the upstream installation instructions because Superpowers is distributed as a Codex/agent workflow package rather than a single local `SKILL.md`.

### Impeccable

- Repo: https://github.com/pbakaus/impeccable
- Purpose: Improves frontend design quality and reduces generic AI-looking UI.
- Note: Older `frontend-design` references point to this newer Impeccable project.

### Nature Skills

- Repo: https://github.com/yuan1z0825/nature-skills
- Purpose: Nature/science/academic visual generation guidance.

### Skill Creator

- Source: Codex system skill.
- Purpose: Turn repeated workflows into your own skills.
- Install note: Do not install a duplicate copy. In Codex, invoke `$skill-creator` when you want to create or refine a skill.

## Removed

### Codex Plugin For Claude Code Review

- Repo often referenced as: https://github.com/openai/codex-plugin-cc
- Status: intentionally excluded.
- Reason: You do not use Claude Code, and this plugin exists to let Claude Code call Codex for review/delegation.

## Personal Skills

Put custom skills that you write yourself under:

```text
skills/personal/<skill-name>/SKILL.md
```

Then run:

```powershell
.\scripts\install-codex.ps1
```
