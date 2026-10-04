# Push status — updated 2026-10-04

**Status: DONE. All commits of this audit are on `main` of
https://github.com/MIKEAA2020/arrow-of-time-insight** (`scripts/push_with_token.sh`, exit 0).

| Batch | Commits | Result |
|---|---|---|
| audit + second pass | `cf32451` … `5628f5b` | pushed 2026-10-02 |
| Revision 2.3 (open-problems adjudication) | `1ed8a8c`, `94defd4`, `f3e0cfe` | pushed 2026-10-04: `5628f5b..f3e0cfe HEAD -> main` |

Remote tree verified through the GitHub API at `f3e0cfe`: 29 files, including `audits/05_OPEN_PROBLEMS_SOURCE_EVAL.md`.
Backup export refreshed after the push: `backup/push/arrow-of-time-insight.bundle`
sha256 `0e9ab420a164f27376451ed22d3ee4d8c38458e53ee266015dbca36d88cf60c8`, patch
sha256 `8acf0d21bd49dfa9e55db4f2f0d40a3c268632e3aaf4e412aced99a5a3afaebe` (maximal history makes the
patch large; the bundle is the canonical transfer artefact).

## Timeline

| Attempt | Credential | Result |
|---|---|---|
| 1 | `…bpqXZTFk` (first token supplied) | **rejected** — REST 401 *Bad credentials*; `git push`: `remote: Invalid username or token. Password authentication is not supported for Git operations.` |
| 2 | `…bpqXZTFX` (corrected token) | **accepted** — API 200 as `MIKEAA2020` with `admin/push` on this repository; `git push` → `9a01a02..cf32451  HEAD -> main`, then the second-pass commit |

**Diagnosis of attempt 1:** the token was well-formed (`github_pat_` + 22 chars + `_` + 59 chars,
length 93, alphabet `[A-Za-z0-9_]`) but differed from the working token in its **final character**
(`k` vs `X`) — a transcription error, not a scope problem. GitHub auto-revokes fine-grained PATs it
detects in public content, so a token pasted into a public place can also go dead this way.

## Security actions

1. Tokens are stored **outside** the repository tree, never committed:
   * `/home/user/GITHUB_PAT.txt` (primary, mode `600`);
   * `/home/user/backup/pat/GITHUB_PAT.backup.txt` (backup, mode `600`) + `.sha256`;
   * `/home/user/backup/pat/REJECTED_GITHUB_PAT.older.txt` — the rejected token, kept only as an
     audit artefact (it authenticates nothing).
2. `.gitignore` blocks `GITHUB_PAT.txt`, `*.pat`, `.env*`, `.netrc`; the working tree and the entire
   git object history were scanned for the token string and for the `github_pat_` pattern — **0 hits**
   (`grep` + per-object scan of `git rev-list --objects --all`).
3. `scripts/git-credential-helper.sh` feeds the token to git via the credential protocol (it emits
   `username`/`password` for `github.com` only, and nothing for any other host), so the token never
   appears in `.git/config`, in a remote URL, in `ps`, or in logs; `scripts/push_with_token.sh`
   redacts token-shaped strings from any error output and exits 3 on authentication failure.
4. **Recommendation: rotate both tokens** (they were transmitted in plain text in the chat) via
   GitHub → Settings → Developer settings → Personal access tokens; issue a fine-grained replacement
   limited to this repository with *Contents: Read and write* only.

## Re-running the push

```bash
printf '%s\n' 'github_pat_NEW' > /home/user/GITHUB_PAT.txt && chmod 600 /home/user/GITHUB_PAT.txt
/home/user/arrow-of-time-insight/scripts/push_with_token.sh          # prints "push ok" on success
/home/user/arrow-of-time-insight/scripts/export_bundle.sh            # credential-free alternatives
```

## Staged artefacts (in case a rollback is ever needed)

* `/home/user/backup/push/arrow-of-time-insight.bundle` — full history (git bundle);
* `/home/user/backup/push/arrow-of-time-insight.patch` — patch of all audit commits;
* `/home/user/backup/push/MANIFEST.txt` — branch, tip, commit list, sha256 sums.
