# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A single-file, Warhammer 40K-themed shell configuration (`warhammer_file.sh`, ~726 lines) intended to be installed as the user's `~/.zshrc` (primary target) or `~/.bashrc`. It is not an application — there is no build, no package manager, no test suite. Everything ships in one shell script plus README documentation.

## Files

- `warhammer_file.sh` — the entire shell configuration (functions, aliases, prompt, Oh My Zsh boilerplate).
- `README.md` — French documentation (primary, more recently updated).
- `README_EN.md` — English documentation (kept in parallel; mirror changes when feature-relevant text changes).
- `warhammer_image_1.jpg` — logo referenced from the README.

## Working / testing changes

There is no test harness. To validate changes:

```bash
# Validate the script parses
bash -n warhammer_file.sh
zsh -n warhammer_file.sh   # if zsh is available

# Try it in an isolated shell without overwriting the user's real rc files
zsh -c 'source ./warhammer_file.sh; imperial-status'
bash -c 'source ./warhammer_file.sh; imperial-status'
```

Do NOT copy the file into `~/.zshrc` / `~/.bashrc` as part of testing — installation is a user action documented in the README.

## Architecture (the parts that span the file)

The script is organized top-to-bottom in these conceptual blocks. Many features cross-reference each other, so changes often touch multiple blocks.

1. **Oh My Zsh boilerplate** (lines ~1–76) — `ZSH=...`, `plugins=(...)`, `source $ZSH/oh-my-zsh.sh`. Comments here are intentionally preserved for Oh My Zsh compatibility; don't strip them.

2. **Chapter configuration loader** (lines ~82–92) — sources `~/.imperial_chapter_config` if present, otherwise sets defaults (`IMPERIAL_CHAPTER`, `COMPANY`, `SQUAD`, `BATTLE_HONORS`). A separate `create_chapter_config` function (defined later in the file) generates this file on first run.

3. **Chapter color/symbol case statement** (lines ~95–131) — maps `$IMPERIAL_CHAPTER` to `PRIMARY_COLOR`, `SECONDARY_COLOR`, `CHAPTER_SYMBOL`, `BATTLE_CRY`, `CHAPTER_MOTTO`. Adding a new Chapter means adding a `"NAME")` arm here AND documenting it in both READMEs.

4. **Shared color palette** (lines ~134–145) — 24-bit ANSI escapes (`\033[38;2;R;G;Bm`). `GREEN_PHOSPHOR` is aliased to `PRIMARY_COLOR` so chapter choice flows through to the prompt and most output.

5. **Animation / UI primitives** (lines ~148–222) — `imperial_date`, `imperial_time`, `imperial_loading`, `imperial_progress`, `imperial_box`, `imperial_type`. These are the reusable building blocks; higher-level functions and aliases call them. New visual features should be built on these rather than inline `printf`/`echo` escapes.

6. **Rank, error, and ambient systems** (lines ~225–315) — `imperial_rank` (uptime-derived), `command_not_found_handler` (zsh hook), `random_blessing`, `warp_storm_check` (probabilistic gate used by recon aliases), `success_litany` / `failure_litany` / `vox_message`, `TRAPALRM` for the live-updating prompt.

7. **Aliases** (lines ~323–379) — grouped by theme (system purification, reconnaissance, data, network, docker). Several aliases compose with `warp_storm_check &&` to inject random thematic delays/warnings; preserve that pattern when adding network-adjacent aliases.

8. **Contextual + heresy detection** (lines ~399–500ish) — `contextual_message` (time-of-day greetings) and `detect_heresy` (humorous process scanner). Wired into the prompt/startup flow.

9. **High-level rituals** (lines ~529–611) — user-facing commands like `praise-omnissiah`, `machine-blessing`, `emperor-blessing`, `chapter-oath`, `imperial-status`. These compose the primitives from blocks 5–6.

10. **Help and config generators** (lines ~612–726) — `help-imperial` and `create_chapter_config` are defined twice (the second definition wins). When editing, edit the **second** definition unless you're intentionally restructuring.

## Conventions to preserve

- **Bilingual identity.** Comments and string literals mix French and English on purpose. Don't translate one to the other unless asked. README.md is French; README_EN.md is English — keep both in sync for user-visible feature changes.
- **24-bit color escapes.** Use the existing `\033[38;2;R;G;Bm` style and reuse the named constants (`GOLD_IMPERIAL`, `CRIMSON_RED`, etc.) rather than introducing new raw escapes.
- **Always reset color.** Every styled `printf`/`echo` ends with `${RESET}`.
- **Zsh-first, Bash-compatible.** Avoid Zsh-only syntax inside functions intended for both shells (e.g., the README claims `.bashrc` compatibility). The Oh My Zsh boilerplate at the top is Zsh-only and that's expected.
- **No real destructive behavior.** Aliases are thematic wrappers around standard tools. `purge='rm -rf'` exists but new aliases should not add unannounced destructive flags.
- **Lore accuracy** is called out as a project value in the README — names like "Omnissiah", "Macragge", chapter mottos, etc. are intentional and should not be "corrected".

## What's not here

No CI, no linter config, no package.json, no `.cursor/rules`, no `.github/copilot-instructions.md`, no pre-existing CLAUDE.md. If you're tempted to add tooling configs, ask first — the project is deliberately a single script.
