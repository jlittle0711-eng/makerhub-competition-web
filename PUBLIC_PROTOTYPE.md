# Public Prototype Reference Posture

Status: public prototype/reference.

This repository is intended to be safe for public browsing as a static GitHub Pages reference site. It must not depend on live backend services for ordinary public routes.

## Current Rule

- Keep public pages static and demo-only.
- Do not add live client config values to `docs/firebase-config.js`.
- Do not load backend SDK scripts from public browsing routes.
- Keep admin and dashboard surfaces as disabled reference pages unless Jay explicitly reclassifies this site as an active governed product surface.
- Do not deploy while Firebase/backend governance facts are unknown.

## Verification

Run this before committing public Pages changes:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts\verify-public-prototype.ps1
```

The verifier checks that the public Pages routes stay browsable without live backend dependency markers and that the prototype/reference notice remains visible.

## Loose Root Files

As of 2026-06-03, the untracked root-level `ecosystem.html` is classified as a stale local reference draft. It is not part of the tracked GitHub Pages source, which is built from `docs/`, and it does not affect the public site.

Do not delete it without Jay's explicit approval. Recommended action is to leave it untracked for now, or move it into an intentional archive/reference location in a separate cleanup if Jay wants to preserve the draft.
