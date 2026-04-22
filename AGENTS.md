# Homebrew Tap: `zlliang/tap`

This repository is a [Homebrew tap](https://docs.brew.sh/Taps) — a third-party formula repository for the [Homebrew](https://brew.sh/) package manager.

## Repository structure

- `Formula/` — all `.rb` formula files (head and versioned)

## Rules

- Formulae MUST be placed under `Formula/`.
- Each `.rb` file defines exactly one `Formula` subclass.
- Versioned formulae use `<name>@<version>.rb` with class name `<Name>AT<digits>` (dots removed).
- Never delete old versioned formulae — `Formula/` is append-only.
- Follow Homebrew's Ruby style ([Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)).
- Always include: `desc`, `homepage`, `url`, `sha256`, `license`.
- Use `#{version}` interpolation in download URLs.
- Before committing, run `brew style`, `brew test`, and `brew audit --strict --online`.
- Commit messages: `<name>: add formula` or `<name>: update to <version>`.

## Skills

Use the `maintaining-homebrew-tap` skill for step-by-step guidance on adding, updating, and testing formulae.
