# 05 — Adjudication of the open-problems source note

**Source:** `uploads/sonnet time open problems.txt` (83 KB, 832 lines, 13 parts; LLM-generated research
note supplied with this revision). Line references below are to that file as committed.
**Method (Gate 1):** every numbered result and every load-bearing lemma is read line by line, its
dependencies listed, its proof checked by hand, and its quantitative content re-derived in
`verification/verify_claims.py` (section **L**, checks **L1–L20**; 180 checks total, 0 FAIL).
Nothing in the source is treated as authority: where its proof is a sketch we either supply the missing
argument or mark the result *conditional* and keep it out of the paper's numbered results.
**Disposition vocabulary:** *correct* (proof checked, integrated); *correct-after-repair* (gap found,
repair supplied here); *conditional* (true under hypotheses stated in the note or added here; integrated
only with those hypotheses printed); *superseded* (true, but a cleaner proof in this revision does not
need it); *unverified* (not checked; not relied upon); *false* (refuted); *residual gap* (kept open).

Integration target: `paper/REVISED_PAPER.md`, new **Appendix C** (results numbered C.n), with pointers
from §4.4, §6.4 and §7.2. Reference [15] records the note as an unpublished working note whose proofs
are folded into the paper so the revision is self-contained.

---

## 1. Summary table

