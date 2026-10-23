---
name: git-commit-message
description: Generates appropriate git commit messages based on code changes.
---

# Git Commit Message

Write a commit message that fits the repository's existing conventions and accurately describes the change.

- Base the message on staged changes; if nothing is staged, use unstaged changes.
- Keep the entire message within 65 characters
- Describe the *why*, not just the *what*; read surrounding code when the diff alone is ambiguous.
- Output only the raw commit message, so it can be passed directly to `git commit -m` or `--edit`: no code block, preamble, explanation, or notes.
- Do not commit unless the user asked you to.
