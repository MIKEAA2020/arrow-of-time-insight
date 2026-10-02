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
| `Quantum-combs` | TeX | "prallel with opfibration" | higher-order/comb completion territory |
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
