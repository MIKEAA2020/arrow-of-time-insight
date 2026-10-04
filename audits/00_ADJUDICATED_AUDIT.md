# 00 — Consolidated, Adjudicated Audit

**Subject.** A. Abaee, *"The Opfibration Ontology: Quantum Instruments, Irreversibility, and the
Epistemic Asymptote"*, 6 pp. (`uploads/arrow_of_time_INSIGHT.pdf`; text extracted and read at
line level — the extraction used is committed here as `audits/S0_extracted_text.txt`, page markers
preserved).

**Audit material under adjudication.**

| ID | Source | What it is |
|----|--------|------------|
| **S0** | the manuscript | 6 pages: Abstract, §1 Intro, §2 Instr, §3 Prop. 3.1, §4 Thm 4.2 + Cors. 4.3–4.4, §5 interpretation, §6 epistemic asymptote, §7 conclusion, refs [1]–[7] |
| **S1** | `uploads/audit of arrow of time insight.txt` | six independent reviews, in file order: **sonnet1, grok1, sonnet2, grok2, sonnet3, grok3** |
| **S2** | `uploads/claude audit of audit of time insight.txt` | meta-review adjudicating S1 (135 lines) |
| **S3** | author's public record (not available to S1/S2) | Zenodo record behind ref. [1]; GitHub `MIKEAA2020` repos, incl. the companion verification suite `opfibration-merged-/verify_abaee_currying.py` (73 checks) |

**Method.** Every arithmetic, convex-geometric, categorical and bibliographic claim was
re-derived independently. All computational claims are reproducible via
`verification/verify_claims.py` (111 checks, all passing; output in
`verification/verification_log.txt`). Where S1/S2 disagree, the dispute is docketed in §3 with an
explicit verdict. **Two of my own intermediate claims were falsified by my own checks and are
corrected in place (§3, D5 and the note in §3.0).**

**Verdict vocabulary** (used consistently below):

* **VERIFIED** — claim re-derived and correct as stated.
* **SUSTAINED** — an audit criticism that I confirm.
* **OVERRULED** — an audit criticism that I reject, with proof.
* **MODIFIED** — partially right; the precise version is given.
* **OPEN** — genuinely undecided here (stated precisely).
* **STYLISTIC** — no mathematical content.

---

## 1. Executive summary

1. **The mathematical core is correct.** Prop. 3.1 (`dim_aff Instr_n(A,B) = d_A²(n d_B² − 1)`)
   and the algebra of Thm 4.2 are right (verified numerically and symbolically). The paper's
   *theorem* — for `d_E > 1`, `−⊗E` has no right adjoint on `Instr` — is **true**.
2. **One genuine gap in the proof:** the "affine bijection ⇒ equal affine dimension" lemma is
   used but never stated (§2.2 below supplies it; two lines; the relative-interior point of
   Prop. 3.1 is exactly what makes it work). With it the paper's proof is sound.
3. **The headline claims about [1] are backwards.** An adjunction on `Instr` restricts to one on
   `Chan`, so *no adjoint in `Chan` ⇒ no adjoint in `Instr`* — not the reverse. "Strictly
   stronger" and "the deterministic obstruction is the n = 1 shadow" are **false** (S1: the three
   sonnet reviews and S2 are right; the three grok reviews are wrong here).
