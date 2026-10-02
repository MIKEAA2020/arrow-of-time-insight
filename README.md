# arrow-of-time-insight — audited, verified, and revised

Repository for the manuscript *"The Opfibration Ontology: Quantum Instruments, Irreversibility, and
the Epistemic Asymptote"* (A. Abaee), its six independent reviews, the meta-review, and the
**adjudicated audit** that reconciles them, verifies every mathematical and bibliographic claim, and
supplies the corrected manuscript.

## Contents

```
uploads/                      original material, unchanged
  arrow_of_time_INSIGHT.pdf                    the 6-page manuscript
  audit of arrow of time insight.txt           six reviews: sonnet1-3, grok1-3
  claude audit of audit of time insight.txt    meta-review of those six

audits/
  00_ADJUDICATED_AUDIT.md     *** start here ***  consolidated audit; every dispute decided with proof
  01_CLAIMS_LEDGER.csv        machine-readable ledger: claim -> verdict -> evidence -> action
  02_REFERENCE_AND_METADATA_CHECK.md            external verification of refs [1]-[7], DOI/DOI-resolution
  03_PREDECESSOR_AND_REPO_CONTEXT.md            the record behind [1]; the author's companion suite

paper/
  REVISED_PAPER.md            *** the deliverable ***  corrected manuscript, complete proofs, scope
  REVISION_CHANGELOG.md       original -> revised, claim by claim (with the audit finding that drove it)

verification/
  verify_claims.py            reproducible suite: 111 checks over all quantitative claims
  verification_log.txt        captured run (111 PASS / 0 FAIL)

scripts/
  push_with_token.sh          push using a token stored outside the repo tree
  git-credential-helper.sh    credential helper (token never enters .git/config or argv)
  export_bundle.sh            git bundle + patch export for credential-free transfer

PUSH_STATUS.md                token diagnostics and the one command that finishes the push
```

## Headline results of the audit

1. **The core theorem is true and the algebra is right** (`Prop. 3.1`, `Thm 4.2`); the proof was
   missing one two-line convex-geometry lemma (supplied).
2. **The framing was inverted**: an adjunction on `Instr` restricts to `Chan`, so the deterministic
   statement implies the instrument statement — "strictly stronger" is false.
3. **The gap in the predecessor paper closes in three lines** (`B = E`, `d_E⁴−d_E²+1` is never a
   square) — and the author's own companion suite already proves exactly this.
4. **The obstruction is normalisation (causality), not irreversibility, quantumness, or time**: it
   holds classically, fails to exist in compact-closed `CPM`, and `F_E` has no *left* adjoint either.
5. **New results added**: per-`B` non-representability; a model-independent one-slice proof;
   `Instr` has neither terminal nor initial object; the classical `n`-threshold contrast;
   the exact-recovery (isometry) theorem as the correct retrodiction statement.
6. **Reference [1] is misattributed** (its DOI resolves to a *software* deposit); **[3] is wrong**;
   **[4] is mischaracterised**; **[5]–[7] are never cited**.

## Reproduce

```bash
python3 verification/verify_claims.py      # 111 checks, needs numpy + sympy
cat verification/verification_log.txt
```

## Push

`PUSH_STATUS.md` records why the push is currently blocked (token rejected: *401 Bad credentials*;
*"Invalid username or token"* on `git push`) and the single command that completes it once a valid
token is in place. The token lives at `/home/user/GITHUB_PAT.txt` (outside this tree) with a backup at
`/home/user/backup/pat/GITHUB_PAT.backup.txt`; it is git-ignored by design, because this repository is
public. **Revoke any token that has been shared in plain text.**
