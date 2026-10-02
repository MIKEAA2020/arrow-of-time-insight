# 04 — Every remaining point from the audits: implemented / corrected / declined

Scope: **all** actionable suggestions in the six reviews (S1: sonnet1–3, grok1–3) and the meta-review
(S2), plus the points in the manuscript (S0) that the audits flagged without proposing a fix, plus the
material discovered in the author's public record (S3) in this second pass. Disposition codes:

* **IMPLEMENTED** — adopted in `paper/REVISED_PAPER.md` as proposed.
* **IMPLEMENTED-CORRECTED** — adopted, but the suggestion was wrong or incomplete and the corrected
  version was used (correction stated).
* **ALREADY-IN-PROGRAMME** — the point is already a theorem/result in the author's own companion
  material (`[8]` opfibration-merged- / `[13]` Quantum-combs); the revision cites it instead of
  re-deriving it.
* **DECLINED** — not adopted, with reason.
* **OPEN** — turned into an explicitly stated open problem.

Verification status of everything marked IMPLEMENTED is in `verification/verify_claims.py`
(124 checks, 0 failures) and `verification/verification_log.txt`.

---

## A. Foundations of the category (Defs. 2.1–2.3, Rem. 2.1)

| # | Source | Suggestion | Disposition | Where |
|---|---|---|---|---|
| A1 | sonnet1 §2.1–2.2, sonnet2 A3, sonnet3 B3, S2 A1 | "Outcome sets as data" breaks the unit law; hom-collections are proper classes; use `[n]` with lexicographic product | **IMPLEMENTED-CORRECTED** — the lexicographic fix is right for **composition** (verified: mixed-radix encoding is strictly associative and unital), but the *interchange law* for `⊗` then holds only up to a permutation, so the tensor is weak unless one quotients by relabellings | Defs. 2.2, 2.4; §7.1; log §I |
| A2 | sonnet1 §2.2 | Remark 2.1 ("strictly associative up to") is self-contradictory and unproven | **IMPLEMENTED** — remark deleted; replaced by the explicit convention | Def. 2.2 |
| A3 | sonnet1 §2.3, sonnet2 A3, sonnet3 B3, grok2 §4, S2 A2 | The monoidal structure is never defined, yet closure is asserted | **IMPLEMENTED** — `⊗` defined explicitly; Cor. 4.11 stated in the quotient model | Def. 2.4, Cor. 4.11 |
| A4 | sonnet2 A3, sonnet1 §2.4, sonnet3 B3, grok2 §8, S2 A4 | Exclude `d = 0`; add "non-zero" to the hypotheses | **IMPLEMENTED** (`dim ≥ 1` throughout) | Conv. 2.5, §7.1 |
| A5 | sonnet2 A3, sonnet1 §2.6 | State whether zero and repeated outcome components are allowed; say this is a modelling choice | **IMPLEMENTED** — explicit remark, with the scope split between the graded and the model-independent theorems | Rem. 2.6 |
| A6 | sonnet1 §2.5, sonnet2 A3, sonnet3 B3, grok2 §8, S2 A7 | Notation: `Φ`/`E`/`I`/`B` overloaded, `O(ε_B)` and `dim_aff` undefined, no Choi convention, no Schrödinger-picture declaration, `Instr(A)` clash | **IMPLEMENTED** — `O(·)` defined in Def. 2.3; conventions section; all notation disambiguated | Defs. 2.1–2.4 |
| A7 | S2 §2A2 | Two ways to make the closure claim rigorous: multiset model + semialgebraic dimension, or state Cor. 4.4 for `F_E` only | **IMPLEMENTED (both)** — Cor. 4.11 stated for `F_E`/quotient model, and **semialgebraic dimension** added as the quotient-robust invariant for the graded argument | Rem. 3.4 |

## B. The mathematical core

