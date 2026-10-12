---
name: git-commit-message
description: Generates appropriate git commit messages based on code changes. Use when the user asks for a commit message, asks to commit, or wants to describe staged/unstaged changes.
argument-hint: "[N]"
---

# Git Commit Message

Write a commit message that fits the repository's existing conventions and accurately describes the change.

- Base the message on staged changes; if nothing is staged, use unstaged changes.
- Match the style of recent commits (language, capitalization, length, prefixes, use of bodies).
- Describe the *why*, not just the *what*; read surrounding code when the diff alone is ambiguous.
- Output only the raw commit message, so it can be passed directly to `git commit -m` or `--edit`: no code block, preamble, explanation, or notes.
- Do not commit unless the user asked you to.

## Multiple candidates

Arguments: `$ARGUMENTS`

If the arguments contain a positive integer N greater than 1, output N candidate messages instead of one:

- Each candidate is a single subject line with no body, so one line equals one candidate.
- Separate candidates with a newline only: no numbering, bullets, blank lines, or quotes.
- Make the candidates meaningfully different (wording, scope, or emphasis), all following the conventions above.
- Order them from most to least recommended.

Otherwise, output a single commit message as described above.
