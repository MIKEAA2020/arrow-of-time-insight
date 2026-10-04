# 03 — Predecessor, companion work, and repository context

The six reviews (S1) and the meta-review (S2) audited the manuscript in isolation. The author's
public record (not linked from the manuscript) changes three things: it settles reference [1], it
shows that **several "missing" upgrades already exist in the programme**, and it locates one of the
meta-review's open problems in the author's own current status. All facts below were retrieved from
public records on 2026-10-02 and are reproducible with `curl` (see §5).

## 1. The author's public record

GitHub user `MIKEAA2020` (17 public repositories), including:

| Repository | Language | Description | Relevance |
|---|---|---|---|
| `arrow-of-time-insight` | — | this repository | the manuscript under audit |
| `opfibration-supplement` | Jupyter | — | the software record behind DOI [1] (see §2) |
| `opfibration-merged-` | Python | — | **companion manuscript's verification suite** (see §3) |
| `Quantum-combs` | TeX | "prallel with opfibration" | **the comb-level companion article** (see §6) |
| `master` | Python | "overview and top-down approach to my most rigorous works" | programme index (the opfibration line is not indexed there) |
| `channel-supp-augmented` | TeX | "augmenting the quantum channel (2nd paper) supplementary to a standalone paper" | adjacent programme |
| `master` | Python | "overview and top-down approach to my most rigorous works" | programme index |

## 2. The record behind reference [1]

`doi:10.5281/zenodo.20860298` → Zenodo record **20860299**, type **software**, title
*"MIKEAA2020/opfibration-supplement: Initial supplementary simulation"*, published 2026-06-25,
MIT licence, creator `MIKEAA2020`, single file `MIKEAA2020/opfibration-supplement-v1.0.zip`,
`isSupplementTo https://github.com/MIKEAA2020/opfibration-supplement/tree/v1.0`.
Description: *"Supplementary simulation for 'The Opfibration Ontology' manuscript. Demonstrates the
concrete example of Section 3.4 and verifies the bifibration obstruction (Theorem 3.1)."*

Consequences for the audit: see `02_REFERENCE_AND_METADATA_CHECK.md` §1. In short — the DOI cited as
the manuscript resolves to a *software* deposit, and the manuscript itself is not publicly indexed.

## 3. The companion verification suite (`opfibration-merged-`)

`README.md` (3,028 bytes) heads the file `verify_abaee_currying.py` (58,594 bytes; 73 checks) as the
*"Companion code for the manuscript 'No Universal Process Currying: The Intercept Principle,
Environmental Currying, and Finite-Dimensional Obstructions to Exact Process Storage, Evaluation, and
Recovery'."* Groups A–O. Inspection shows the companion **already contains** most of the mathematics
that the audits listed as "missing" from the manuscript under audit:

