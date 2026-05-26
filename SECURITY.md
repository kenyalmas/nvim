# Security Policy

## Supported scope
This repository is a personal Neovim configuration. Security concerns in scope:
- secret leakage in tracked files
- unsafe startup behavior
- dependency/plugin supply-chain risks

## Reporting
If you find a security issue, do not open a public issue with sensitive details.
Share a private report with:
- what is affected
- impact
- reproduction steps
- suggested mitigation (if available)

## Response goals
- Acknowledge report promptly.
- Triage severity and exposure.
- Patch and document mitigation in a follow-up commit.

## Hardening expectations
- No plaintext credentials in repo.
- Keep dependencies pinned/lockfile-managed where possible.
- Prefer user-scope over system-wide configuration changes.