4. **But the one surviving claim is stronger than S1 allows:** the paper's grading/intercept route,
   repaired with the missing lemma, proves non-representability of `Hom(−⊗E, B)` **for every `B`**,
   which the three-line `B = E` computation does *not* give. So the grading machinery is not idle
   (S2's recommendation to drop it is too strong); the **prime step** is idle (all six agree).
5. **The [1] gap closes in three lines** (take `B = E`: `d_R² = d_E⁴ − d_E² + 1` lies strictly
   between `(d_E²−1)²` and `d_E⁴`, hence is never a square) — and the author's *own companion
   suite already proves this* (`opfibration-merged-`: "Chan no-right-adjoint: e⁴−e²+1 never a
   perfect square"). The manuscript simply does not use it.
6. **The obstruction is not a signature of irreversibility, quantumness, or time direction.**
   Confirmed by three cheap tests (S1: sonnet2 A7/C2/C3, sonnet3 C3, S2 §C3): `CPM(FHilb)` is
   compact closed and *does* have the right adjoint `E*⊗−`; the classical case fails identically;
   `F_E` has **no left adjoint either**, so there is no left/right asymmetry. The correct reading
   (verified numerically) is **normalisation**: the trace-preserving constraint costs `d_A²d_E²`
   on the left and `d_A²` on the right; the mismatch *is* the "intercept" `−1` vs `−d_E²`.
7. **Results added by this audit, with credits corrected in the second pass** (§4 and §9): the
   **one-slice sharp proof** and the **per-`B` non-representability** are this audit's independent
   derivations; the **quantum/classical `n`-threshold contrast** is new; `Instr` has **neither a
   terminal nor an initial object** (new); **uniform-in-`n` non-representability at `B = E`** and the
   **escape classification** are new (the latter is equivalent to the boundary analysis in the author's
   companion); the **resolution of ref. [1]** is new. Items the reviews proposed that turn out to be
   **already proved in the author's companions** (affine-dimension lemma, no-left-adjoint, classical
   analogue, normalisation/intercept explanation) are now credited as such — see §9.
8. **Ref. [1] is misattributed.** `doi:10.5281/zenodo.20860298` resolves to Zenodo record
   **20860299 — a *software* deposit** ("MIKEAA2020/opfibration-supplement: Initial supplementary
   simulation", 2026-06-25, MIT, creator "MIKEAA2020"), not to the manuscript title/author cited.
   S1 said "cannot verify"; S2 said "unverified". Verified — and it is wrong as cited.
9. **Ref. [3] is wrong** (`Synthese 186(3):651–696, 2012`, DOI `10.1007/s11229-011-9917-5`;
   the paper's "194, 3185 (2017)" is a different, nonexistent article). **[4] is mischaracterised**
   (process matrices / indefinite causal order, not retrodiction). **[5]–[7] are never cited**
   (§2.3's Def. 2.1, §5.1 and the CPM discussion are exactly where they belong).
10. **§5 and §6 do not survive as written.** §5 opens "not theorems", then says "Theorem 4.2
    proves/reveals…"; the abstract and §7 state §5's content as results. §6 promises to
    "formalize" but defines nothing and admits "we cannot formally prove", while §7 says the
    content is "fully extracted" — and it is not: the author's own companion suite contains further
    mathematics (§5.3 of this document), which refutes "the deductive well is dry" from inside the
    programme.
11. **What survives as interpretation, properly stated:** "channel spaces are not state spaces";
    "[E,B] would be a convex type of *comb*, not a system"; irreversibility is *graded*
    (Petz recovery, `δ_n` defect), not a yes/no adjoint-existence fact; and retrodiction is
    *prior-indexed and functorial on pointed channels*, i.e. apparatus-dependence is a feature of
    the correct category, not a consequence of Thm 4.2.

---

## 2. The verified core (with the proofs the paper needs)

Conventions used throughout: finite-dimensional Hilbert spaces, `d_X = dim X ≥ 1` (zero-dimensional
objects are excluded — see D6); instruments are finite families `{E_i}` of CP maps with `Σ_i E_i`
trace-preserving (Schrödinger picture); outcome counts multiply under composition; the `1`-outcome
slice is `Chan`; the monoidal unit is `ℂ`, `F_E = (−⊗E)`.

### 2.1 Proposition 3.1 — VERIFIED

`dim_aff Instr_n(A,B) = d_A²(n d_B² − 1)`.

*Ambient space:* `n d_A²d_B²` real dimensions. *Constraint:* `(J_i) ↦ Σ_i Tr_B J_i` is linear onto
`Herm(A)` (dimension `d_A²`; surjectivity: put any Hermitian `H` in the first block as `H ⊗ I_B/d_B`).
*Interior point:* `J_i = I/(n d_B)`, strictly positive, and `Σ_i Tr_B J_i = I_A`; hence the feasible
set has nonempty relative interior **in** the affine subspace, so the PSD cone does not lower the
dimension: `n d_A²d_B² − d_A² = d_A²(n d_B² − 1)`.

*Certificate:* rank of the normalisation map computed for `d_A, d_B ≤ 3`, `n ≤ 4`; rank `= d_A²`
in every case, affine dimension matches the formula
(`verification_log.txt`, section A). The same section certifies the strictly positive interior
point, the positivity of the depolarising Choi matrix, and the linearity of the adjunction
transpose `g ↦ ε ∘ (g⊗id_E)` on Choi matrices.

**One defect, inherited from the definition of the category:** the formula is negative for `d_B = 0`
(`−d_A²`). The manuscript must exclude the zero-dimensional space (S1: sonnet1 §2.4, sonnet2 A3,
sonnet3 B3; S2 "domain conditions"; grok2 §8) — **SUSTAINED**.

### 2.2 The missing lemma — the one real gap in the proof (SUSTAINED)

> **Lemma (affine dimension).** Let `C` be a nonempty convex subset of a finite-dimensional real
> vector space and `L` an affine map that is injective on `C`. Then `L|aff(C)` is injective, so
> `dim aff C = dim aff L(C)`.

*Proof.* Every nonempty convex set has nonempty relative interior, so pick `x ∈ ri(C)`. If
`v ∈ ker(dL) ∩ dir(aff C)` were nonzero, then `x ± εv ∈ C` for small `ε > 0`, and `L(x+εv) = L(x)`,
contradicting injectivity on `C`. Hence `L` is injective on `aff C`, so `dim aff C ≤ dim aff L(C)`;
applying the same to `L⁻¹ : L(C) → C` gives equality. ∎

*Why this is the missing step:* Thm 4.2 says "restricts to an affine bijection … Applying
Proposition 3.1". A set-theoretic bijection does **not** preserve dimension (the graph of `x ↦ x²`
is bijectively mapped to the line: dimension drops from 2 to 1 — the verification script exhibits
this as a necessity check). Convexity plus the interior point supplied by Prop. 3.1 is exactly what
turns the bijection into an affine isomorphism of hulls.

*Positions.* S1: sonnet2 A1, sonnet3 A/B3, grok2 §1 call it missing/needed; grok1 calls it
"a missing sentence … standard convex geometry"; S2 lists it as remaining flaw A3. **All
SUSTAINED** — it is a genuine, two-line gap, and its repair does not change the theorem.
**Second pass:** the lemma is *already proved* in the author's companion article [13] (Lemma
"Affine dimension under affine bijection"), in the stronger affine-independence form that needs no
relative-interior hypothesis; the revision adopts that form (Lemma 3.2) and keeps the
relative-interior version as the alternative used in the one-slice theorem.
`verification_log.txt` section B verifies the lemma's mechanism numerically and the necessity of
convexity.

### 2.3 Lemma 4.1 and the counit — VERIFIED but mis-marketed

*The counting form.* With `Φ : Instr(A⊗E,B) → Instr(A,R(B))` the adjunction bijection, the inverse
is the standard `Φ⁻¹(g) = ε_B ∘ F_E(g)` (triangle identity). If `g` has `n` outcomes then
`Φ⁻¹(g)` has `mn` outcomes where `m = O(ε_B)`; surjectivity forces `m | O(h)` for every
`h ∈ Instr(A⊗E,B)`; a 1-outcome instrument exists (trace-and-prepare), so `m | 1` and `m = 1`.

*Corrections to the paper's presentation.*

* **The prime step is idle** (all six reviews agree; **SUSTAINED**). `O(h) | 1` is one line; the
  `p`-outcome dummy instrument `{Φ/p}` is legitimate but unnecessary. §6's item 1 ("`(ℤ⁺,×)` has
  irreducible elements, forcing the counit to be deterministic") misidentifies the property used:
  what is used is that `(ℕ⁺,×)` has **no nontrivial units**.
* **The triangle identity is stronger and cheaper.** `ε_{F(A)} ∘ F(η_A) = id_{F(A)}` gives
  `O(ε_{F(A)}) · O(η_A) = 1` immediately, hence `O(ε_B) = 1` for every `B ∈ im(F)`. Since
  `E = F(ℂ)` up to canonical isomorphism, this pins `ε_E` — the only counit the sharpest theorem
  needs. (S1: sonnet3 B1 proposed this; S2 §1 objects that it "says nothing about ε_B when
  `d_E ∤ d_B`" — true for general `B`, but **not** for the sharpest statement. S2's objection is
  **MODIFIED**: the shortcut is complete for `B ∈ im(F)`, which is what the minimal proof uses.)
* **The proof needs no restriction to finite outcome counts** for the *counit determinism* of the
  sharp form, and no primes anywhere.

### 2.4 Theorem 4.2 — the algebra is right, the rhetoric is not

*Two-equation form (paper §4.3).* From `d_A²(nd_{R(B)}² − 1) = d_A²d_E²(n d_B² − 1)` for all `n`:
subtracting `n = 2` from twice `n = 1` gives `d_{R(B)}² = d_E²d_B²`, and back-substitution gives
`d_E = 1` — contradiction. Symbolically certified (`verification_log.txt`, section D).

*General-m form (repairs and strengthens Lemma 4.1's role).* With `m = O(ε_B)` arbitrary the slice
bijection is `n ↔ nm`, so

```
n d_R² − 1 = n m d_E² d_B² − m d_E²     for all n ≥ 1
⇒  (coefficient)  d_R² = m d_E² d_B²      and      (intercept)  m d_E² = 1,
```

impossible for `d_E ≥ 2` since `m ≥ 1`. **This form needs neither `m = 1` nor the primes** and it
**proves non-representability of `Hom(−⊗E, B)` for every `B`** — the strongest clean statement the
paper contains. (S1: sonnet2 A4 and sonnet3 B1 derive the same identity; S2 §2B.2 states it for
`A = B = ℂ`. Certified here.)

*Rhetoric.* "Pincer", "two independent arguments", "continuous intercept argument":
**SUSTAINED** criticisms (sonnet1 §5.2–5.3, sonnet2 A4, sonnet3 B1, grok3). The two arguments are
*sequential*, `n` is an **integer**, and one of them is redundant in logic. "Connects directly to
the deterministic one" (§4.3) inverts what the computation shows: `n = 1` alone is consistent, and
the contradiction comes from the intercept (`n = 0` direction), i.e. from *strictly more* than the
`n = 1` shadow.

### 2.5 The sharp form — one slice, one object, no grading (new here)

> **Theorem A.** Let `d_E ≥ 2`. Then the presheaf `A ↦ Instr(A⊗E, E)` is not representable.
> Consequently `F_E = (−⊗E)` has no right adjoint on `Instr`, and `Instr` is not monoidal closed.
>
> *Proof.* Suppose `R` is a right adjoint and let `Φ` be the bijection. By the triangle identity at
> `ℂ`, `Φ⁻¹(g) = ε_E ∘ (g ⊗ id_E)` has `O(ε_E)·O(g) = O(g)` outcomes for `B = E`, so `Φ⁻¹` restricts
> to `Instr_1(E,E) = Chan(E,E) ≅ Instr_1(ℂ,R(E)) = States(R(E))`. This map is affine (linear on Choi
> matrices — section A of the verification log) and bijective, and both slices are convex with
> nonempty relative interior (depolarising channel; maximally mixed state). By the lemma of §2.2,
> `d_E²(d_E²−1) = d_R² − 1`, i.e. `d_R² = d_E⁴ − d_E² + 1`. But `(d_E²−1)² < d_E⁴ − d_E² + 1 < d_E⁴`
> strictly for `d_E ≥ 2`, so it lies between consecutive squares and is **never** a square. ∎

Two immediate corollaries, both proved by the *same* computation:

* **Theorem B (Chan, closes the [1] gap).** `−⊗E` has no right adjoint on `Chan` for `d_E > 1`.
  (§1's "gap" was a **quantifier error**: the Diophantine equation does have solutions for special
  `(d_B, d_E)` — infinitely many; it must hold for *every* `B`, and `B = E` kills it. S1: sonnet2
  A5, sonnet3 B2, S2 §2B.1 — **SUSTAINED**. The relevant family is `(d_B,d_E,d_R) = (k,2k,2k²−1)`;
  e.g. `(2,4,7)`, `(4,8,31)`; a box search reproduces S2's count of exactly **70** nontrivial
  solutions with `d_E < 400, d_B < 60`.)
* **Reduction (the logical direction the paper inverts).** If `F_E` has a right adjoint on `Instr`,
  then (i) unit and counit are 1-outcome, so (ii) the `n = 1` slices correspond, and (iii) the
  restricted data is a right adjoint on `Chan`. Hence **`Chan`-non-closure ⇒ `Instr`-non-closure**.

**Why the one-slice proof matters practically.** It is insensitive to how outcome sets are modelled
(tuples vs multisets vs quotient by relabelling), because the `n = 1` slice is *canonically* the
same object in all models. It therefore disposes of the "Instr isn't a category / strictification"
objections *without* repairing the foundations. It does **not** replace the grading route, which
alone gives the per-`B` statement (§2.4).

### 2.6 No left adjoint — both categories (S1: sonnet2 A7, sonnet3 C3.3 — SUSTAINED)

* `Chan`: `ℂ` is terminal (the trace is the unique CPTP map to `ℂ`) but `F_E(ℂ) = E` is not
  (`Chan(E,E)` contains `id` and the depolarising map). Right adjoints preserve terminal objects,
  so `F_E` is not a right adjoint, i.e. it has no left adjoint.
* `Instr`: for a hypothetical `G ⊣ F_E` the unit is forced deterministic by the same counting
  argument (every `h : A → B⊗E` would have `O(η_A) | O(h)`, and 1-outcome maps exist), so slices
  correspond and `A = B = ℂ` gives `0 = d_E² − 1`. (Simpler than sonnet2's POVM count: one slice
  suffices.)

**Consequence:** the "backward" adjoint is missing exactly as the "forward" one is, so **no
left/right asymmetry has been exhibited**; the arrow-of-time reading (§5.2) loses its categorical
anchor (S1: sonnet2 C3, sonnet3 C4; S2 — **SUSTAINED**).
**Second pass:** this too is **already proved** in the companion article [13] ("no left adjoint for
environment decoration"), with the `e²−e+1` sandwich; the revision gives a shorter slice argument and
cites the companion.

### 2.7 Two new categorical facts about `Instr`

> **Proposition.** `Instr` has no terminal object and no initial object.

*Proof.* If `T` were terminal, `Instr(ℂ,T)` would be a single point; if `d_T ≥ 2` there are at
least two 1-outcome instruments `ℂ → T` (different states), so `d_T = 1` and `T ≅ ℂ`. But
`Instr(ℂ,ℂ)` contains `{1}` and `{½,½}`, two *distinct* instruments, contradiction. Dually for an
initial object, using `Instr(ℂ,ℂ) ≥ 2` again. ∎

This matters: the manuscript's Figure 1 and Cor. 4.3 speak of a "base causal poset" with
Past/Future and of cartesian lifts; the *categorical* asymmetry usually invoked for causal order
(`ℂ` terminal but not initial — Coecke–Lal's causality axiom) **exists in `Chan` and is destroyed
in `Instr`**. The paper's fibre-level "arrow" therefore has no anchor in its own category; the
defensible statement is about `Chan`.

### 2.8 The classical analogue (S1: sonnet2 C2, sonnet3 C3.2, grok3 upgrade 3 — SUSTAINED)

Finite-outcome classical instruments `X → Y` form a convex set of affine dimension `|X|(n|Y| − 1)`.
The same graded/intercept computation gives `m|E| = 1`, hence `|E| = 1` — an identical obstruction
with no quantum input. **New sharpening (verified):** the *quantum* theorem already dies at `n = 1`
with `B = E` because dimension counts are *squares* (`d_E⁴ − d_E² + 1` is never a square), whereas
classically `|R| = |E||B| − |E| + 1` is satisfiable at `n = 1` (`|E| = |B| = 2 ⇒ |R| = 3`), so the
classical obstruction *requires* `n = 2`. This is the precise sense in which the grading engine is
not decoration: it is the only one of the two engines that transports to the classical case.
Verified in `verification_log.txt` section G; the vertex-count refinement
(`|B|^|E| > |E|(|B|−1)+1`) from sonnet3 E3 and the author's own suite is also reproduced.
**Second pass:** the classical proposition (dimension *and* vertex count) is already in the companion
article [13]; the new element here is only the threshold comparison (quantum `n = 1` vs classical
`n = 2`).

### 2.9 What the obstruction actually is: normalisation, not irreversibility

* `CPM(FHilb)` (Selinger [7], uncited in the text) is compact closed: `F_E` **has** the right
  adjoint `E*⊗−`, although CPM is full of irreversible maps. So adjoint-existence is not
  irreversibility.
* In the unitary groupoid `F_E` has **no** right adjoint as soon as `d_E ∤ d_B`, although everything
  there is reversible. So adjoint-existence is not irreversibility either way.
* Bookkeeping (verified): `CPM(A⊗E,B)` and `CPM(A, E*⊗B)` have the same ambient dimension
  `d_A²d_E²d_B²`; trace-preservation removes `d_A²d_E²` on the left but only `d_A²` on the right.
  The difference `d_A²(d_E²−1)` *is* the intercept. Example `(d_A,d_E,d_B) = (2,2,3)`: `128` vs
  `140`. The asymmetry behind it is **causality** — uniqueness of the discard/unit effect
  (`ℂ` terminal in `Chan`) — which is exactly the Coecke–Lal/Kissinger–Uijlen territory the paper
  should cite instead of invoking time direction (S1: sonnet2 A8/E2, sonnet3 E2; S2 §3.4 —
  **SUSTAINED**). **Second pass:** the author's programme names this phenomenon the
  "Normalization-Defect (Intercept) Principle" [13], and the revision's defect invariant (Prop. 5.6)
  exhibits the same number `d_E²−1` as the CPM mismatch, as the minimal uniform defect, and as the
  `n = 2` cost of an `n = 1` escape.

### 2.10 Retrodiction and recovery — replacing the unsupported bridge

The manuscript's bridge "missing right adjoint ⇒ retrodiction needs a prior/apparatus" is not
derived (see D8). The honest replacements:

* **A right adjoint to `−⊗E` is currying**, i.e. `R(B) = [E,B]`; the counit is *evaluation*, and it
  points **into** `B`. It is not a retrodiction map (S1: sonnet1 §7.1, sonnet2 C1, sonnet3 C1 —
  **SUSTAINED**).
* **The correct irreversibility theorem** is about left inverses, not adjoints: a CPTP map
  `N : A → B` admits a CPTP `R` with `R∘N = id_A` **iff** `N(ρ) = VρV†` for an isometry `V` (the
  exact case of Petz's sufficiency [2] / Knill–Laflamme), i.e. iff no information left the system.
  (Correction to sonnet2 C1's phrasing: the "ancilla state σ" version belongs to approximate
  recovery/purifications, not to exact left inversion.)
* **Prior-indexed retrodiction is functorial** on pointed/Bayesian channels (Cho–Jacobs;
  Leifer–Spekkens; Parzygnat–Russo). "Apparatus-dependence" is then a *structure* (the base of a
  Grothendieck construction), not an obstruction (S1: sonnet3 E5, S2 §3.5 — **SUSTAINED**; the
  audits correctly flagged "verify before citing" — the Cho–Jacobs and Leifer–Spekkens records were
  checked).

### 2.11 Two further results of the revision (second pass)

* **Theorem 4.6 (uniform in `n`).** At `B = E` not even a single slice is representable: the dimension
  count forces `d_G² = e² − (e−1)/n`, which for every `n ≥ 1` lies strictly between `(e−1)²` and `e²`.
  This specialises the companion's pointwise proposition [13] to `B = E`, where its hypothesis
  `2 d_E d_B − 1 > (e−1)/n` is automatic; the two-line proof is included for self-containedness (log §K).
* **Proposition 4.7 (escapes) / Proposition 5.6 (defect).** See §4 item 7 above and the revision.
---

## 3. The contradiction docket

### 3.0 D0 — Where I had to correct *myself* (disclosed for traceability)

| # | My intermediate claim | Outcome |
|---|---|---|
| a | "The box `d_E < 400, d_B < 60` has 468 solutions, so S2's count of 70 is wrong." | **My error.** `468 − 398 = 70`: the extra 398 are the trivial `d_B = 1, d_R = 1` family. S2's count is **exactly right** for nontrivial `B`. |
| b | "S2's proposed fix ('outcome sets `[n]` with lexicographic product gives a strict category') is wrong: the two re-indexings `((I×J)×K) → [nmk]` and `(I×(J×K)) → [nmk]` differ." | **My error.** The mixed-radix/lex encoding makes them *identical*: composition **is** strictly associative and unital. S2 is right; I verified it for `(n,m,k) = (2,3,4), (3,3,2), (5,2,3)`. The correct surviving objection is about the **tensor** (§D5). |

### 3.1 Docket

**D1. "Strictly stronger / closes the gap" (Abstract, §1, §7).**
Positions: grok1 ("prime + intercept establish…", accepts), grok2 ("reduction to n=1,2 exhibits the
over-constraint relative to the earlier deterministic case"), grok3 ("closes it completely") accept;
sonnet1 §1.1–1.4, sonnet2 A5–A6, sonnet3 B2, S2 §1/§2B reject.
**Verdict: SUSTAINED (sonnets + S2).** An `Instr`-adjunction restricts to `Chan`
(proof in §2.5), so the `Instr` statement is *implied by* the `Chan` statement: it is **weaker**,
not stronger, and the paper never proves the `Chan` statement it claims to extend.
**Nuance the reviews missed (partially vindicating the paper):** the grading route yields the
stronger **per-`B`** non-representability, which the `B = E` computation does not. The grading
machinery is therefore *demoted*, not *deleted* (contra S2's §3 upgrade #1 "Drop Lemma 4.1 and the
primes" — the primes can go, the grading cannot).

**D2. "Pincer of two independent arguments", "continuous intercept argument".**
sonnet1 §5.2–5.3, sonnet2 A4, sonnet3 B1 reject; grok1/2/3 accept.
**Verdict: SUSTAINED.** Sequential, one step logically redundant, `n` discrete. (grok3's
"the n=1,2 proof recovers the original Diophantine obstruction as the n=1 shadow" is **OVERRULED**:
`n = 1` alone is *satisfiable*; the contradiction is the intercept. S2 is right here.)

**D3. Prime argument.**
All six agree it is redundant; §6's description of *why* is wrong.
**Verdict: SUSTAINED.** Used property: no nontrivial units in `(ℕ⁺,×)`, not irreducibility.

**D4. Missing affine-dimension lemma.** grok1: "minor exposition, no errors"; grok2 §1: "insert one
sentence"; sonnet2 A1, sonnet3 B3, S2 A3: a needed lemma.
**Verdict: SUSTAINED (it is a real gap), and grok1's "no errors found" is too lenient** — the
conclusion is unaffected (§2.2 supplies the proof).

**D5. Foundations: is `Instr` a category / is `⊗` defined?**
sonnet1 §2.1–2.2, sonnet2 A3 + B, sonnet3 B3–B4, S2 A1–A2, grok2 §4 raise it; grok1 ("strictification
handled adequately") and grok3 ("handled correctly") wave it through.
**Verdict: SUSTAINED (defect), with the following precise resolution** (all verified):

* As written ("outcome set is part of the data"), the unit law fails strictly and hom-collections
  are proper classes — a genuine defect.
* **S2's fix works for the category**: outcome sets `[n]` with lexicographic/mixed-radix product
  makes composition strictly associative and unital (verified).
* **But it does not make `⊗` strict**: the interchange law orders the 4-fold outcome index
  differently on the two sides (`[mq]×[np]` vs `[mn]×[qp]`), verified with the explicit mismatch
  `(j,k,i,t) = (0,0,1,0): left 2 vs right 4`. So **sonnet2's** point stands for Cor. 4.4
  ("non-monoidal-closure" needs the relabelling quotient or a weak monoidal structure), while
  **S2's** point stands for the category and for `F_E` (strict endofunctor). Neither audit is wrong;
  they are about different structures, and the paper needs both facts separated.
* The sharp one-slice proof (§2.5) is **model-independent** and settles the theorem even if the
  foundations are left as in the manuscript.

**D6. Domain conditions / zero dimensions.** sonnet1 §2.4, sonnet2 A3, grok2 §8, S2 A4.
**Verdict: SUSTAINED.** Exclude `dim = 0`; then `R(E) ≠ 0` follows automatically since
`Instr(ℂ,R(E)) ≅ Chan(E,E) ≠ ∅` (this discharges S2's worry about applying Prop. 3.1 to `R(B)`).

**D7. Cor. 4.4 phrasing.** "not monoidal closed for any non-trivial environment dimension"
(sonnet1 §6.5, sonnet2 B, sonnet3 B4).
**Verdict: SUSTAINED.** State: closure fails; **one** `E` with `d_E ≥ 2` suffices; and state the
iff: `F_E` has a right adjoint **iff** `d_E = 1` (the converse is `F_E ≅ Id`).

**D8. Interpretation: retrodiction, arrow of time, "signature of irreversibility".**
groks endorse; sonnet1 §7, sonnet2 C, sonnet3 C, S2 §3 reject.
**Verdict: SUSTAINED (sonnets + S2), with three verified witnesses** (§2.6, §2.8, §2.9):
no-left-adjoint, classical analogue, compact-closed CPM. Additional point the reviews did not make:
since `Instr` has *no* terminal object (§2.7), the "causal order" half of the story cannot be told
inside `Instr` at all.

**D9. §5 disclaimer honoured?** grok1 ("cleanly separated"), grok3 ("appropriately caveated") say
yes; sonnet1 §7.7, sonnet2 D, sonnet3 C4, S2 §1 say no.
**Verdict: SUSTAINED (no).** Line-level evidence: §5 preamble "not theorems derivable from the
axioms alone" vs §5.1 "Theorem 4.2 proves…", "The obstruction shows that this dependence is … not a
technical limitation but a structural feature"; Abstract "The arrow of time emerges…", "confirming
in §7".

**D10. §6 epistemic asymptote.** grok2 §7 ("over-reaches" — partially), grok3 ("self-aware
methodological boundary"), grok1 ("does not contradict"), vs sonnet1 §8, sonnet2 D, sonnet3 D, S2 §D.
**Verdict: SUSTAINED (reject as written).** Not formalized (no definition of deductive closure);
internally inconsistent (§6 "cannot formally prove" vs §7 "fully extracted"); self-applying
(undefined fibre vocabulary = syntactic interpolation; §5.2 = semantic extrapolation); and — the
point none of the reviews could make — **the author's own companion suite contains further
mathematics** (§5.3 below), so "the deductive well is dry" is false on the author's own record.

**D11. Ref. [3].** Confirmed: Synthetic 186(3):651–696 (2012), DOI `10.1007/s11229-011-9917-5`.
**Verdict: SUSTAINED** (paper's "194, 3185 (2017)" is wrong).

**D12. Ref. [4].** Oreshkov–Costa–Brukner = process matrices / indefinite causal order; the paper
calls it "process-matrix retrodiction". **Verdict: SUSTAINED.**

**D13. Ref. [1].** All of S1/S2 said unverifiable. **Resolved (§4 of
`02_REFERENCE_AND_METADATA_CHECK.md`):** the DOI resolves to a Zenodo **software** record
(`20860299`) whose title, type, creator and date do not match the citation, and whose own
description says it is *supplementary* to "The Opfibration Ontology" manuscript. Also: `[5]`,`[6]`,
`[7]` are never cited; the Intro's "establishes … contained an unproven Diophantine claim" is
self-contradictory in register; and "unproven" understates it — an assertion that
`d_R² = d_E²(d_B²−1)+1` has no solutions is **false** (infinitely many), so the defect was a
false claim, not merely an unproven one. **Verdict: SUSTAINED, extended.**

**D14. Diophantine examples.**
grok2's only example (`d_B = 1`) is trivial (S2 — SUSTAINED); sonnet1's `(d_E,d_B,d_R) =
(8,4,31)` ✓; sonnet2's Pell branch for `d_B = 2` (`(7,4),(26,15),…`) ✓; S2's family
`(k,2k,2k²−1)` ✓ (all verified).
**Verdict: SUSTAINED; correct example to quote is the family `(k,2k,2k²−1)`.**

**D15. Interchange/"Instr isn't closed" formalities.** sonnet1 §2.3, sonnet2 A3/B, grok2 §4,
sonnet3 B3. **Verdict: SUSTAINED.** Define `⊗` (outcomes `I×J`) or restrict Cor. 4.4 to `F_E`.

**D16. sonnet2's objection to §6 item 2 ("intercept scaling multiplicatively").** S2 says too
harsh. **Verdict: MODIFIED (S2 right).** The intercept is `−d_source²` with `d_source : d_A ↦ d_A d_E`;
"scales multiplicatively" is loose but faithful. Not an error.

**D17. sonnet3's triangle-identity shortcut.** S2 §1: "only covers objects `A⊗E`". **Verdict:
MODIFIED.** Enough for `B = E = F(ℂ)`, i.e. for the sharpest theorem (§2.3); not enough for the
per-`B` statement (which the grading argument covers).

**D18. grok2's suggested naturality sentence.** "Naturality in A is automatic once the counit is
deterministic, because both sides are induced by the same linear operations." **Verdict:
OVERRULED.** Naturality is *given* by the adjunction, and `Φ⁻¹(g) = ε∘F(g)` is the triangle
identity — not something one postulates after determinism. The correct sentence is:
"`Φ⁻¹` is computed by the standard formula and is therefore affine for every adjunction."

**D19. sonnet2's retrodiction bridge ("left-inverse iff `N(ρ) = V(ρ⊗σ)V†`").** **Verdict:
MODIFIED.** Exact left inverse (CPTP `R`, `R∘N = id`) ⇔ `N(ρ) = VρV†` for an isometry `V`
(no ancilla state); the `σ`-version is the approximate/purified statement.

**D20. "Most general post-measurement update" (§5.2).** sonnet3 C4. **Verdict: SUSTAINED**
(continuous-outcome instruments [6], measurements of Davies–Lewis [5], supermaps are excluded).
Good news: citing [5]–[7] at Def. 2.1/§5.2 fixes this.

**D21. Appendix-level errors in the manuscript text.** Overloaded symbols (`Φ`, `E`, `I`, `B`),
undefined `O(ε_B)`/`dim_aff`, Fig. 1 label collisions, "Past/Future" undefined, "Instr(A)" notation
clash, no Choi convention, no Schrödinger-picture declaration.
**Verdict: SUSTAINED** (sonnet1 §2.5, sonnet2 A3/E, sonnet3 B3, grok2 §8, S2 A7).

**D23. Is the instrument-body affine dimension new here?** The cover letter of a companion
submission states the same formula `d_A²(n d_B² − 1)` for the body of finite-outcome instruments, and
the companion article [13] proves the affine-dimension lemma and the left/right-adjoint theorems in the
superchannel category. **Verdict: SUSTAINED (priority correction).** These are programme results; the
revision credits them (§5.5 "Priorities") and reserves novelty for the instrument-level per-`B`
theorem, its uniform-in-`n` sharpening, the escape classification and the defect invariant.

**D24. The "escape" family.** The meta-review left open whether the pointwise statement survives small
`d_B`; the companion's Proposition "Pointwise obstruction at fixed outcome number" answers it *with a
hypothesis* (`2 d_E d_B − 1 > (e−1)/n`) and its check 6b enumerates the boundary family `d_B = d_E/2`.
**Verdict: now complete in factorization form** (Prop. 4.7): escapes ⟺ `n | (d_E²−1)` and
`(d_E²−1)/n = j(2 d_E d_B − j)`; the residual question (are non-degenerate escapes genuinely
representable?) is genuinely open and stated as such.

**D22. Model-dependence of the grading (outcome identification / coarse-graining).** Raised by
sonnet1 §2.6 (strongly), sonnet2 A3 (as a modelling caveat), S2 §8 (as an open problem).
**Verdict: OPEN, precisely located.** The sharp one-slice proof is immune (§2.5). For a quotient
that *coarsens* outcomes, the grading indeed collapses; the author's own companion independently
records this case as **open**, with partial levers (split-monomorphism, `d_R ≥ d_A+1`,
non-square/cokernel estimates) — see §5.3. S2's guess ("I'd guess yes, via normalization") is
consistent with those levers but remains **unproved**; the missing ingredient is an invariant that
survives coarse-graining. Candidate (speculative, not proved here): in the coarse-graining quotient
the class of an ensemble `(p_i, ρ_i)` is determined by its finite set of partial sums
`{Σ_{i∈S} p_iρ_i}` — such class-sets are *not* convex, so affine-dimension methods cannot be used
verbatim, which is exactly why the question survives.

---

## 4. Completeness: what all six reviews and the meta-review missed

1. **The one-slice sharp form and its model-independence** (§2.5) — the strongest *and* cheapest
   version of the theorem, and the reason the foundations debate does not endanger the result.
2. **`Instr` has neither terminal nor initial object** (§2.7) — a new, short categorical fact that
   relocates the causal-asymmetry story.
3. **The quantum/classical `n`-threshold contrast** (§2.8): quantum dies at `n = 1` (`B = E`);
   classical needs `n = 2`. This *justifies* the grading engine, contrary to the impression left by
   "the intercept argument is unnecessary".
4. **The general-`m` intercept collapse** `m d_E² = 1` (§2.4) — cleaner than Lemma 4.1 + primes and
   exactly what the author's own companion "intercept engine" uses.
5. **Ref. [1] identified** (§D13, §4 of doc 02).
6. **The author's companion work** (§5 below, and §9): several "missing" upgrades already exist in the
   author's own programme (affine-dimension lemma, no-left-adjoint, classical analogue, the
   "Normalization-Defect (Intercept) Principle"), and one audit's open problem is already classified
   there.
7. **The escape classification** (second pass; Prop. 4.7 of the revision): the pairs `(n, B)` at which
   the dimension count *can* be matched are exactly those with `n | (d_E²−1)` and
   `(d_E²−1)/n = j(2 d_E d_B − j)`; `B = E` never escapes, `B = ℂ` always does (genuinely,
   degenerately), and the Pell family is the `j = 1, n = 1` boundary family. Whether the non-degenerate
   escapes are *genuinely* representable is the sharp residual open problem (§6 below).
8. **The opfibration, constructed** (§4.6 of the revision): Grothendieck construction over a poset of
   stage extensions with `E_{v∘u} ≅ E_u ⊗ E_v`; all fibres are the *same* category `Instr`; it is a
   bifibration **iff every `E_u ≅ ℂ`** — so the bifibration property is a property of the environment
   assignment, not of the dynamics (the honest replacement for the original Cor. 4.3/Fig. 1).
9. **Figure-1 replacement**: the deleted figure has been redrawn from scratch (clean layout, labelled
   projection, `u_!` solid, missing `u_*` dashed) as `figures/causal_opfibration.svg`.

---

## 5. Line-level verdict table (manuscript claims → status)

| # | Claim (manuscript) | Where | Verdict | Evidence / fix |
|---|---|---|---|---|
| 1 | "has no right adjoint … whenever dim(E) > 1" (abstract) | p.1 | **VERIFIED** | §2.5; two independent proofs |
| 2 | "The proof combines a discrete prime argument … with a continuous intercept argument" | p.1 | **MODIFIED** | primes idle; `n` discrete; intercept valid (*needs* the missing lemma) |
| 3 | "two independent arguments that form a pincer movement" | §1 | **SUSTAINED (false)** | sequential; one step redundant (D2) |
| 4 | "The instrument obstruction is … strictly stronger than the deterministic one" | §1 | **SUSTAINED (false)** | reduction `Chan ⇒ Instr` (§2.5, D1) |
| 5 | "closes the earlier mathematical gap completely" | §1 | **SUSTAINED (false as attributed)** | gap closes by `B = E`, not by `Instr`; and it is already closed in the companion suite |
| 6 | "the equation … actually admits integer solutions" | §1 | **VERIFIED** | 70 nontrivial solutions in `d_E<400, d_B<60`; family `(k,2k,2k²−1)` |
| 7 | "the deterministic obstruction is only the n = 1 shadow" | §1 | **SUSTAINED (inverted)** | `n = 1` alone is consistent; the intercept kills it |
| 8 | "might, in principle, allow a right adjoint" (instruments richer) | §1 | **SUSTAINED (unmotivated/inverted)** | richer hom-sets *add* constraints (D1) |
| 9 | Def. 2.1/2.2 + Rem. 2.1 (outcome sets *as data*; "strictly associative up to") | §2 | **SUSTAINED (defect)** | D5; correct repairs given |
| 10 | Prop. 3.1 formula and proof | §3 | **VERIFIED** | rank certificate; note `d_B = 0` exclusion (D6) |
| 11 | "there is no canonical functorial assignment" (§5.1) | §5.1 | **MODIFIED** | the theorem excludes *any* representing object at `B = E`, canonical or not (sonnet3 C4) |
| 12 | "ε_B … universal retrodiction map"; "pull back a measurement result" | §5.1 | **SUSTAINED (wrong object)** | counit = evaluation/currying (§2.10) |
| 13 | Petz/Bayesian/process-matrix list of retrodiction | §5.1 | **SUSTAINED** | [4] mischaracterised; [2],[3] prior-dependent daggers (§2.10) |
| 14 | "every retrodiction is necessarily apparatus-specific" | §5.1 | **SUSTAINED (underived)** | functorial on pointed channels; prior ≠ apparatus (D8) |
| 15 | "the arrow of time … structural feature of the fibre dynamics" | §5.2, abstract, §7 | **SUSTAINED (unsupported)** | no left/right asymmetry; classical case; groupoid case; CPM (§2.6–2.9) |
| 16 | "exact and purely categorical" irreversibility | §5.2 | **SUSTAINED** | it is exact but it is *normalisation*/causality, not irreversibility |
| 17 | "most general post-measurement state updates" | §5.2 | **SUSTAINED (false in scope)** | [5],[6], supermaps (D20) |
| 18 | §5.3 measurement-problem disclaimer | §5.3 | **VERIFIED (correct)** | and it is inconsistent with §5.2's preceding sentence |
| 19 | §6 "three mutually reinforcing facts"; "we submit that beyond this boundary…" | §6 | **SUSTAINED** | item 1 misdescribed; claim of exhaustion contradicted by §5.3 and open problems |
| 20 | "This paper … has been structured to respect the asymptote" / "enacted" | §6, §7 | **SUSTAINED (false)** | abstract/§5.1/§7 state §5 as results (D9) |
| 21 | "The deductive content … is now fully extracted" | §7 | **SUSTAINED (false)** | see §4 above and §6 below |
| 22 | "confirming that universal, apparatus-independent quantum retrodiction is impossible" | §7 | **SUSTAINED** | not what was proved (§2.10) |
| 23 | Cor. 4.3 "the opfibration is not a bifibration" | §4 | **MODIFIED** | true *if* the opfibration is constructed (Grothendieck construction over a poset of environment upgrades — S2 §2B.5 gives a workable recipe); as written it is asserted |
| 24 | Cor. 4.4 "not monoidal closed" | §4 | **MODIFIED** | true once `⊗` is defined; single `E` suffices; state the iff (D7) |
| 25 | Fig. 1 ("cocartesian", dashed cartesian lift, Past/Future) | p.2 | **SUSTAINED** | no base/projection/fibres defined; `Instr` has no terminal object; labels collide (D21) |
| 26 | Refs [5]–[7] uncited; [7] decisive | p.6 | **SUSTAINED** | cite at Def. 2.1 / §5.2 / §2.9 |
| 27 | Ref [3] metadata | p.6 | **SUSTAINED (wrong)** | Synthese 186(3):651–696 (2012) (D11) |
| 28 | Ref [4] characterisation | p.6 | **SUSTAINED (wrong)** | (D12) |
| 29 | Ref [1] title/DOI/date | p.6 | **SUSTAINED (misattributed)** | resolves to Zenodo software record 20860299 (D13) |
| 30 | Affiliation "Independent Researcher" + ut.ac.ir email | p.1 | **STYLISTIC** | make consistent |
| 31 | Acknowledgments: LLM-assisted verification | p.6 | **VERIFIED (honest)** | but see D4: the missing lemma is exactly the kind of thing machine-checking catches; recommend Lean/numerical certificates (this repo's `verification/` is a start) |

---

## 6. Open problems (stated so they can be attacked)

1. **Coarse-graining quotient.** Does `−⊗E` admit a right adjoint when outcomes may be merged
   (i.e. in the multiset/coarse-grained category where the additive grading is forgotten)?
   Status: open (the author's companion records it as open with partial levers; S2 guessed *no*).
   Requires an invariant that survives quotienting — the class-set/partial-sum structure noted in
   D22 is a candidate, not a proof.
2. **Which `(n,B)` escape the dimension count, and are the escapes genuinely representable?**
   *Resolved:* Prop. 4.7 classifies the escapes exactly (`n | (d_E²−1)` and
   `(d_E²−1)/n = j(2 d_E d_B − j)`); `B = E` never escapes (Thm 4.6); `B = ℂ` always does and there the
   representation is genuine but degenerate (both hom-sets are single points); the Pell family is the
   `j = 1, n = 1` boundary family. *Still open:* whether a non-degenerate escape admits an `A`-natural
   family of affine bijections — no dimension count can decide this (the classical case shows a matched
   dimension regime can still be obstructed by a vertex count).
3. **Infinite-dimensional / measurable-outcome versions.** The mechanism (dimension count,
   cardinality grading) is intrinsically finite; grok3's "measure-theoretic prime argument" fails as
   stated (S2 §1: for infinite outcome sets `|I×M| = |I|` and divisibility disappears). Needs a
   different invariant (e.g. conditional-expectation/Petz structure, or a Borel-category variant).
4. **Formal verification.** Prop. 3.1 + the affine-dimension lemma + Theorems A/B are Lean-sized.
5. **Higher-order completions.** Make precise "[E,B] is a convex type of comb, not a system"
   (Caus[−], quantum combs) with a theorem rather than a slogan. (The companion's "parallel tensor is
   not closed" corollary [13] is the closest existing statement.)
6. **Lean formalisation** of Prop. 3.1, Lemma 3.2, Thms 4.3/4.6, Props. 4.7/5.6; an external priority
   search for the instrument-level non-closure statement; a no-programming (Nielsen–Chuang)
   interpretation of the defect `δ_n`.

---

## 7. Source-by-source scorecard (adjudicating the audits themselves)

| Source | Correct (sustained) | Errors found | Overall |
|---|---|---|---|
| **sonnet1** | §2.1–2.2 (category), §2.3–2.5 (notation/zero-dim), §3 (Prop. 3.1 ✓), §4 (prime idle; pincer false; `n` discrete), §5.1–5.3 ✓, §6 ✓, §7 ✓, §9 ✓ | §1.1 "a right adjoint in one category neither implies nor excludes one in the other" — **wrong** (reduction, D1); §2.6 "largely a bookkeeping artifact" — **too strong** (sharp form is model-independent, D22); §1.1 "the deterministic obstruction remains unproven" — correct *about this paper*, superseded by the `B = E` fix and the companion suite | strongest single review on interpretation and on the [1] logic |
| **grok1** | §§2–4 arithmetic, interior point, tuple model | Endorses "pincer/strictly stronger/closes the gap"; calls §5–6 "cleanly separated" (contradicted line-level, D9/D10); "no errors found" understates D4; "strictification handled adequately" misses D5 | mathematically accurate on §§3–4, superseded on §1/§5/§6 |
| **sonnet2** | A1 (lemma), A2 (naturality), A3–A4, A5 (one-line proof; quantifier error), A6 (direction), A7 (no left adjoint), A8 (normalisation, 128 vs 140), B, C1–C3, D, E | §D's objection to "scaling multiplicatively" (**D16**, too harsh); §C1's retrodiction theorem phrasing (**D19**); "the `n=2` slice and the grading are all unnecessary" — true for the theorem, not for the per-`B` statement (D1 nuance) | the most complete technical review |
| **grok2** | §1 lemma sentence, §2 Diophantine reality, §3 naturality need, §4 monoidal gap, §5 [4], §6 figure, §7 §6 over-reach, §8 minor text | The only Diophantine example is trivial (**D14**); the proposed naturality sentence is confused (**D18**); "§5 remarks can stay exactly as written" (**wrong**, D9) | good local catches, wrong global verdict |
| **sonnet3** | A, B1 (triangle shortcut — complete for `im F`), B2, B3–B4, C1–C4, E1–E8 (all either verified here or already present in the author's companion) | None material; "recovering the [1] obstruction as the `n=1` shadow" is grok3's error, not his; his E3 GPT restatement is correct (verified: `d_E⁴−d_E²+1` is not `m²`) | the most upgrade-productive review |
| **grok3** | §2 prime redundant, Prop. 3.1, Thm 4.2, Fig. 1, theorem's core | "recovers the original Diophantine obstruction as the n = 1 shadow" — **OVERRULED** (D2); "§5 appropriately caveated" — **wrong** (D9); "ready for a venue" — **wrong** as written (foundations + refs must be fixed) | right on arithmetic, wrong on framing |
| **S2 (claude meta)** | Adjudication of the sonnet/grok split; the three-line Chan proof; the reduction direction; the `70`-solution count (verified); the `[n]`-lex fix (verified); the normalisation explanation; the three cheap tests; the open-problem list | Minor mis-citation ("sonnet1 §5.2" for sonnet2 A4); upgrade #1 over-shoots by suggesting the grading be dropped (D1 nuance); treats [1] as merely "unverified" (D13); and, for the record, **every explicit number in it reproduces exactly** — 70 solutions (`d_E<400, d_B<60`, nontrivial `B`), `d_E = 2 ⇒ 13`, `128` vs `140`, and no square `d_E⁴−d_E²+1` (re-checked here to `d_E = 300000`); the one over-correction is presenting the CPM/normalisation explanation as *the* explanation rather than one of two (the grading explanation is the other) | accurate, complete, and the right baseline to build on |

---

## 8. Remediation plan (what the revision must contain)

Ordered by value per effort; the rewritten manuscript implementing **all** of it is
`paper/REVISED_PAPER.md`, with a claim-by-claim map in `paper/REVISION_CHANGELOG.md` and the full
disposition of every audit suggestion in `audits/04_REMAINING_POINTS_IMPLEMENTED.md`.

---

## 9. Second-pass addendum (sources not available to S1/S2)

This pass read the author's public record (2026-10-02) and implemented the remaining points.
Corrections to *this document*:

1. **Credits corrected.** The affine-dimension lemma (§2.2), no-left-adjoint (§2.6), the classical
   analogue (§2.8) and the normalisation/intercept explanation (§2.9) are **already proved** in the
   author's companions [8], [13] and in a companion submission whose cover letter states the
   instrument-body dimension formula. §4 previously listed these among things "the reviews missed";
   they are better described as things the reviews could not know and the *revision must cite*, not
   claim.
2. **New results, precisely delimited.** The revision's independent contributions: the instrument-level
   per-`B` theorem (general-`m` intercept collapse), its uniform-in-`n` sharpening at `B = E`, the
   escape classification, the defect invariant, "no terminal/initial object in `Instr`", the
   bifibration biconditional for the constructed opfibration, the semialgebraic-dimension remark, and
   the corrected interpretation.
3. **The opfibration is no longer decorative**: the construction, the fibres and the biconditional are
   proved (with the coherence hypothesis made explicit); the original Cor. 4.3 survives only in that
   conditional form.
4. **Figure replaced, not merely repaired** (`figures/causal_opfibration.svg`).
5. **The residual open problem is sharper than the meta-review's**: two parts, §6 items 1–2.

1. Fix the foundations: `[n]`-lex outcome sets; declare `⊗`; either construct the small opfibration
   (Grothendieck construction over environment upgrades) or delete the fibration claims.
2. Insert the affine-dimension lemma (two lines) and/or use the sharp one-slice proof, which needs
   neither the grading nor the tensor.
3. Restate the theorem: (i) pointwise per `B` via the general-`m` intercept collapse; (ii) sharp
   `B = E` three-liner; (iii) `Chan` version + reduction; (iv) no left adjoint; (v) iff `d_E = 1`.
4. Add the classical analogue and the CPM/normalisation comparison — these *are* the explanation.
5. Replace §5 by labelled interpretation built on (a) currying-vs-retrodiction, (b) the recoverability
   theorem, (c) prior-indexed functorial inversion on pointed channels.
6. Replace §6 by a scope-and-limits remark: hypotheses (finite outcomes, rigid grading, TP
   normalisation, finite dimension, nonzero objects), counter-models where each is dropped, and the
   two open problems of §6 here.
7. Fix references [1], [3], [4]; cite [5]–[7] in the text; reconcile affiliation with email.
8. Keep (and extend) the verification suite; add the Lean target.

---

## 10. Third-pass addendum — the open-problems source note

A further source arrived with Revision 2.3: `uploads/sonnet time open problems.txt`, a 832-line working
note claiming to resolve the four open problems of §7.2. It is adjudicated **claim by claim** in
`audits/05_OPEN_PROBLEMS_SOURCE_EVAL.md` (statuses *correct / correct-after-repair / conditional /
superseded / unverified / gap / residual gap*, each with evidence and an integration action), and its
quantitative content is re-derived in `verification/verify_claims.py`, section **L** (checks L1–L20;
suite total 182 checks, 0 FAIL).

Docket entries:

| D | Finding | Disposition |
|---|---|---|
| D25 | The note's part-1 `cg` theorem rests on "semialgebraic bookkeeping" its own §5 lists as unwritten, and its dimension step cannot see `B = ℂ` | **not used**; replaced by the quadrilateral proof (App. C.8) and, at the `Chan` level, by the Kraus-rank theorem (App. C.2); ledger C79 |
| D26 | The note's `Instr_0` connectedness count `d_V² = d_E²(d_B²−1)+1` is **escape-prone** for general `B`: it *is* a square exactly on the Pell boundary `d_B = d_E/2` | corrected in App. C.10 by making C.2 the engine; recorded as row B4 of `audits/05`; ledger C74 |
| D27 | The note's infinities are unevenly justified (Arveson step and face-partition argument not re-derived; measurable-outcome `cg` needs a disintegration check; non-normal states only for finite-dimensional `E`) | two of its infinite-dimensional theorems are recorded as **conditional and unused** (R4); the measurable-outcome and non-normal cases are kept as residual gaps R2, R3; ledger C76, C81 |
| D28 | The note's typed-completion counit is Bell post-selection, i.e. a *typed* morphism, trace-preserving only on the admissible slice | printed that way, with the off-slice trace defect computed (1.072/0.989/1.011 for three random examples; the note's "0.97" is one instance, not a theorem); `audits/05` Gate 3 table; ledger C78 |
| D29 | The note's "findings that are true but unused": the face-of-dimension-2 invariant for non-separable `Chan`; the semialgebraic route; the source's `Thm 7` | recorded as unverified/unused (R6, R4) rather than promoted; nothing in the paper depends on them |
| D30 | The note's priority-relevant content vs the author's companions | no new priority claim arises: the note's results are a *revision* of the manuscript's own open problems, and the companion overlaps (square-gap, intercept) were already delimited in §5.5 |

Consequences for the manuscript: Appendix C (C.1–C.20) added with proofs; §7.2 rewritten from
"open" to *closed / closed under hypotheses / open* with the residual gaps R1–R7 kept visible; §4.4 and
Rem. 4.10 re-pointed at C.2–C.3; abstract, Appendix A and the reference list [15] updated. Nothing from
the note is presented as a theorem unless it is re-derived here or printed with its hypotheses.

---

## Appendix A — Reproduction

```
python3 verification/verify_claims.py          # 182 checks, all PASS
cat verification/verification_log.txt          # captured output used throughout this audit
```

## Appendix B — Notation

`d_A = dim H_A`; `Chan` = CPTP maps (the `1`-outcome slice); `Instr_n(A,B)` = `n`-outcome
instruments; `dim_aff` = affine dimension; `O(f)` = number of outcomes of `f`;
`F_E = (−⊗E)`; `R` a putative right adjoint; `ε` the counit; `η` the unit; `Φ` the adjunction
bijection. Choi convention: `J(ε) = Σ_k vec(K_k)vec(K_k)†`, `Tr_B J = I_A` for trace-preserving
`ε`; Schrödinger picture throughout.