| Audit proposal | Status in the author's companion |
|---|---|
| Chan obstruction via `B = E`, `e⁴−e²+1` never a square | **present**: `check("Chan no-right-adjoint: e^4-e^2+1 never a perfect square (e=2..199)")`; also `e=2..300` later |
| Graded/intercept engine; `n = 1, 2` collapse | **present**: group J ("intercept and graded-intercept engine"); instantiations "CHAN: forced `d_RB² = e⁴−e²+1`" and "INSTR: intercept eq forces `e² = 1`" |
| Classical analogue | **present**: FinStoch vertex inequality `b^e > e(b−1)+1` |
| `A = B = ℂ` pointwise witness (S2 §2B.2) | **present** in substance in group A (grade-1 & grade-2 joint unsolvability for all `b, r`) |
| "Instr isn't a category" / strictification | **handled** by the companion's models (multiset quotients) rather than in the manuscript under audit |
| Retrodiction/recovery done properly | **present**: group E ("Petz recoverability: the four equivalent conditions flip together"); `unitary-if-square: recoverable square channel is unitary (r=1)` |
| Sharp constants, in-radii, cone geometry | **present**: group D (`c(e) = e/2`, in-radius `2/e²`), group K (`c_n(e) = e/2`, `2/(ne²)`) |
| Multiset quotient / coarse-graining (meta-review's open problem) | **classified as OPEN by the author**: group O header states the multi-outcome case "is OPEN (the 2nd triangle needs `T∘R` to factor through `T`, unproven)", with partial levers: adjunction transpose is a natural split mono, one-outcome unit excluded, forced strict growth `d_R ≥ d_A+1`, non-square/cokernel estimates |

**Audit consequence (important).** (i) The manuscript under audit should *cite* these results rather
than re-derive them; its "closes the gap" claim is true of the programme but not of this paper.
(ii) The audits' claim that the intercept machinery is redundant is too strong for the classical
analogue (see `00_ADJUDICATED_AUDIT.md` §2.8): that is precisely where the companion's "graded
intercept engine" is needed. (iii) The meta-review's open problem about merging outcomes is not a new
observation: the author's own suite already marks it open, with more partial structure than the
meta-review had.

## 4. What this does *not* change

* The published manuscript's headline claims remain wrong as printed (direction of implication,
  "strictly stronger", "closes the gap", the retrodiction/arrow-of-time reading, the "epistemic
  asymptote"): the companion's existence shows the *programme* contains the correct mathematics, not
  that the audited text states it correctly.
* The missing affine-dimension lemma (§2.2 of the audits) is genuinely absent from the manuscript
  under audit; the companion's dimension statements are computational, not the convex-geometry lemma.
* No claim in this file rests on the companion's own correctness; only on what the companion *states
  and certifies*, quoted verbatim from its files.

## 5. Reproduction commands

```bash
curl -s https://api.github.com/repos/MIKEAA2020/arrow-of-time-insight/git/trees/HEAD?recursive=1
curl -s https://api.github.com/users/MIKEAA2020/repos?per_page=100
curl -sL -H "Accept: application/vnd.citationstyles.csl+json" https://doi.org/10.5281/zenodo.20860298
curl -s "https://zenodo.org/api/records?q=opfibration&size=10"
curl -s https://raw.githubusercontent.com/MIKEAA2020/opfibration-merged-/HEAD/README.md
curl -s https://raw.githubusercontent.com/MIKEAA2020/opfibration-merged-/HEAD/verify_abaee_currying.py
```

Downloaded copies used during the audit: `../work/refs/` (outside the repository tree; not committed
because they are third-party repository contents already public at the URLs above).


## 6. Second pass: the comb-level companion article (`Quantum-combs`)

Fetched and read on 2026-10-02: `combs 1/quantum combs submission2.tex` (104 KB),
`verification_checks.py` (21 KB, checks 1a–6b), `verification_output.txt`, `README.md`.
Rechecked on 2026-10-05 against the companion's public [supplement README](https://github.com/MIKEAA2020/Quantum-combs/blob/main/combs%201/README.md) and [raw TeX](https://raw.githubusercontent.com/MIKEAA2020/Quantum-combs/main/combs%201/quantum%20combs%20submission2.tex): check 6b states the general outside-hypothesis square form `c=k(2w−k)`, `g_B=(w−k)²` for `2≤k<w`, in addition to the `k=1` boundary case; check 6a says only that escapes are outside its strict no-go hypothesis. This resolves the earlier overreading of check 6b as boundary-only.

**Article:** *Quantum Combs, Higher-Order Processes, and the Normalization-Defect (Intercept)
Principle*, Amin Abaee (`amin_abaee@ut.ac.ir`).

Its theorem list (extracted from the `.tex`) contains, **independently of the audited manuscript**:

| Companion result | Relation to the audited paper |
|---|---|
| Lemma *Affine dimension under affine bijection* | the very lemma the six reviews and the meta-review found missing in the audited paper — in the stronger affine-independence form (no relative-interior hypothesis) |
| Proposition *One-slot hom-set dimension*; Lemma *Polynomial grid* | dimension bookkeeping in the deterministic superchannel category |
| Theorem *No affine representing object*; Theorem *No right adjoint for environment decoration*; Corollary *Any affine extension has no right adjoint* | the deterministic counterpart of the audited paper's Theorem 4.2 |
| Theorem *No left adjoint for environment decoration*; Corollary *…no left adjoint* | one of the audits' "upgrades" (sonnet2 A7 / sonnet3 C3.3) — **already a theorem here**, proved by the `e²−e+1` sandwich |
| Proposition *Classical environment decoration has neither adjoint* | the classical analogue (sonnet2 C2 / sonnet3 C3.2 / grok3 #3) — **already a theorem**, using the FinStoch dimension **and vertex count** |
| Corollary *The parallel tensor product is not closed* | the closest existing "where closure lives" statement (sonnet3 E4) |
| Proposition *Pointwise obstruction at fixed outcome number* and supplementary check 6b | the fixed-`n` instrument no-go has hypothesis `2 d_E d_B − 1 > (e−1)/n`; check 6b also gives the outside-hypothesis square-escape parameterization `c=k(2w−k)`, `g_B=(w−k)²` (`c=(e−1)/n`, `w=d_Ed_B`, `1≤k<w`). The `n=1, k=1` case is the boundary family `d_B=d_E/2`; it is not the only escape. |
| Lemma *Flat point; positivity does not lower the dimension*; Theorem *Telescoping dimension formula* (combs, all arities) | the higher-order dimension theory |
| Verification checks | 3: `e²−e+1` never a square (to `e = 20000`, plus 2,000,000 random draws to 10⁹); 5: `b^e − 1 = e(b−1)` unsolvable; 4a/4b: parallel tensor is monoidal (interchange verified); 1a–1d, 2, 6a, 6b |

**Consequences for the audit.**

1. Several "upgrades" proposed by the reviews and the meta-review are **already theorems in the
   author's programme**: the affine-dimension lemma, the no-left-adjoint statement, the classical
   analogue, the normalisation/intercept explanation (named the *Normalization-Defect (Intercept)
   Principle*). The revised manuscript therefore **cites** them (§5.5 "Priorities", refs [8], [13])
   instead of presenting them as new. This is recorded as docket item D23.
2. The meta-review's open problem about "dimension counting can't distinguish `Chan(E,B)` from a state
   space" is *partially* answered by the revision's separate convex-body results. For the fixed-`n`
   instrument slice, however, the companion's Proposition and supplementary check 6b already record
   the no-go regime and the general outside-hypothesis square-escape factorization
   `c=k(2w−k)`, `g_B=(w−k)²`; the `n=1, k=1` boundary family is only one case. Prop. 4.7 states this
   as an iff with `n | (d_E²−1)` and `1≤k<w` made explicit, and spells out the genuinely degenerate
   `B=ℂ, n=1` match. Thus it is a useful formalization/organization, not a newly discovered escape
   family. The representability question at non-degenerate matches remains open.
3. The audited paper's genuine novelty must be stated more narrowly than earlier drafts did. The
   literal-`Instr` per-`B` categorical theorem and its grade-dependent relation to `Chan`, the
   standalone one-slice `Chan(E,E)` versus state-space obstruction, and the corrected structural
   interpretation are not the same claims as the companion's fixed-`n` affine-slice calculation.
   The all-`n`, `B=E` form of Thm. 4.6 is a transparent specialization of the companion's stated
   square-gap regime; Prop. 4.7 formalizes the companion's check-6b escape algebra rather than
   claiming a new family. Any priority claim for the defect invariant or other additions should be
   checked against the exact companion source, not inferred from the earlier audit summary.

## 7. Second pass: cover letters and practice (`channel-supp-augmented`)

* `cover letters/qip-cover-letter-instruments.{tex,txt,pdf}`: a 53-page submission to *Quantum
  Information Processing*, *Exact Affine Geometry, Optimal Centres, Certified Compression Bounds, and
  Flag-Quotient Width Obstructions for Finite-Outcome Quantum Instruments*, whose abstract states
  **"the affine dimension of the body of n-outcome instruments between systems of dimensions d_A and
  d_B is `d_A²(n d_B² − 1)`"** — i.e. Prop. 3.1 of the audited paper is a programme result already in
  submission elsewhere. It also states the in-radius `2/(n d_B min{d_A,d_B})`, that the uniform
  depolarising instrument is simultaneously optimal for packing and covering, and a complementarity
  identity linking the radii. None of this appears in the audited paper; the audited paper's remaining
  edge is the adjointness/currying obstruction, not the body geometry.
* `glm/EXTERNAL_MERIT_AUDIT.md`: the author's own programme (a different research line) runs
  "external merit audits" — a reproduction gate, a literature audit, and a queue of merited work, with
  failures recorded as failures. The present audit is in the same spirit; the practice is noted here
  because it explains the author's tolerance for adversarial review.

## 8. Repository metadata (second pass)

* `arrow-of-time-insight`: default branch `main`, **no issues and no pull requests**, one commit before
  this audit (`9a01a02`), `uploads/` untouched by the revision.
* The programme index (`MIKEAA2020/master`, 92 KB README) does **not** index the opfibration line; the
  opfibration manuscripts are discoverable only through the repositories themselves. A referee-visible
  index entry would help priority documentation.
