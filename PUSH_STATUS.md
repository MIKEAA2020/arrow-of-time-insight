# Push status — 2026-10-02

**Status: BLOCKED — the supplied token is rejected by GitHub. All commits are made locally and
exported to a bundle/patch. One command (below) finishes the push once a working token is present.**

## What was attempted

| Attempt | Command form | Result |
|---|---|---|
| REST API, `Authorization: token …` | `GET https://api.github.com/user` | **401 `Bad credentials`** |
| REST API, `Authorization: Bearer …` | `GET https://api.github.com/user` | **401 `Bad credentials`** |
| REST API, basic `x-access-token:…` | `GET https://api.github.com/user` | **401 `Bad credentials`** |
| `git ls-remote` with token in URL | public repo | succeeds — **but succeeds anonymously for any public repo**, so this proves nothing about the token |
| `git push` with token in URL | `https://x-access-token:…@github.com/...` | **`remote: Invalid username or token. Password authentication is not supported for Git operations.` / `fatal: Authentication failed`** |

## Diagnosis

* **Format is plausible**: the string is `github_pat_` + 22 chars + `_` + 59 chars, i.e. exactly the
  fine-grained-PAT layout; length 93; alphabet `[A-Za-z0-9_]`; sha256
  `781ac8d8…a2cc8` (recorded in `/home/user/backup/pat/GITHUB_PAT.backup.txt.sha256`).
* **It does not authenticate anywhere**: GitHub processes the header and rejects it (401 *Bad
  credentials*, not a permissions/scope error). This is the signature of a **revoked, expired, or
  never-activated** token — GitHub also auto-revokes fine-grained PATs it detects in public content.
  It cannot be repaired here; a new token must be issued by the account owner.
* The repository **is readable anonymously** (it is public), which is why the clone succeeded and why
  `ls-remote` is not evidence of token validity.

## Security actions taken

1. The token is stored **outside** the repository tree, so it can never be committed:
   * `/home/user/GITHUB_PAT.txt` (workspace root, mode `600`) — the primary copy;
   * `/home/user/backup/pat/GITHUB_PAT.backup.txt` (mode `600`) + `.sha256`.
2. `.gitignore` (repo root) blocks `GITHUB_PAT.txt`, `*.pat`, `.env*`, `.netrc` and friends, so an
   accidental `git add -A` cannot publish it.
3. `scripts/git-credential-helper.sh` reads the token from those files and answers git's credential
   protocol, so the token is never placed in `.git/config`, in a remote URL, in `ps`, or in logs.
4. **Recommendation: revoke this token** in GitHub → Settings → Developer settings → Personal access
   tokens, and issue a new fine-grained token limited to this repository with `Contents: Read and
   write` only. Treat any token pasted into a chat, issue, gist or commit as compromised.

## How to finish the push (once a valid token exists)

```bash
# 1. store the new token (workspace root; the backup copy is optional)
printf '%s\n' 'github_pat_NEW' > /home/user/GITHUB_PAT.txt && chmod 600 /home/user/GITHUB_PAT.txt

# 2. push (uses the credential helper; never prints the token)
/home/user/arrow-of-time-insight/scripts/push_with_token.sh
#    -> "push ok"  (exit 0);  exit 3 = token still rejected
```

Alternative, without any credentials on this machine:

```bash
/home/user/arrow-of-time-insight/scripts/export_bundle.sh   # -> ../backup/push/{*.bundle,*.patch,MANIFEST.txt}
# then, on a machine that is authenticated:
git clone /path/to/arrow-of-time-insight.bundle repo && cd repo
git remote set-url origin https://github.com/MIKEAA2020/arrow-of-time-insight.git
git push origin main
```

## What is staged locally

Commits made in `/home/user/arrow-of-time-insight` on top of upstream tip
`9a01a02` ("Delete uploads/1"): see `git log --oneline` — the audit deliverables
(`audits/`, `paper/`, `verification/`, `scripts/`, this file, updated `README.md`).
`uploads/` is untouched, so the original material stays byte-identical.
