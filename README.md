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
  01_CLAIMS_LEDGER.csv        machine-readable ledger: 69 entries, claim -> verdict -> evidence -> action
  02_REFERENCE_AND_METADATA_CHECK.md            external verification of refs [1]-[7], DOI resolution
  03_PREDECESSOR_AND_REPO_CONTEXT.md            the record behind [1]; the companions ([8], [13])
  04_REMAINING_POINTS_IMPLEMENTED.md  *** every remaining audit point: implemented / corrected / declined
  05_OPEN_PROBLEMS_SOURCE_EVAL.md     *** adjudication of the open-problems source note, claim by claim
                                      (status, evidence, integration action, self-declared limits)
  S0_extracted_text.txt       the manuscript's text, extracted page by page (line-level audit trail)

figures/
  causal_opfibration.svg      the corrected figure (replaces the deleted Figure 1)

paper/
  REVISED_PAPER.md            *** the deliverable ***  corrected manuscript, complete proofs, scope
  REVISION_CHANGELOG.md       original -> revised, claim by claim (with the audit finding that drove it)

verification/
  verify_claims.py            reproducible suite: 182 checks over all quantitative claims
  verification_log.txt        captured run (182 PASS / 0 FAIL)

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
5. **New results added**: per-`B` non-representability; a model-independent one-slice proof; uniform-in-`n`
   non-representability at `B = E`; the **classification of all dimension-count escapes** (`n | (d_E²−1)`
   and `(d_E²−1)/n = j(2 d_E d_B − j)`); the defect invariant `δ_n`; `Instr` has neither terminal nor
   initial object; the classical `n`-threshold contrast; the exact-recovery (isometry) theorem as the
   correct retrodiction statement; and the **opfibration constructed properly** (bifibration ⟺ every
   `E_u ≅ ℂ`) with a redrawn figure.
6. **Reference [1] is misattributed** (its DOI resolves to a *software* deposit); **[3] is wrong**;
   **[4] is mischaracterised**; **[5]–[7] are never cited**.
7. **Credits corrected after reading the author's companions**: the affine-dimension lemma, the
   no-left-adjoint theorem, the classical analogue and the normalisation/intercept explanation
   ("Normalization-Defect (Intercept) Principle") already exist in `[8]`/`[13]`; the revision cites
   them and delimits what is genuinely new here.
8. **The four open problems of §7.2 are now resolved (Revision 2.3, Appendix C)**, adjudicated from a
   third-party working note rather than trusted: the coarse-graining quotient (the exact quadrilateral
   `P_T` with `½e₁₂⊕½e₃₄ = ¼e₃₄⊕⅜e₁₄⊕⅜e₂₃`, plus `Instr_0`, `D^ω` and the finite-outcome dyadic and
   rational quotients); the dimension escapes (Kraus-rank theorem: `Chan(E,B)` is not affinely
   isomorphic to any state space for `d_B ≥ 2`, so the Pell family is not a counterexample); record
   forgetting with its exact hypothesis (register finite-dimensional **or** separable); and a minimal
   *typed* completion `𝒯` in which `−⊗E ⊣ [E,−]` for **first-order** `E`, whose internal hom is an
   affine slice of codimension `d_E²−1`. Seven residual gaps (R1–R7) are kept open and printed in the
   paper (`§7.2`, `Appendix C.20`).

## Reproduce

```bash
python3 verification/verify_claims.py      # 182 checks, needs numpy + sympy
cat verification/verification_log.txt
```

## Push

`PUSH_STATUS.md` records the push history: the first token supplied was rejected (401 *Bad
credentials* / *"Invalid username or token"* — a single-character transcription error), the corrected
token was accepted, and both commits of this audit are on `main`. The working token lives at
`/home/user/GITHUB_PAT.txt` (outside this tree) with a backup at
`/home/user/backup/pat/GITHUB_PAT.backup.txt`; it is git-ignored by design, because this repository is
public. **Rotate any token that has been shared in plain text.**
