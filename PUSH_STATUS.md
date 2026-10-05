# Push status — updated 2026-10-05

**Status: DONE. Rev. 2.6 content commit `d50f1f618f7aa5b69b1c9618538c9123789cf2c3` and the
Rev. 2.6 status follow-up are on `main` of https://github.com/MIKEAA2020/arrow-of-time-insight.**
The Rev. 2.6 push and remote-tree verification are recorded below; prior release records remain.

| Batch | Commits | Result |
|---|---|---|
| audit + second pass | `cf32451` … `5628f5b` | pushed 2026-10-02 |
| Revision 2.3 (open-problems adjudication) | `1ed8a8c`, `94defd4`, `f3e0cfe` | pushed 2026-10-04: `5628f5b..f3e0cfe HEAD -> main` |
| Revision 2.4 (scope, escape, source-priority corrections) | `3491a58` + follow-up status update | pushed 2026-10-05; both are on `main` |
| Revision 2.6 (R1 closure + scalar proof repair) | `d50f1f6` + this status follow-up | pushed 2026-10-05; both are on `main` |

## Rev. 2.6 release checks

* Content commit `d50f1f618f7aa5b69b1c9618538c9123789cf2c3` was pushed from `261fe27`; the initial
  push returned `261fe27..d50f1f6 HEAD -> main`, and an anonymous `git ls-remote` matched the local
  `main` tip. After the status follow-up push, anonymous `git ls-remote` and a fetched-tree comparison
  matched the local `main` tip.
* Rev. 2.6 manuscript SHA-256:
  `3cb1591b1115743f404efd66c5598155f2f3b9be8546cda765d823733ec61a5c`; Rev. 2.5 was left
  unchanged at `5c23d0948ac724a82a7b9c27adcec15e65cbfe517eb93085820af85172bd7a3b`.
* Fresh `python3 verification/verify_claims.py`: **197 passed, 0 failed**. The complete 265-line
  transcript is embedded in `paper/REVISION_CHANGELOG_v2.6.md`. These finite regressions do not
  prove C.28's normal-CP, cardinal, or commutant arguments; no proof-assistant verification is claimed.
* The line-level adjudication and scope boundaries are in the versioned changelog. C.28 closes R1
  pointwise for both `dim B≥2` and `B=ℂ`, using one common `A=R` collision; it does not transfer
  Proposition 4.9 or extend C.14(b) to infinite `E`.

## Rev. 2.4 checks and source access

* Independent finite suite: **197 passed, 0 failed**, with the regenerated log in
  `verification/verification_log.txt` (Python 3.13.14, NumPy 2.3.5, SymPy 1.14.0).
* A non-boundary escape, `(d_E,d_B,n,j)=(15,2,1,4)`, is included as a direct test and now appears in
  both the paper's fixed-`n` comparison and the `Instr_0` audit; the companion's check 6b is credited
  for its general square-escape parameterization.
* The Kissinger–Uijlen arXiv HTML (`https://arxiv.org/html/1701.04732`) was accessible and inspected.
  Direct PDF fetches failed for `https://www.cs.ru.nl/~suijlen/cat-causal-full.pdf` and
  `https://arxiv.org/pdf/1701.04732`; neither PDF was inspected.

At the Rev. 2.3 point `f3e0cfe`, the GitHub API tree had 29 entries (23 files and 6 directories),
including `audits/05_OPEN_PROBLEMS_SOURCE_EVAL.md`; the earlier "29 files" count included directories.
For Rev. 2.4, GitHub API tree SHA and anonymous `git fetch` both matched content commit `3491a58`,
and the fetched tree was byte-for-byte identical (23 files across 6 directories). After the
status-update follow-up was pushed, the final `main` ref and fetched tree were rechecked as well.

The Rev. 2.4 bundle/patch export is historical. The Rev. 2.6 follow-up export is regenerated after
this status-update push; its current bundle and patch hashes are recorded in the external
`/home/user/backup/push/MANIFEST.txt` (the bundle is the canonical transfer artefact; maximal history
makes the patch large).

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
     audit artefact (it authenticates nothing and was not used).
   On 2026-10-05 both files were rechecked at mode `600` with SHA-256 prefix `eca794ac…`, without
   displaying token values; the rejected archive was not used.
2. `.gitignore` blocks `GITHUB_PAT.txt`, `*.pat`, `.env*`, `.netrc`. Before the Rev. 2.6 content push,
   the worktree scan (27 files) and reachable Git-object scan (119 objects) found **0** token-pattern
   hits; no token/credential filenames are in the repository.
3. `scripts/git-credential-helper.sh` feeds the token to git via the credential protocol (it emits
   `username`/`password` for `github.com` only, and nothing for any other host), so the token never
   appears in `.git/config`, in a remote URL, in `ps`, or in logs; `scripts/push_with_token.sh`
   redacts token-shaped strings from any error output and exits 3 on authentication failure. These
   pre-existing scripts are mode `0644`; for the Rev. 2.6 push the helper was temporarily granted
   owner-execute so git could invoke it, then restored to `0644` (no script contents were committed).
4. **Recommendation: rotate both tokens** (they were transmitted in plain text in the chat) via
   GitHub → Settings → Developer settings → Personal access tokens; issue a fine-grained replacement
   limited to this repository with *Contents: Read and write* only.

## Re-running the push

```bash
printf '%s\n' 'github_pat_NEW' > /home/user/GITHUB_PAT.txt && chmod 600 /home/user/GITHUB_PAT.txt
helper=/home/user/arrow-of-time-insight/scripts/git-credential-helper.sh
chmod u+x "$helper"
if bash /home/user/arrow-of-time-insight/scripts/push_with_token.sh; then
  chmod u-x "$helper"
else
  rc=$?
  chmod u-x "$helper"
  exit "$rc"
fi
bash /home/user/arrow-of-time-insight/scripts/export_bundle.sh
```

## Staged artefacts (in case a rollback is ever needed)

* `/home/user/backup/push/arrow-of-time-insight.bundle` — full history (git bundle);
* `/home/user/backup/push/arrow-of-time-insight.patch` — patch of all audit commits;
* `/home/user/backup/push/MANIFEST.txt` — branch, tip, commit list, sha256 sums.
