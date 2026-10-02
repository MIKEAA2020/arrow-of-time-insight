# Revision changelog — original manuscript → `paper/REVISED_PAPER.md` (Rev. 2)

Every element of the original 6-page PDF is listed in order of appearance, with its verdict and the
location of the replacement text. Verdict codes: **KEEP**, **FIX** (statement corrected), **MOVE**
(re-labelled as interpretation), **DELETE**, **ADD** (missing result supplied).

| # | Original (page/section) | Verdict | Replacement (Rev. 2) | Audit finding |
|---|---|---|---|---|
| 1 | Title "The Opfibration Ontology: …" | KEEP (recommend subtitle) | unchanged, with subtitle "(Rev. 2)" | — |
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
| 58 | "No single slice at `B = E`" — new uniform-in-`n` statement | ADD | Thm 4.6 | new (log §K) |
| 59 | Classification of all dimension-count escapes | ADD | Prop. 4.7 (+ the `B = ℂ` genuine escape, the Pell family as `j=1, n=1`) | new; equivalent to companion check 6b |
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

* the repaired category definition and the weak/strict distinction for `⊗`; the affine-dimension
  lemma; the counit lemmas (triangle + counting); per-`B` non-representability; the one-slice sharp
  theorem; the reduction; the no-left-adjoint and no-terminal/initial results; the CPM comparison;
  the classical analogue and its `n`-threshold; recovery and Bayesian-inversion sections; the scope
  table, counter-models and open problems; the corrected reference list; computational certificates.
