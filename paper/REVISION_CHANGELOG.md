# Revision changelog — original manuscript → `paper/REVISED_PAPER.md` (Rev. 2.4)

Every element of the original 6-page PDF is listed in order of appearance, with its verdict and the
location of the replacement text. Verdict codes: **KEEP**, **FIX** (statement corrected), **MOVE**
(re-labelled as interpretation), **DELETE**, **ADD** (missing result supplied).

| # | Original (page/section) | Verdict | Replacement (Rev. 2) | Audit finding |
|---|---|---|---|---|
| 1 | Title "The Opfibration Ontology: …" | KEEP (recommend subtitle) | unchanged, with current revision label "Rev. 2.4" | — |
| 2 | Abstract: "no right adjoint whenever dim(E) > 1" | FIX (true; proof corrected) | Abstract; Thms 4.3, 4.4 | D1, D4 |
| 3 | Abstract: "combines a discrete prime argument … with a continuous intercept argument" | FIX (primes idle; `n` discrete) | §4.1, Rem. 4.2; §4.2 | D2, D3 |
| 4 | Abstract: "clarifying the precise sense in which universal, apparatus-independent retrodiction is impossible" | MOVE (was asserted; replace by the correct reading) | §6; §5.4 | D8 |
| 5 | Abstract/§5.2: "arrow of time emerges as a structural feature of the fibre dynamics" | MOVE → corrected | §5.4, Prop. 5.5 | D8 |
| 6 | Abstract/§6: "we formalize the epistemic asymptote" | DELETE (nothing formalized) | §7 (scope & limits), §7.3 | D10 |
| 7 | §1: "The original proof contained an unproven Diophantine claim" | FIX (it was a *quantifier* error; the equation does have solutions) | §1, §4.4 | D13, D14 |
| 8 | §1: "The instrument obstruction is … strictly stronger than the deterministic one" | FIX (inverted) | Prop. 4.6 + Rem. 4.7 | D1 |
| 9 | §1: "closes the earlier mathematical gap completely" | FIX (the gap is closed by `B = E`, not by `Instr`) | Thm 4.5 | D1, D13 |
| 10 | §1: "might, in principle, allow a right adjoint" | FIX (instruments add constraints) | §1 | D1 |
| 11 | §2 Def. 2.1 (instrument) | KEEP + attribute picture | Def. 2.1; cite [5],[6] | D20 |
| 12 | §2 Def. 2.2 + Rem. 2.1 ("part of the data"; "strictly associative only up to") | FIX (lexicographic outcomes; remark deleted) | Def. 2.2 | D5 |
| 13 | §2 (tensor never defined, yet Cor. 4.4 asserts closure failure) | ADD | Def. 2.4 | D5, D15 |
| 14 | §2 grading `Instr = ⊔ Instr_n` | KEEP + prove multiplicativity | Def. 2.3 | — |
| 15 | §2 Def. 2.3 `F_E` | KEEP (strict endofunctor) | Def. 2.4 | D5 |
| 16 | §3 Prop. 3.1 | KEEP (correct) + exclude `d = 0` | Prop. 3.1; Conv. 2.5 | D6 |
| 17 | §4.1 Lemma 4.1 "prime argument" | FIX (retain as the counting route; primes removed) | Lemma 4.1(2), Rem. 4.2 | D3 |
| 18 | §4.1 "O(ε_B)" undefined | FIX | Def. 2.3 (`O`) | D21 |
| 19 | §4.2 "affine bijection …" step | ADD (lemma) | Lemma 3.2 | D4 |
| 20 | §4.2 "continuous intercept argument … ∀n ≥ 1" | FIX (discrete; two-equation or general-`m`) | Thm 4.3 | D2 |
| 21 | §4.3 "two-equation pedagogical complement … connects directly to the deterministic one" | FIX (order of explanation inverted) | Thm 4.4 | D2 |
| 22 | §4.3 "recovers the Diophantine obstruction as the n = 1 shadow" (implied) | DELETE | Thm 4.4 + Rem. 4.7 | D2 |
| 23 | §4 Cor. 4.3 (opfibration / cartesian lifts) | FIX (either construct or drop) | §7.2(4); Figure removed; Thm 4.9 + Prop. 4.10 replace the lift story | D8, new §2.7 |
| 24 | §4 Cor. 4.4 "not monoidal closed for any non-trivial environment dimension" | FIX (one `E` suffices; iff `d_E = 1`; state model) | Cor. 4.8 | D7, D15 |
| 25 | §5 preamble ("interpretations, not theorems") + §5.1–5.2 ("Theorem 4.2 proves/reveals") | FIX (register made consistent) | §5.4, §6 | D9 |
| 26 | §5.1 "retrodiction map / pull back a measurement result" | DELETE (wrong object) | §6.1 | D8 |
| 27 | §5.1 Petz / Bayesian / process-matrix list | FIX ([4] wrong; [2],[3] are prior-dependent daggers) | §6.1–6.3 | D8, D12 |
| 28 | §5.1 "every retrodiction is necessarily apparatus-specific" | MOVE (underived; replaced by pointed channels) | Prop. 6.2 | D8 |
| 29 | §5.2 "arrow of time … exact and purely categorical" | MOVE → three counter-tests | Props. 5.1, 5.4, 5.5; §5.4 | D8 |
| 30 | §5.2 "most general post-measurement state updates" | FIX (false in scope) | §7.1 (scope table) | D20 |
| 31 | §5.3 measurement-problem disclaimer | KEEP (correct; now consistent) | §6.4 area | D9 |
| 32 | §6 "three mutually reinforcing facts" (prime / intercept / closure) | FIX (item 1 misdescribed; item 2 needs the lemma) | §4.1–4.4; §7.3 | D3, D4, D10 |
| 33 | §6 three failure modes (repetition / extrapolation / interpolation) | MOVE (kept only as an editorial reminder) | §7.3 | D10 |
| 34 | §6 "enacted in the very form of the text" | DELETE | §7.3 | D10 |
| 35 | §7 "confirming that universal … retrodiction is impossible" | FIX | Abstract; §6.4 | D8 |
| 36 | §7 "formal signature of open-system irreversibility in all its forms" | DELETE (false: classical + reversible + CPM tests) | Props. 5.1, 5.4; Thm 5.2 | D8 |
| 37 | §7 "the deductive content … fully extracted" | DELETE (contradicted) | §7.2 (open problems) | D10 |
| 38 | Fig. 1 (cocartesian/cartesian/Past–Future) | DELETE (no construction; `Instr` has no terminal object) | Prop. 4.10 | D8, new |
| 39 | Refs [5],[6],[7] uncited | FIX (cite in place) | Def. 2.1, §5.2, Prop. 5.1 | D20, D26 |
| 40 | Ref [3] metadata | FIX | Ref list [3] | D11 |
| 41 | Ref [4] characterisation | FIX | Ref list [4] | D12 |
| 42 | Ref [1] title/DOI/date | FIX (DOI points to a software record) | Ref list [1] + [8] | D13 |
| 43 | Affiliation vs email | FIX | title block | D30 |
| 44 | Acknowledgments (LLM-assisted verification) | KEEP + strengthen | Appendix A | D4, D31 |
| 45 | — | ADD: per-`B` non-representability | Thm 4.3 | new |
| 46 | — | ADD: one-slice sharp proof | Thm 4.4 | new |
| 47 | — | ADD: reduction `Chan ⇒ Instr` | Prop. 4.6 | D1 |
| 48 | — | ADD: no left adjoint | Thm 4.9 | D8 |
| 49 | — | ADD: no terminal / initial object in `Instr` | Prop. 4.10 | new |
| 50 | — | ADD: classical analogue + `n`-threshold contrast | Thm 5.2, Prop. 5.3 | D8, new |
| 51 | — | ADD: CPM normalisation bookkeeping | Prop. 5.1 | D8 |
| 52 | — | ADD: exact-recovery (isometry) theorem; pointed-channel inversion | Props. 6.1, 6.2 | D8, D19 |
| 53 | — | ADD: scope table, counter-models, open problems, verifiable certificates | §7, App. A | D10 |