| # | Claim (source location) | Depends on | Status | Evidence | Integration |
|---|---|---|---|---|---|
| A1 | `Instr_cg` definition; reduction of proportional components is a congruence; strictly monoidal (l.4–11) | — | correct | hand check; L1 | C.6 (definition), C.7 |
| A2 | Measure model; extremes ⇔ independent marginals; Carathéodory `k ≤ d_A²` (l.12–27) | A1 | correct | L15a/b/c, L1c, L1d | C.7, C.9 |
| A3 | Top stratum `k = d_A²` has dimension `d_A²(d_A²d_B²−1)` (l.25–27) | Prop. 3.1 | correct | L10, L15c | C.9 |
| A4 | No right adjoint / no representing object in `Instr_cg` via semialgebraic dimension of extreme sets (l.29–38) | A2, A3 | **gap** (its §5 admits the semialgebraic bookkeeping is unwritten) | inspection; the dimension equation alone does not exclude a dimension-preserving piecewise-polynomial injection | **not used** (deprecated route, recorded in C.9); replaced by A6 + C.2 |
| A5 | Self-declared limits of part 1 ("proof is a sketch") (l.2, 39–51) | — | correct self-assessment | — | recorded in §4 below |
| A6 | **Thm 8**: quadrilateral face `P_T = {c≥0: Σc=4, Σβc=0}`, β=(1,−1,2,−2), the four vertices `e₁₂,e₃₄,e₁₄,e₂₃`, and `½e₁₂⊕½e₃₄ = ¼e₃₄⊕⅜e₁₄⊕⅜e₂₃` ⇒ no representation, any B, any R (l.288–330) | A2 | **correct** | exact arithmetic L1a–L1e; the `Instr_0` refinement L2/L18; two-step argument re-proved in C.8 | **Theorem C.8** |
| A7 | "Preparation homs are simplices, measurement homs are not" (l.330) | A6 | correct (interpretation) | L1e vs L6c | C.9 |
| A8 | Retraction of the ℚ-simplex remark; the quadrilateral reappears over ℚ (l.341–375) | — | correct (self-retraction) | L7a–L7c | C.9 |
| B1 | **Kraus-rank theorem**: `Chan(E,B)` is not affinely isomorphic to a state space, `d_E,d_B ≥ 2` (l.498–520, 794–808) | Choi extremality | **correct** | L3a–L3f, L19; strata/submersion/openness/max re-derived in C.2 | **Theorem C.2** |
| B2 | Escape table `(2,4,7)→32/12`, `(4,8,31)→384/60`, `(3,35,99)→4900/196` (l.512–518) | B1 | correct | L3f | table inside C.2 |
| B3 | "No Diophantine condition enters"; `Chan` representable only at `B = ℂ` (l.520–526) | B1 | correct | L3e/L3e′; `d_B = 1` case = point | **Corollary C.3** |
| B4 | `Instr_0` connectedness: `Chan(E,B) ≅ State(V)` for a nice representation (l.182–192) | representability | **correct-after-repair** | the general-`B` dimension step is escape-prone (L5a″: `d_V² = d_E²(d_B²−1)+1` *is* a square on the Pell boundary `d_B = d_E/2`) — the source's general-`B` claim must and does rest on B1 | Theorem C.10, with C.2 doing the work |
| B5 | "The genuinely `Instr`-specific content is exactly `B = ℂ`" (l.526) | B1 | correct | by B1 + §5.1 | C.4 |
| B6 | Record-forgetting functor `c`; `T(ρ) = ε̄(ρ⊗·)` maps `State(R(B))` onto `Chan(E,B)`; no-programming theorem (l.542–597) | adjoint exists | **correct-after-repair** | L4c; independent proof in C.5: needs `R(B)` finite-dimensional **or separable** (uncountable orthonormal family) | **Theorem C.5** |
| B7 | Residual case "pointwise `d_B < d_E` in dyadic/rational" (l.580–584) | — | **superseded** | closed by C.2 + C.3 (Chan non-representability propagates) | §7.2(2) closed |
| B8 | "Second invariant: faces of dimension 1 or 2" (l.522–524, 612–614) | face computations | **unverified** | not checked here; not needed (C.2 covers) | L20; not relied upon |
| C1 | **Thm 5**: separable infinite-dimensional, normal maps, arbitrary outcome spaces (l.233–243) | B6, Arveson extremality | **conditional** (four checks, not fully verified) | Arveson criterion not re-derived; L11, L17 | C.13 (conditional statement; not printed as a theorem) |
| C2 | **Thm 6**: non-separable `Chan` (l.246–253) | face of dim 2 | **superseded** | implied by B1 (affine dimension kills infinite-dim `R`; B1 kills finite `R`) | C.3 |
| C3 | **Thm 7**: non-separable `Instr_0` (l.256–268) | partition/face argument | **unverified** | superseded by E4 (purely algebraic, no compactness) | not used; C.13 |
| C4 | Thm 4(b) in any dimension / non-separable, finite counit (l.270–273) | E3 | **correct** | L13a–L13c, L5b′ | **Theorem C.12** |
| C5 | Separability essential; `ℓ²(Chan)` lookup-table processor (l.631–641) | B6 | **conditional** | L11 (the processor exists and its Λ is not injective — Lemma B is evaded); the Hilbert-dimension `2^ℵ₀` argument is the source's, not re-derived | C.13, C.19 |
| C6 | Measurable-outcome `cg` (l.466–474) | disintegration | **conditional** | depends on the definition; the disintegration identification is unchecked (source's own caveat) | C.13; residual gap R2 |
| C7 | Non-normal states, finite-dimensional `E` (l.462–466) | slice maps | **conditional** (dim `E < ∞` only) | source's own restriction; not extended | residual gap R4 |
| D1 | Typed systems; Lemmas 1–2; `𝒯` a category; `ι` fully faithful (l.711–740) | — | correct | short proofs in C.15; L14a | C.15 |
| D2 | Internal hom; Lemmas 3–4; **Theorem H1** `−⊗E ⊣ [E,−]` (l.742–786) | (E0) | **correct** | (E0) verified L8a; `Ψ(f)` CP verified L8c; round trip L14b; dims L9a | **Theorem C.16** |
| D3 | Cor. 1: `𝒮_[E,𝔅] = {C(f)/d_E : f ∈ Chan(E,B)}` (l.788) | D2 | correct | L14a | Cor. C.17 |
| D4 | Prop. 3: intercept = codimension `d_E²−1` (l.817) | D2, Prop. 3.1 | correct | L9a | Cor. C.17 |
| D5 | Prop. 4: grading via `𝔅_n` (l.821–832) | D2 | correct | L9b | Prop. C.18 |
| D6 | Counit = Bell post-selection, not TP off the slice (source states this) | — | correct | L17a (exactly 1 on the slice), L17b (defect off it; example-dependent) | C.19 |
| D7 | Remark: `𝒯` as affine-slice shadow of `Caus[CPM]`; tensor vs double-orthogonal closure (l.830) | — | **unproven in the source** | not verified | C.19; residual gap R5 |
| D8 | Theorem 2: `[E,𝔅]` is not a first-order object; no right adjoint (l.810–815) | B1 | correct | B1 + Cor. C.17 | Cor. C.17 |
| E1 | Lemma A (finite support) (l.388) | finitary congruence | correct-after-repair (needs the "size changes by one" finiteness; stated by the source, kept) | L6a/L6b (finitary moves), L6c′ | Lemma C.14 (hypotheses printed) |
| E2 | Lemma B (finite-dimensional faces; rank `(m−1)d_E²+1`) (l.390–394) | — | correct | L12 (rank 13 with `dim R = 4`, rank 21 with `dim R = 5`, capped at 9 with `dim R = 3`) | Lemma C.14 |
| E3 | **Thms 9–10** (B = ℂ, B ≥ 2; countable outcomes) (l.398–414) | E1, E2 | correct | L2a–L2e, L13; the `κ = m+1` count re-derived | Theorem C.12 (finite outcomes); C.13 (countable-outcome case: conditional) |
| E4 | **Thm 11** (atomic factorization; `Instr_0`, any B, any R, any multiplicity) (l.442–452) | recorded mixing | **correct-after-repair** | two elementary steps supplied in C.10 (irreducible ⇒ atom; atoms of `Hom_0(ℂ,R)` are single states); L2a–L2e, L18 | **Theorem C.10** |
| E5 | `D^ω` orbit-weight model (l.454–460) | A6 | correct | L16a, L16b (dyadic mixing weights; same w-vectors) | **Proposition C.11** |
| E6 | Blocked node: finitary `D`, `dim E = ∞`, non-separable `R`, infinite counit (l.475–481) | — | **residual gap** (source's own) | — | residual gap R2 |

---

## 2. Claim-by-claim detail (the load-bearing points)

### A4 — why the source's *first* cg proof is not used
The source's part-1 argument compares the dimension of extreme sets:
`d_A²(d_A²d_R²−1) = d_A²d_E²(d_A²d_E²d_B²−1)` for all `A`, "equating intercepts gives `d_E = 1`". The
algebra is right (and is the same intercept mechanism as Prop. 3.1), but the step "dimension of the
extreme set" is only available if the extreme sets are semialgebraic of computable dimension **and**
`Φ⁻¹` is a piecewise-polynomial injection whose pieces preserve dimension — exactly what the source's
own §5 lists as *not yet written*. Two further defects: (i) for `A = ℂ` the source's own count is a
dimension comparison of two convex bodies (valid), but for the *non-representability* claim one needs
the comparison at a single `A`, not "for every `A`"; (ii) the dimension route cannot see `B = ℂ`.
**Disposition:** the claim is true, the proof as printed is a sketch; it is replaced by A6 (quadrilateral)
for all `B` and by C.2 (Kraus rank) for the Chan level. Nothing from A4 is printed as a theorem.

### A6 / E4 / E5 — the quadrilateral (verified exactly)
`P_T = {c ∈ ℝ⁴ : c ≥ 0, Σc_l = 4, Σβ_l c_l = 0}` with `β = (1,−1,2,−2)` is the intersection of a
3-dimensional affine subspace with the orthant; all basic feasible solutions are enumerated in check
**L1b** and give exactly the four vertices `(2,2,0,0), (0,0,2,2), (8/3,0,0,4/3), (0,8/3,4/3,0)`
(`e₁₂, e₃₄, e₁₄, e₂₃`). **L1c/L1d** verify that the associated instruments are trace-preserving with
linearly independent marginals (hence extreme). **L1e** verifies
`½e₁₂ ⊕ ½e₃₄ = ¼e₃₄ ⊕ ⅜e₁₄ ⊕ ⅜e₂₃` in exact rational arithmetic, with all weights summing to 1.
**L18** verifies the sharper, `Instr_0`-specific statement that the identity in fact holds *literally,
component by component* with the numbers `9/20, 11/20` (no cancellation), which is what makes the
atomic-factorization proof of Thm 11 work without any quotient. **L16a/L16b** re-express the same
arithmetic in the `D^ω` orbit-weight language and check that the mixing weights `(½,½)` and `(¼,⅜,⅜)`
are dyadic.
Two proof steps that the source leaves implicit were supplied here (C.8, C.10):
1. in `Instr_cg` the hom-set *is* a set of finitely supported measures on rays, so an equality of
   elements is an equality of measures, and two measures with different supports cannot be equal;
2. "irreducible ⇒ atom" and "atoms of `Hom_0(ℂ,R)` are single states" (the latter because scaling a
   state by `p < 1` and its complement by `1−p` is a recorded mixture in `Instr_0`).

### B1 — Kraus-rank theorem: what is actually proved
Checked in detail (C.2 below and in the paper):
* strata: `dim M_r = 2Nr − r² − d_E²` for **non-empty** strata. **L3b** confirms the numerical rank is
  `d_E²` exactly on the non-empty strata and is *one less* precisely at the empty stratum (`r = 1`,
  `d_E > d_B`): the source's "submersion at every channel" is correct at every channel, but the sentence
  "increases in `r` for `r < N`" must be read on non-empty strata;
* extremal ⇒ Kraus rank `≤ d_E` (`r²` elements `K_i†K_j` in a `d_E²`-dimensional space, **L3d**);
* extremal channels of rank exactly `d_E` exist for `d_B ≥ 2` (`K_i = |u⟩⟨e_i|`, **L3c**) and
  extremality is an open condition, so `dim Ext Chan = 2d_E²(d_B−1)` (**L3a/L3b**, table **L3f**);
* the algebra: `R = d_E²(d_B−1)+1` in `R²−1 = d_E²(d_B²−1)` forces `d_E²(d_B−1) = d_B−1`, so `d_E = 1`
  (**L3e**, **L3e′** exact search + symbolic);
* the class of state spaces ruled out (Gate 3 request): normal state spaces of `B(H_R)` for **any**
  Hilbert space `R` — infinite-dimensional `R` fails on affine dimension alone, so only finite `R`
  needs the extreme-dimension comparison; and, by the same pair of invariants, also
  `State(M_R ⊕ M_S)` (**L19**, exhaustive search to 199 finds no match).
  *Not* ruled out by this argument: affine **embeddings** into state spaces, and isomorphism with
  convex bodies that are not state spaces. The paper states the class explicitly.
* consequence (B7): combined with Prop. 4.9 (an `Instr`-representation restricts to a `Chan`-
  representation), Chan non-representability closes the escape question of §7.2(2) for every `B` with
  `d_B ≥ 2`; `B = ℂ` is the trivial point at `n = 1` and fails at `n = 2` by dimension. **§7.2(2) is
  closed.**

### B4 — `Instr_0` connectedness: one repaired step
The connectedness step ("`Chan(E,B)` is convex, hence connected, so exactly one `j₀` has
`S_{j₀} ≠ ∅`") implicitly uses that the `S_j` are faces of `State(R)` whose images are *closed*
(in finite dimensions compact) and pairwise disjoint. With that added, the conclusion
`T_{j₀}: State(V) → Chan(E,B)` an affine bijection is fine, and comparing dimensions gives
`d_V²−1 = d_E²(d_B²−1)`. **This dimension equation is escape-prone for general `B`** — check **L5a″**
exhibits the Pell boundary `d_B = d_E/2 = k`, where `d_V² = (2k²−1)²` is a square and the count alone
says nothing. This is a genuine error risk in the source (it presents the count as the engine); the
repair is to invoke C.2 (Kraus rank), which needs no Diophantine condition, exactly as the source's own
cross-reference to its Kraus theorem suggests.

### B6 — record forgetting: repaired hypothesis
The source's proof needs the family `{ψ_U}` of pure preimages of the unitary channels to be pairwise
orthogonal; the contradiction is an **uncountable orthonormal family** in the program register. Hence
the register must be finite-dimensional **or separable**. The source states "separable Hilbert spaces"
in its infinite-dimensional part but does not restrict `R(B)` in the finite-dimensional part (where
finite dimension suffices). The paper's printed theorem carries the disjunction explicitly
(**Theorem C.5**). The overlap identity used there is re-proved from scratch in **Lemma C.1** (a
three-line argument: `Λ_ψ†Λ_ψ' = ⟨ψ|ψ'⟩1_E` for the "compressed dilation" `Λ_ψ = Σ_r ψ_r W_r`), which
also removes any dependence on the source's less explicit "contraction Γ" formulation.

### C1/C3 — infinite-dimensional sketches
Two of the source's infinite-dimensional results (`Thm 5` separable/normal/arbitrary outcomes;
`Thm 7` non-separable `Instr_0`) rest on (i) Arveson's extremality criterion and (ii) a
face/partition argument. Neither was re-derived here. They are **not** needed: `Thm 6` (non-separable
Chan) follows from C.2, and the `Instr_0` conclusion follows from the purely algebraic C.10 (which
needs no compactness, no separability, no finite dimensionality of `R`). Both source results are
recorded as *conditional/unverified* and appear in the paper only inside a remark on what remains
unchecked (C.13).

---

## 3. Gate 3 — repairs and restatements (what the paper prints, and how)

| Weakness in the source | Repair / restatement in this revision |
|---|---|
| cg defined for finite outcome sets only; "countable outcomes are covered" asserted (l.316) | **Proved here**: Lemma C.7 — an extreme point of `Hom_cg(A,B)` has finitely many components, at most `d_A²`, even when outcome sets are countable (perturbation argument along a dependent subset). The paper prints `cg` for finite **or countably supported** outcomes with that lemma. |
| Kraus-rank theorem "not affinely isomorphic to any state space" | Printed as: *not affinely isomorphic to the normal state space of `B(H_R)` for any Hilbert space `R`*, with the class of state spaces (and the direct-sum strengthening) spelled out; embeddings explicitly **not** excluded. |
| `Instr_0` general-`B` "dimension count" | Printed with C.2 (Kraus) as the engine; the count's escape at `d_B = d_E/2` (L5a″) is stated in the proof as the reason. |
| Record forgetting "separable" vs finite register | Disjunction printed in Theorem C.5. |
| 𝒯 counit = "Bell post-selection" | Printed as: a morphism *of the typed category*, trace-preserving **on the admissible slice** (checked exactly: L17a); the generic trace defect is recorded with the computed values (L17b: e.g. `0.72, 0.99, 1.07` for three random off-slice examples — the note's `0.97` is one instance, not a theorem). |
| 𝒯 closure "for every first-order E" | Printed with the hypothesis visible: the right adjoint `[E,−]` exists for **first-order `E`**; `[E,𝔹]` is itself a *typed*, not first-order, system (Cor. C.17), and the tensor/`Caus[CPM]` comparison remains unproven (R5). |
| Dyadic lemma A needs the finitary congruence | Printed with that hypothesis; `D^ω` covers the infinite-merge case (Prop. C.11). |
| Finitary `D`, `dim E = ∞`, non-separable `R`, infinite counit | Left **open** (R2); listed in §7.2 as a residual gap. |
| Measurable-outcome cg | Left **conditional** on the measure-valued definition (R3); the disintegration identification is not asserted. |
| Non-normal states | Finite-dimensional `E` only (R4). |
| Face-of-dimension-2 invariant | Not used; recorded as unverified (L20). |

---

## 4. Self-declared limits that were *not* silently upgraded

1. part 1 (`cg`): "the proof is a sketch with identified checkpoints (§5), not yet a full proof" → the
   sketch is replaced, not upgraded (§2, A4).
2. the rational quotient / ℚ-simplex remark was retracted by the source itself; the retraction is
   accepted and the quadrilateral over ℚ is verified (L7a–L7c).
3. dyadic Lemma A requires the **finitary** congruence (each move changes the multiset size by one) —
   printed as a hypothesis.
4. `𝒯` closure only for first-order `E`; the `Caus[CPM]` comparison unproven — printed as a remark.
5. the typed counit is Bell post-selection: trace-preserving only on the admissible slice — printed with
   the numerical defect.
6. measurable-outcome `cg` needs a disintegration check — residual gap R3.
7. non-normal states only for `dim E < ∞`, and only in `Instr_0`, `cg`, `D^ω` — residual gap R4.

---

## 5. Residual gaps after this revision (kept visible in §7.2)

* **R1** Finitary `D` with `dim E = ∞`, non-separable `R`, infinitely many counit outcomes (source's
  blocked node).
* **R2** Measurable (uncountable) outcome sets: the `cg` hom-set as a space of measures modulo
  label-forgetting needs a disintegration theorem; the note's definition-level claim is not promoted.
* **R3** Non-normal states beyond `dim E < ∞`; the categories themselves need a definition there.
* **R4** The source's infinite-dimensional sketches (its Thms 5 and 7) are not independently verified
  and are not used; the results we print in infinite dimensions are C.2, C.3, C.5, C.10 and C.12 only.
* **R5** `𝒯` vs `Caus[CPM(FHilb)]`: whether the affine-span tensor equals the double-orthogonal
  (comb) closure on the objects used here; and whether `𝒯` is the maximal such completion.
* **R6** The face-of-dimension-2 invariant (source, non-separable Chan) is unverified; unnecessary.
* **R7** Formal verification (`Lean`) of Lemma C.1, C.7, C.8, C.10, C.12, C.16 remains future work
  (§7.2(5)).

## 6. Verification cross-reference

`verification/verify_claims.py`, section **L** (L1–L14 on the note's parts 1–13; L15–L20 the Gate-2
extension): L1 quadrilateral (exact), L2 `Instr_0` four-effect example, L3 Kraus strata/table, L4 block
family + overlap identity, L5 arithmetic counts and the escape adjudication, L6 dyadic congruence,
L7 ℚ-simplex retraction, L8 Choi/(E0)/linearity, L9 typed dims, L10 top-stratum witness, L11
lookup-table processor, L12 Lemma B rank, L13 genericity, L14 (E0) round trip, L15 extremes-iff-
independent + Carathéodory, L16 `D^ω`, L17 Bell-slice trace, L18 literal multiset identity, L19
direct sums, L20 record of the unverified face claim. Total: **180 checks, 0 FAIL**
(`verification/verification_log.txt`).