| # | Source | Suggestion | Disposition | Where |
|---|---|---|---|---|
| B1 | sonnet2 A1, sonnet3 B3, S2 A3, grok1, grok2 §1 | State the missing lemma: affine injection on a convex set preserves affine dimension | **IMPLEMENTED-CORRECTED (and ALREADY-IN-PROGRAMME)** — the audit's relative-interior proof is correct in finite dimensions; the companion article `[13]` proves the stronger affine-independence form (no interior hypothesis). The revision uses the stronger form and records both | Lemma 3.2 + alternative proof; log §B |
| B2 | sonnet2 A2, grok2 §3 | Explain where `Φ⁻¹(g) = ε_B ∘ F_E(g)` comes from (naturality/Yoneda); do not let it look assumed | **IMPLEMENTED** — explicit remark | Rem. 4.3b |
| B3 | all six + S2 | The prime step is redundant | **IMPLEMENTED** — primes removed; counting route reduced to "no nontrivial units"; §6's misdescription of the monoid property deleted | Lemma 4.1(2), Rem. 4.2 |
| B4 | sonnet2 A4, sonnet3 B1 | The intercept argument needs neither `m = 1` nor primes: for general `m` the slices correspond `n ↔ nm` and the intercept still forces `m d_E² = 1` | **IMPLEMENTED** — this is now the main proof, and it yields the stronger per-`B` statement | Thm 4.3 |
| B5 | sonnet3 B1 | Triangle identity gives a one-line determinism proof (`O(ε)·O(Fη) = 1`) | **IMPLEMENTED** — retained as Lemma 4.1(1); S2's objection (it only covers `B ∈ im F`) noted: that is all the sharp theorem needs | Lemma 4.1(1); D17 |
| B6 | sonnet2 A5, sonnet3 B2 | The Chan gap closes in three lines: `B = E`, `d_R² = d_E⁴−d_E²+1` is never a square | **IMPLEMENTED (as Thm 4.8) and ALREADY-IN-PROGRAMME** — the companion `[8]` certifies exactly this ("`e⁴−e²+1` never a perfect square"); the revision proves it and cites the companion | Thm 4.8; log §C |
| B7 | sonnet2 A6, sonnet3 B2, S2 §1 | The direction of implication is inverted: an `Instr`-adjunction restricts to `Chan` | **IMPLEMENTED** — reduction proved; "strictly stronger"/"shadow" deleted | Prop. 4.9, Rem. 4.10 |
| B8 | S2 §2B.2, sonnet3 E1 | Make the pointwise witness (`A = B = ℂ`) the main theorem | **IMPLEMENTED-CORRECTED** — merged into the general-`m` Theorem 4.3, which needs no special witness and covers every `B`; the `ℂ`-witness is retained as an instance in §7.2 | Thm 4.3 |
| B9 | sonnet2 A7, sonnet3 C3.3 | `F_E` has no left adjoint either (Chan: `ℂ` terminal but `E` not; Instr: grading) | **IMPLEMENTED (with a simpler proof) and ALREADY-IN-PROGRAMME** — companion `[13]` has a "no left adjoint for environment decoration" theorem; the revision gives the two-line `A = B = ℂ` slice argument | Thm 4.12; log §F |
| B10 | — (new in this pass) | `Instr` has **no terminal and no initial object** | **IMPLEMENTED (new)** — so the causal-asymmetry story must be told in `Chan`, not `Instr` | Prop. 4.13 |
| B11 | sonnet2 B, sonnet3 B4 | The opfibration is never constructed; a proper Grothendieck construction is needed; redraw Fig. 1 with `u`, `u_!`, missing `u_*` | **IMPLEMENTED** — full construction with hypothesis `E_{v∘u} ≅ E_u⊗E_v`; **bifibration ⟺ every `E_u ≅ ℂ`**; new clean figure; the original Cor. 4.3 kept only in its honest conditional form | §4.6 (Def. 4.14, Thm 4.15, Rem. 4.16); `figures/causal_opfibration.svg` |
| B12 | sonnet1 §6.3 | Figure 1's labels overlap and the projection arrows are unlabelled | **IMPLEMENTED** — rebuilt as SVG with no overlaps, labelled projection `p`, fibres, lifts | `figures/causal_opfibration.svg` |
| B13 | sonnet2 §2B.6, D7 | Cor. 4.4's phrasing ("for any non-trivial environment dimension") is confused; state the iff | **IMPLEMENTED** — Cor. 4.11 with "iff `d_E = 1`", stated for a single `E` and in the quotient model | Cor. 4.11 |
| B14 | sonnet2 §2E | State that `d_R(B)` is independent of `n` and `A`; note that two slices suffice | **IMPLEMENTED** | Rem. 4.4 |
| B15 | — (new in this pass) | Classification of the parameters at which the dimension count *can* be matched ("escapes") | **IMPLEMENTED (new; equivalent to the companion's boundary analysis `[13]` check 6b)** — escapes ⟺ `n \| (d_E²−1)` and `(d_E²−1)/n = j(2 d_E d_B − j)`; representative dimension `d_E d_B − j`; `B = E` never escapes; `B = ℂ` always does (genuinely, degenerately); Pell family = `j = 1`, `n = 1` | Prop. 4.7; new Open Problem 7.2; log §K |
| B16 | — (new in this pass) | Uniform-in-`n` sharpening: no single slice at `B = E` is representable | **IMPLEMENTED (new; specialises `[13]`'s pointwise proposition to `B = E`, where its hypothesis is automatic)** — two-line sandwich `(e−1)² < e² − (e−1)/n < e²` | Thm 4.6 |
| B17 | sonnet3 E6 | Quantify the "missing dimension" `δ_n(R)` | **IMPLEMENTED (sharpened)** — `δ_n = n(ev−r) + (1−e)`; the minimal uniform defect is exactly `e−1`, attained at the compact-closed answer `r = ev`; a Diophantine escape at `n = 1` costs exactly `e−1` at `n = 2` | Prop. 5.6; log §K |

## C. Interpretation (§5–§7 of the original)

| # | Source | Suggestion | Disposition | Where |
|---|---|---|---|---|
| C1 | sonnet1 §7.1, sonnet2 C1, sonnet3 C1 | The counit is evaluation (currying), not retrodiction | **IMPLEMENTED** — the retrodiction identification is deleted; §6.1 states the correct reading | §6.1 |
| C2 | sonnet2 C1, S2 §3.5 | Replace the retrodiction story with a theorem about retrodiction | **IMPLEMENTED-CORRECTED** — exact recovery ⇔ isometric channel (no ancilla state needed; the audits' `V(ρ⊗σ)V†` phrasing belongs to approximate recovery). Pointed-channel functoriality added | Props. 6.1, 6.2 |
| C3 | sonnet2 A8, sonnet3 E2, S2 §3.4 | The obstruction *is* normalisation/causality; CPM is compact closed; `128` vs `140` | **IMPLEMENTED and ALREADY-IN-PROGRAMME** — numeric bookkeeping included; the companion `[13]` names it the "Normalization-Defect (Intercept) Principle" | Prop. 5.1; log §H |
| C4 | sonnet2 C2, sonnet3 C3.2, grok3 §3 | Classical (FinStoch/instrument) analogue, with the vertex-count refinement | **IMPLEMENTED AND ALREADY-IN-PROGRAMME** (companion `[13]`, `[8]`) — plus a new sharpening: quantum dies at `n = 1`, classical needs `n = 2`, which is exactly why the grading engine is needed | Thm 5.2, Prop. 5.3 |
| C5 | sonnet2 C3.1, sonnet3 C3.1 | Reversible/groupoid test: no right adjoint yet everything invertible | **IMPLEMENTED** | Prop. 5.4 |
| C6 | sonnet2 C3.3, sonnet1 §7.5 | Time-symmetry: no left adjoint, so no left/right asymmetry | **IMPLEMENTED** — and strengthened by Prop. 4.13 (no terminal object in `Instr` at all) | Thm 4.12, Prop. 4.13 |
| C7 | sonnet2 C3.4, S2 §3 | Irreversibility is partly definitional; coarse-graining would destroy the grading | **IMPLEMENTED** — scope table + modelling remark + Open Problem 7.1 | §7.1, Rem. 2.6 |
| C8 | sonnet1 §7.2, sonnet2 C1 | Unitaries are invertible in `Instr`; Petz maps exist for every channel/reference state — so the theorem is not about inversion | **IMPLEMENTED** — explicit clause | §6.1 |
| C9 | sonnet3 E5 | Use the right fibred picture for outcome dependence: the total-map functor `Σ : Instr → Chan` | **IMPLEMENTED** — `Σ` defined, functoriality/commutation stated, fibres identified as refinements; companion's multiset-quotient findings cited | Rem. 5.8 |
| C10 | sonnet3 E3 | Restate as a GPT/affine statement: "channel spaces are not state spaces" | **IMPLEMENTED** — Cor. 5.7 (with the Pell caveat that dimension alone can match at other `B`) | Cor. 5.7 |
| C11 | sonnet3 E4 | Say where closure lives (combs, `Caus[−]`, higher-order completions) | **IMPLEMENTED** as a clearly labelled interpretation + Open Problem 7.4; external context (CPTP semicartesian monoidal; Coecke–Lal) cited | §5.5, refs [11],[12],[14] |
| C12 | sonnet1 §7.6, sonnet3 C4 | "Most general post-measurement updates" is false in scope (continuous outcomes, supermaps) | **IMPLEMENTED** — deleted; scope table states the exclusion; [5],[6] now cited | §7.1, Def. 2.1 |
| C13 | sonnet1 §7.3 | "Entropy increase on the base poset" / "time-symmetric poset" are not meaningful | **IMPLEMENTED** — deleted | §5.5, Rem. 4.16(iv) |
| C14 | S2 §2C3 | Three cheap tests show non-existence of `R` is not a signature of irreversibility, quantumness, or time direction | **IMPLEMENTED (all three)** — CPM, classical, no-left-adjoint | Props. 5.1, 5.4, Thm 5.2, Thm 4.12 |
| C15 | sonnet1 §7.7, sonnet2 D, sonnet3 D, S2 §1 | The §5 disclaimer is not honoured; abstract/§7 state interpretation as result | **IMPLEMENTED** — register made consistent; the offending sentences deleted | §5.5, §6.4, abstract |
| C16 | grok1, grok3 | "§5/§6 are appropriately caveated / cleanly separated" | **DECLINED** — contradicted line-level (D9/D10) | `00_ADJUDICATED_AUDIT.md` §3 |

## D. §6 "epistemic asymptote" and §7 conclusion

| # | Source | Suggestion | Disposition | Where |
|---|---|---|---|---|
| D1 | sonnet1 §8, sonnet2 D, sonnet3 D, S2 §2D | Nothing is formalised; replace with a scope-and-limits remark | **IMPLEMENTED** | §7 |
| D2 | grok2 §7 | Move §6 to a short note or delete the taxonomy | **IMPLEMENTED** — taxonomy retained only as an editorial reminder, explicitly applied to the original §§5–6 | §7.3 |
| D3 | grok3 §6.6 | Add a formal conservativity criterion for the asymptote | **DECLINED** — it would require a fixed proof system, which the audit itself says does not exist; the scope table achieves the practical purpose without a formal claim | §7.3 |
| D4 | sonnet2 E8, sonnet3 E8, S2 | Add a numerical/machine certificate (Data Availability) | **IMPLEMENTED** — 124-check suite, log committed; Lean formalisation listed as an open problem | `verification/`, §7.2(5) |
| D5 | all | "fully extracted"/"enacted"/"intellectual integrity" rhetoric | **IMPLEMENTED** — deleted | §7.3, §8 |

## E. References, metadata, external context

| # | Source | Suggestion | Disposition | Where |
|---|---|---|---|---|
| E1 | sonnet1 §9.2, sonnet2 E, sonnet3 F, S2 §2E | `[3]` wrong (Synthese 186(3):651–696, 2012) | **IMPLEMENTED** — verified against external records | doc 02 §3; refs |
| E2 | sonnet1 §9.3, grok2 §5, S2 | `[4]` is process matrices/indefinite causal order, not retrodiction | **IMPLEMENTED** | doc 02 §4; refs |
| E3 | sonnet1 §9.1, sonnet3 F | `[5]`,`[6]`,`[7]` never cited | **IMPLEMENTED** — cited at Def. 2.1, §5.5, Prop. 5.1 | refs |
| E4 | sonnet1 §9.4, sonnet2 E, sonnet3 F, S2 | `[1]` unverifiable | **RESOLVED (new finding)** — the DOI resolves to a Zenodo **software** record (20860299), not the manuscript; the Intro's "unproven Diophantine claim" understates a false quantifier | doc 02 §1; refs [1],[8]; D13 |
| E5 | sonnet1 §9.6, sonnet3 F | Affiliation vs `ut.ac.ir` email | **IMPLEMENTED** | title block |
| E6 | S2 §2E, grok3 | "Missing context: non-closure of normalised/causal categories; higher-order completions; what is new" | **IMPLEMENTED** — external context paragraph added; priority statement added distinguishing the programme's existing results from this paper's; a full literature search is flagged as not done | §5.5; doc 03 |
| E7 | grok2 §2, S2 §2B1 | Give non-trivial Diophantine examples | **IMPLEMENTED** — family `(k, 2k, 2k²−1)`; the 70-solution box reproduced by two independent routes | §1, Thm 4.8, log §C/§K |

## F. Declined, with reasons (summary)

1. **"A right adjoint in one category neither implies nor excludes one in the other"** (sonnet1 §1.1) —
   false: the adjunction restricts to `Chan` (Prop. 4.9).
2. **"The physical force of the theorem is largely a bookkeeping artifact"** (sonnet1 §2.6) — true only
   for the graded theorems; Theorem 4.6 needs no grading and is model-independent.
3. **"Drop the grading together with the primes"** (S2 upgrade #1) — the primes go, the grading stays:
   it alone gives the per-`B` statement and it is the engine that transports to the classical case
   (Prop. 5.3).
4. **"Naturality in `A` is automatic once the counit is deterministic"** (grok2 §3) — wrong order of
   reasoning; naturality is given and produces the formula (Rem. 4.3b).
5. **`V(ρ⊗σ)V†` characterisation of retrodiction** (sonnet2 C1) — belongs to approximate recovery; the
   exact statement has no ancilla state (Prop. 6.1).
6. **grok3's measure-theoretic prime argument** — fails as stated (`|I×M| = |I|`); the infinite-outcome
   case needs a different invariant (Open Problem 7.3).
7. **"§5 remarks can stay exactly as written" / "ready for a venue"** (grok2, grok3) — the corrections
   above are load-bearing.

## G. Newly found material (this second pass) folded into the revision

1. **`[13]` Quantum-combs** (author's own): affine-dimension lemma (stronger form), no-right- and
   no-left-adjoint theorems, classical `FinStoch` proposition with the vertex count, "parallel tensor is
   not closed", the pointwise-at-fixed-`n` obstruction with the boundary/escape analysis, and the
   `e²−e+1` sandwich — all **cited rather than re-derived**; the revision's novel contributions are
   delimited explicitly (§5.5 "Priorities").
2. **`[8]` opfibration-merged-/supplement**: "`e⁴−e²+1` never a square", the intercept engine, the
   FinStoch mismatch, the multiset-quotient partial results and its open status.
3. **QIP cover letter** (channel-supp-augmented): confirms the affine-dimension formula for instrument
   bodies is already used in the author's programme → same priority treatment.
4. **Repo hygiene**: the manuscript repository has no issues/PRs and only `main`; `uploads/` is kept
   byte-identical in the revision.
5. **Consequence for the audit itself:** several "upgrades" proposed by the reviews and the meta-review
   exist as theorems in the author's companion articles, so the correct audit verdict for those items is
   **ALREADY-IN-PROGRAMME**, not "missing" — recorded here and in doc 03.

## H. What remains genuinely open (nothing to implement; listed to prevent over-claiming)

1. Coarse-graining quotient (grading destroyed) — §7.2(1).
2. Representability of the non-degenerate dimension escapes — §7.2(2).
3. Infinite-dimensional / measurable-outcome versions — §7.2(3).
4. Higher-order completions made precise — §7.2(4).
5. Lean formalisation; external priority search; a no-programming interpretation of `δ_n` — §7.2(5),
   §5.5, Prop. 5.6.