## Rev. 2 → Rev. 2.2 (second pass, after reading the author's public record)

| # | Item | Verdict | Replacement (Rev. 2.2) | Source |
|---|---|---|---|---|
| 54 | The affine-dimension lemma is already a theorem in the companion | CREDIT | Lemma 3.2 keeps the proof, adopts the companion's stronger form, cites [13] | companion `[13]` (D23) |
| 55 | "No left adjoint" is already a theorem in the companion | CREDIT | Thm 4.12 keeps the shorter slice proof and cites [13] | D23 |
| 56 | The classical analogue is already a theorem in the companion | CREDIT | Thm 5.2/Prop. 5.3 cite [13]; only the `n`-threshold is new | D23 |
| 57 | The normalisation explanation is named in the companion | CREDIT | Prop. 5.1 cites the "Normalization-Defect (Intercept) Principle" | D23, §5.4 |
| 58 | Fixed-outcome slice obstruction at `B = E` | ADD / PRIORITY SCOPE CORRECTION | Thm 4.6: for each `n`, `Instr_n(E,E)` is not affinely isomorphic to `Instr_n(ℂ,G)`; this is not categorical representability | explicit specialization of companion [13]'s pointwise square-gap regime; same mechanism, no independent novelty claim |
| 59 | Fixed-`n` dimension-match locus | ADD / PRIORITY CORRECTION | Prop. 4.7 states the iff arithmetic condition, makes `n | (d_E²−1)` and `d_G>0` explicit, and records the degenerate `B=ℂ, n=1` match; `j≥2` examples are included | formalizes the general square-escape factorization already recorded in companion check 6b; no new escape-family claim |
| 60 | The defect `δ_n`, quantified | ADD | Prop. 5.6 (minimal uniform defect `= e−1`, attained at `r = ev`; `n=1` escape costs `e−1` at `n=2`) | sonnet3 E6, sharpened |
| 61 | Construct the opfibration (the audits' central complaint) | ADD | §4.6: Def. 4.14, Thm 4.15 (bifibration ⟺ every `E_u ≅ ℂ`), Rem. 4.16 | sonnet2 B / S2 §2B5 |
| 62 | Figure 1 replaced by a correct, legible figure | ADD | `figures/causal_opfibration.svg` | sonnet1 §6.3, S2 §2B5 |
| 63 | Semialgebraic dimension (quotient-robustness of the graded argument) | ADD | Rem. 3.4 | S2 §2A2 |
| 64 | Modelling choices: zero/repeated outcomes allowed, merging out of scope | ADD | Rem. 2.6 | sonnet1 §2.6, sonnet2 A3 |
| 65 | Naturality/triangle identity origin of `Φ⁻¹` | ADD | Rem. 4.3b | sonnet2 A2, grok2 §3 |
| 66 | "Channel spaces are not state spaces" as a corollary | ADD | Cor. 5.7 | sonnet3 E3 |
| 67 | The right fibred picture for outcome dependence (`Σ : Instr → Chan`) | ADD | Rem. 5.8 | sonnet3 E5 |
| 68 | Invertibility clause (unitary channels, Petz maps) | ADD | §6.1 | sonnet1 §7.2 |
| 69 | External context (CPTP semicartesian monoidal; where closure lives) | ADD | §5.5, refs [11],[12],[14] | S2 §2E, sonnet3 E4 |
| 70 | Priority/novelty delimitation vs the author's companions | ADD | §5.5 "Priorities" | D23 |

## Deleted-for-cause summary

* the "prime pincer" framing; the "shadow" metaphor; "strictly stronger"; "closes the gap";
  "continuous intercept"; "signature of irreversibility"; "arrow of time as a consequence of the
  theorem"; "formalized asymptote"; "enacted in the text"; "fully extracted"; Figure 1 and the
  cartesian-lift corollary as stated.

## Added-for-cause summary

* **Revision 2.3 → 2.4**: the first source-note pass was followed by a claim-by-claim correction in
  the mandatory complete/close/companion/drop order. Rev. 2.4 separates category-specific proofs,
  corrects the A4 `B=ℂ` scope, distinguishes the isometric and block-channel face invariants, adds the
  finite-input/countable-counit `D` result, updates the Caus flatness comparison, and preserves six
  residual gaps. The detailed ledger is `audits/05_OPEN_PROBLEMS_SOURCE_EVAL.md`.
* the repaired category definition and the weak/strict distinction for `⊗`; the affine-dimension
  lemma; the counit lemmas (triangle + counting); per-`B` non-representability; the one-slice sharp
  theorem; the reduction; the no-left-adjoint and no-terminal/initial results; the CPM comparison;
  the classical analogue and its `n`-threshold; recovery and Bayesian-inversion sections; the scope
  table, counter-models and open problems; the corrected reference list; computational certificates.
| 71 | Working note supplied with the revision (the four §7.2 open problems) | ADD (adjudicated, not trusted) | `audits/05_OPEN_PROBLEMS_SOURCE_EVAL.md` — claim table with status, evidence, integration action; self-declared limits kept open | new [15]; Gate 1 |
| 72 | §7.2(1) quotient categories (initially "Unproved") | **CLOSE BY CATEGORY AND SCOPE; RETAIN R1–R2** | App. C: C.8 `Instr_cg`; C.10 `Instr_0`; C.11 `D^ω`; C.12 finite-counit `D`/finite-outcome `Q`; C.23 countably supported counit only for finite-dimensional `E` in `D`. Countable `Q` is undefined by the finite rule. | checks L1–L2, L6–L7, L10, L15–L18, L23, L25 |
| 73 | §4.4 remark: Pell pairs "see Open Problem 7.2" | **FIX → CLOSED** | Rem. 4.10 rewritten: the escape is not representable (Thm. C.2 + Cor. C.3) | check L5a″ |
| 74 | §7.2(2) dimension escapes and representability | **FIX → CLOSED** | App. C.2 (Kraus strata `2Nr−r²−d_E²`, submersion rank `d_E²`, `dim Ext Chan = 2d_E²(d_B−1)`, escape table, two-algebra contradiction), Cor. C.3 (incl. direct sums), proof of the source's repair of its own escape-prone count | checks L3a–L3f, L19 |
| 75 | §7.2(3) infinite-dimensional / measurable outcomes | **CLOSE UNDER REGISTER HYPOTHESIS + COMPANIONS; KEEP R2–R4** | App. C.5 proves the normal no-go for a separable program register; C.23 adds countable-counit `D` only for finite `E`; C.25 is a finite-dimensional ray-measure companion; C.26 proves a non-separable surjective, non-injective processor, not a representation. | checks L4c, L23, L26; R2–R4 |
| 76 | §7.2(4) higher-order completions ("Prove, rather than assert") | **FIX → RESOLVED FOR FIRST-ORDER `E`** | App. C.15–C.19: the typed category `𝒯`, lemmas, Thm. C.16 `−⊗E ⊣ [E,−]` via (E0), Cor. C.17 (intercept = codim `d_E²−1`), Prop. C.18 (grade `𝔅_n`), C.19 (Bell-slice counit: exactly TP on the slice, defect off it) | checks L8a–L8c, L9a–L9b, L14, L17 |
| 77 | §7.2 formalisation scope | **RETAIN AS OPEN** | §7.2(7), R6: finite checks supplement but do not replace proof-assistant verification of analytic/category-level arguments. | no formal proof-assistant checks |
| 78 | The overlap identity of the note (Lemma 2) | ADD (re-proved, simplified) | App. C.1 Lemma C.1: `Λ_ψ†Λ_ψ' = ⟨ψ|ψ'⟩1_E`; the note's "contraction Γ" version is its corollary | check L4c |
| 79 | Abstract, Appendix A, and Appendix C introduction | FIX (Rev. 2.4 scope correction) | Replaced blanket "resolves those open problems" and typed "minimality" claims with case-specific scopes and six residual gaps; suite/log regenerated to **196 checks, 0 failures**, with explicit notice that finite checks are not formal proof. | Rev. 2.4; L20a–L27b |
| 80 | Reference list | ADD | [15]: the note as an unpublished working note, plus the three external works used in App. C (Arveson 1969; Nielsen–Chuang 1997; Kissinger–Uijlen 2017) | Gate 4 |
| 81 | Source l.145–162: blanket all-variant pointwise claim | **SCOPE BY CATEGORY; NO QUOTIENT INFERENCE** | §7.2 and C.27/C.13 list separate proofs for `Chan`, literal graded `Instr`, `Instr_0`, `Instr_cg`, `Instr_D`, `Instr_Q`, and `D^ω`; Prop. 4.9 remains confined to Definition 2.2. | source ledger §1; rows C71–C86 |
| 82 | Source A4, lines 29–38 | **COMPLETE AFTER REPAIR; FINITE SCOPE** | C.20 supplies semialgebraic strata/finite-permutation bookkeeping and finite-counit arithmetic, including `B=ℂ`; C.8 remains stronger for arbitrary `R` and countable support. | L20a–c; C83 |
| 83 | Source B8 isometric face claim | **VERIFY WITH HYPOTHESIS** | C.21: finite `E`, `dim B≥d_E`, minimal face dimension 1 (`d_E≥3`) or 2 (`d_E=2`); separate from C.22. | L21a–b; C84 |
| 84 | Block-channel face claim | **ADD AS SEPARATE STRUCTURAL COMPANION** | C.22: for every finite `d_E,d_B≥2`, the supported TP Choi slice is the minimal two-dimensional face; includes `d_B<d_E`. | exact ranks L22a–b; C85 |
| 85 | Finitary `D` with countably supported counit | **CLOSE ONLY FOR FINITE INPUT** | C.23 handles finite-dimensional `E` and arbitrary `B,R`; C.14 support/response lemmas supply the finite-output obstruction. The infinite-input/non-separable case stays R1. | L23 checks only the scalar overlap matrix; C86 |
| 86 | `𝒯`/`Caus` scope | **COMPANION; BALANCE LIMITATION** | C.24 follows the actual flatness condition (Kissinger–Uijlen, Def. 4.2) for balanced normalized slices; no all-slice equivalence or maximality claim. | R5; C87 |
| 87 | Standard-Borel measurable outcomes | **COMPANION; QUOTIENT IDENTIFICATION OPEN** | C.25 constructs finite-dimensional ray-measure instruments and its own no-go; the intended labelled quotient remains R2. | C88 |
| 88 | Non-separable processor | **LIMITATION, NOT REPRESENTATION** | C.26 constructs a normal lookup processor and proves non-injectivity; it supplies no hom-set bijection. | L26a–b; C89 |
| 89 | Instrument pair-sum and grade boundary | **KEEP CATEGORY OPERATIONS DISTINCT** | `s1.py` now labels the componentwise fixed-grade convex-slice decomposition separately from the `Instr_0` recorded-union identity; it is not a quotient or Prop. 4.9 extension. | L27a–b |
| 90 | Verification status and residual list | **UPDATE** | Independent full run: 196 checks passed, 0 failed; finite checks are not formal proofs. Six residual gaps R1–R6 remain in §7.2/C.27. | regenerated `verification/verification_log.txt` |
| 91 | One-slice and fixed-outcome claims | **SCOPE CORRECTION** | Thm 4.5 is a standalone `Chan(E,E)` versus state-space affine obstruction; Thm 4.8 is the categorical `Chan` no-right-adjoint consequence; Prop. 4.9 is the separate grade transfer to literal `Instr`. Thm 4.6 is only a fixed-`n` affine convex-body obstruction `Instr_n(E,E) ≄ Instr_n(ℂ,G)`, not a quotient-category representability theorem. | final consistency review; README and audits aligned |
| 92 | CPM comparison | **LABEL CORRECTION** | Prop. 5.1 now distinguishes equal ambient CP hom-space dimensions from the two `Chan` trace-preserving slice dimensions; the `140−128` difference is explicitly right minus left. | final mathematical consistency review |
| 93 | Dimension-count escape wording | **SCOPE CORRECTION** | Prop. 4.7(c) is explicitly `n=1`; Prop. 5.6 attributes the `d_B=d_E/2` boundary only to the displayed Pell family, not to all escapes (degenerate `B=ℂ` is retained). | final mathematical consistency review |
| 94 | Caus flatness source access | **VERIFY WITH ACCESS NOTE** | Definition 4.2 was checked in the full arXiv v6 HTML; direct PDF fetches from the cited cs.ru.nl host and arXiv PDF endpoint failed and are disclosed in the source ledger. | `audits/05_OPEN_PROBLEMS_SOURCE_EVAL.md` §2.3 |
