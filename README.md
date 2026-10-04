# arrow-of-time-insight — audited and revised (Rev. 2.4)

Repository for the manuscript *"The Opfibration Ontology: Quantum Instruments, Irreversibility, and
the Epistemic Asymptote"* (A. Abaee), its six independent reviews, the meta-review, and the adjudicated
audits. The repository records claim-by-claim evidence, corrected proofs, finite computational checks,
and the results' explicit scope limitations; it does not claim formal verification of every analytic or
category-level argument.

## Contents

```
uploads/                      original material, unchanged
  arrow_of_time_INSIGHT.pdf                    the 6-page manuscript
  audit of arrow of time insight.txt           six reviews: sonnet1-3, grok1-3
  claude audit of audit of time insight.txt    meta-review of those six

audits/
  00_ADJUDICATED_AUDIT.md     *** start here ***  consolidated audit; every dispute decided with proof
  01_CLAIMS_LEDGER.csv        machine-readable ledger: 89 entries, claim -> verdict -> evidence -> action
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
  verify_claims.py            reproducible suite: 196 finite arithmetic/numerical checks
  verification_log.txt        latest independent run (196 PASS / 0 FAIL; not a formal proof)

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
3. **The predecessor's `B=E` square-gap closes in three lines** (`d_E⁴−d_E²+1` is never a square).
   The companion already proves the same square-gap arithmetic in its left-adjoint argument; this
   revision isolates the separate, standalone `Chan(E,E)` versus state-space consequence.
4. **The obstruction is normalisation (causality), not irreversibility, quantumness, or time**: it
   holds classically, fails to exist in compact-closed `CPM`, and `F_E` has no *left* adjoint either.
5. **Results and scope refinements**: the literal-`Instr` per-`B` categorical theorem and its
   grade-dependent reduction to `Chan` (Prop. 4.9); the standalone, grade-free one-slice obstruction
   `Chan(E,E) ≄ States(G)` and the separate categorical `Chan` consequence; and the fixed-`n`
   `Instr_n(E,E) ≄ Instr_n(ℂ,G)` statement, explicitly a convex-body specialization of the
   companion's pointwise obstruction rather than a quotient-category representability claim.
   Proposition 4.7 states the exact affine-dimension match locus
   (`n | (d_E²−1)` and `(d_E²−1)/n = j(2 d_E d_B − j)`), formalizing the general square-escape
   factorization already recorded in companion check 6b; it is not a new escape family, and a
   dimension match alone does not imply an affine isomorphism. The `B=ℂ, n=1` case is separately
   verified as a trivial point-to-point bijection; representability at non-degenerate matches remains
   open. The revision also records the instrument-slice defect
   `δ_n`, proves that `Instr` has neither terminal nor initial object, contrasts the classical
   `n`-threshold, states the exact-recovery (isometry) result, and constructs the opfibration
   properly (bifibration ⟺ every `E_u ≅ ℂ`) with a redrawn figure.
6. **Reference [1] is misattributed** (its DOI resolves to a *software* deposit); **[3] is wrong**;
   **[4] is mischaracterised**; **[5]–[7] are never cited**.
7. **Credits corrected after reading the author's companions**: the affine-dimension lemma, the
   no-left-adjoint theorem, the classical analogue and the normalisation/intercept explanation
   ("Normalization-Defect (Intercept) Principle") already exist in `[8]`/`[13]`; the revision cites
   them and delimits what is genuinely new here.
8. **Revision 2.4 adjudicates the supplied open-problems note without claiming every case is closed.**
   The source ledger follows the required complete/close/companion/drop order and checks hypotheses
   against the actual categories. Appendix C proves the quadrilateral obstruction for `Instr_cg`, a
   separate no-merging result for `Instr_0`, the explicit `D^ω` result, finite-counit results for
   finitary `D` and finite-outcome `Q`, and a countable-counit result for finitary `D` only when `E` is
   finite-dimensional. It keeps the strict-grade reduction confined to literal `Instr`; no quotient is
   inferred from it. `Chan` results distinguish the finite-dimensional Kraus-rank theorem, the isometric
   face invariant (`dim B≥d_E`), and the separate block-channel face companion (finite `d_E,d_B≥2`).
   The typed construction is a concrete finite-dimensional affine-slice completion, not a proved minimal
   completion. Six residual gaps (R1–R6), including infinite-input/non-separable/countable-counit `D`,
   measurable quotient identification, non-normal states, and formal verification, remain explicit in
   `§7.2` and C.27. The verification suite contains 196 finite checks; passing them does not formally
   prove the analytic/category-level arguments.

## Reproduce

```bash
python3 verification/verify_claims.py      # 196 checks, needs numpy + sympy
cat verification/verification_log.txt
```

## Push

`PUSH_STATUS.md` records the push history: the first token supplied was rejected (401 *Bad
credentials* / *"Invalid username or token"* — a single-character transcription error), the corrected
token was accepted, and both commits of this audit are on `main`. The working token lives at
`/home/user/GITHUB_PAT.txt` (outside this tree) with a backup at
`/home/user/backup/pat/GITHUB_PAT.backup.txt`; it is git-ignored by design, because this repository is
public. **Rotate any token that has been shared in plain text.**
