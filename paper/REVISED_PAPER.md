# The Opfibration Ontology: Quantum Instruments, Irreversibility, and the Epistemic Asymptote
### Revised manuscript (Rev. 2) — corrected theorem statements, complete proofs, scope and limits

> **Status of this document.** Rewritten replacement for `uploads/arrow_of_time_INSIGHT.pdf`,
> implementing every sustained finding of the adjudicated audit (`audits/00_ADJUDICATED_AUDIT.md`).
> Every numbered result below is either (a) proved here in full, (b) cited to a standard source, or
> (c) explicitly labelled as interpretation or as an open problem. Computational certificates:
> `verification/verify_claims.py` (111 checks, all passing). A claim-by-claim map from the original
> manuscript to this text is in `REVISION_CHANGELOG.md`.

---

## Abstract

We study the functor `F_E = (−⊗E)` on the category `Instr` of finite-outcome quantum instruments
(finite-dimensional, nonzero Hilbert spaces) and on its deterministic subcategory `Chan` of CPTP
maps. We prove, in two independent ways, that for every `dim E ≥ 2` the presheaf
`A ↦ Instr(A⊗E, B)` fails to be representable — for **every** object `B` — so `F_E` has no right
adjoint and the category is not monoidal closed. At `B = E` the failure is even stronger: no single
*slice* is representable, at any outcome number, and the slice proof is a two-line sandwich that needs
neither the grading nor the tensor. The sharper of the two proofs is three lines and
uses a single slice: at `B = E`, a right adjoint would force `d_R² = d_E⁴ − d_E² + 1` to be a perfect
square, which it never is because `(d_E²−1)² < d_E⁴ − d_E² + 1 < d_E⁴`. This also closes the gap in
the predecessor paper [1], whose Diophantine obstruction was a quantifier error rather than a false
equation: the equation has infinitely many solutions for special pairs `(d_B, d_E)` but cannot hold
for `B = E`. We show that the obstruction is the trace-preserving (causal) normalisation, not
irreversibility: the same functor has a right adjoint in the compact-closed category `CPM` of
completely positive maps, and it fails to have a *left* adjoint as well, so no left/right asymmetry
is exhibited. The identical obstruction holds for classical stochastic instruments, where the
grading-by-outcome-count machinery (rather than dimension arithmetic) is what does the work. We
correct the interpretation accordingly: the right adjoint would have been *currying* (an internal
hom / evaluation), not retrodiction; exact retrodiction is governed by a left-inverse theorem
(isometry channels), and prior-indexed Bayesian inversion is functorial once the prior is part of the
object. The "epistemic asymptote" of the original draft is replaced by an explicit scope-and-limits
section and a list of open problems. **Revision 2.3** also resolves those open problems: an appendix
proves, with every hypothesis displayed, that instruments that forget the record (§C.6–C.8),
instruments that merge nothing at all (§C.10), the dyadic quotients (§C.11–C.12) and the deterministic
category at every `B` with `d_B ≥ 2` (§C.2–C.3) are all non-representable, that `[E,B]` cannot be a
first-order quantum system, and that there is nonetheless a minimal *typed* completion of `Chan` in which
`(−⊗E)` does have a right adjoint, the internal hom being an affine slice of a state space of codimension
`d_E²−1` (§C.15–C.19). Seven residual gaps are kept explicitly open (§C.20, §7.2).

**Keywords.** Categorical quantum mechanics, quantum instruments, monoidal closure, causal
categories, normalisation, Petz recovery, Bayesian inversion.

---

## 1. Introduction

Tensoring with an environment is the canonical operation by which a closed description is promoted to
an open one. This paper asks the precise categorical question: does `(−⊗E)` have a right adjoint?
A right adjoint would supply, for every object `B`, an object `R(B)` and a natural bijection
`Instr(A⊗E, B) ≅ Instr(A, R(B))` — the universal "conditional instrument", i.e. **process currying**
for open systems.

**Results.** (i) For `dim E ≥ 2`, no such right adjoint exists, and in fact `Hom(−⊗E, B)` is not
representable for *any* `B` (Thm 4.3, Thm 4.8). (ii) The same holds in `Chan` (Thm 4.8), and — the
logical direction is worth stating carefully — an adjunction on `Instr` restricts to one on `Chan`,
so the deterministic statement *implies* the instrument statement (Prop. 4.9). (iii) `F_E` has no
left adjoint either (Thm 4.12), and `Instr` has neither a terminal nor an initial object (Prop. 4.13).
(iv) No single slice at `B = E` is representable, for any outcome number (Thm 4.6), and the parameters
at which the dimension count *can* be matched are classified exactly (Prop. 4.7).
(iv) The obstruction is exactly the trace-preserving normalisation, and it is not quantum: it holds
verbatim for classical stochastic instruments (Thm 5.2).

**Relation to [1].** The predecessor paper [1] obtained the deterministic obstruction for `Chan` via
an equation `d_R² = d_E²(d_B²−1)+1` whose integer solvability was asserted. In fact the equation has
infinitely many solutions — the family `(d_B, d_E, d_R) = (k, 2k, 2k²−1)` for every `k ≥ 1` — so no
statement of the form "this equation has no solutions" can be correct. The correct statement is a
**quantifier** statement: the dimension count must hold simultaneously for all `B`, and instantiating
`B = E` yields `d_R² = d_E⁴ − d_E² + 1`, which lies strictly between the consecutive squares
`(d_E²−1)²` and `d_E⁴`. This is Theorem 4.8 below; it closes the gap in three lines, and it is already
certified inside the author's companion verification suite [8] ("Chan no-right-adjoint:
`e⁴−e²+1` never a perfect square").

**Interpretation.** §6 states precisely what the missing right adjoint does and does not mean. It is
*not* an obstacle to retrodiction: the counit of a hypothetical adjunction points forward (it is
evaluation). Exact retrodiction of a channel is governed by the left-inverse theorem (Prop. 6.2), and
prior-indexed Bayesian inversion is functorial on pointed channels (Prop. 6.3). What the obstruction
does say is that the internal hom `[E,−]` is not a quantum system but a higher-order (comb-type)
object, and that channel spaces are not state spaces.

**Conventions.** Finite-dimensional, nonzero Hilbert spaces; `d_X = dim X ≥ 1`. Instruments are in
the Schrödinger picture; `Chan` is the `1`-outcome slice. Choi matrices satisfy `Tr_B J = I_A` for
trace-preserving maps. All proofs are elementary: linear algebra, convex geometry, and the grading of
outcome counts.

---

## 2. The category of quantum instruments (repaired foundations)

**Definition 2.1 (instrument).** An `n`-outcome instrument `A → B`, written
`ℰ = (ℰ₁,…,ℰₙ)`, is an `n`-tuple of completely positive maps `B(H_A) → B(H_B)` with
`Σᵢ ℰᵢ` trace-preserving. Equivalently, its Choi matrix is a positive semidefinite operator
`J_ℰ = Σᵢ |i⟩⟨i| ⊗ J_i` on `C^n ⊗ (H_A ⊗ H_B)` with `Σᵢ Tr_B J_i = I_A`.

**Definition 2.2 (Instr; outcome sets).** Objects: nonzero finite-dimensional Hilbert spaces.
Morphisms `A → B`: instruments, with outcome set `[n] = {1,…,n}` for some `n ≥ 1`. Composition of
`(ℰ_i)_{i∈[n]} : A → B` and `(ℱ_j)_{j∈[m]} : B → C` is the `nm`-outcome instrument with
component at the **lexicographic index** `(i−1)m + j`:

```
(ℱ ∘ ℰ)_{(i−1)m + j} = ℱ_j ∘ ℰ_i .
```

*This index convention is not cosmetic: the mixed-radix encoding makes composition strictly
associative and unital* — `((I×J)×K) → [nmk]` and `(I×(J×K)) → [nmk]` give the *same* order
(verified: `verification/verify_claims.py`, section I). With this convention the original manuscript's
Remark 2.1 can be deleted.

**Definition 2.3 (grading; `Chan`).** The hom-sets carry a grading `Instr(A,B) = ⊔_{n≥1} Instr_n(A,B)`
with `O(ℱ∘ℰ) = O(ℱ)·O(ℰ)` and `O(id_A) = 1`. The `1`-outcome slice is a wide subcategory, which we
call `Chan`: its morphisms are the CPTP maps.

**Definition 2.4 (tensor and unit).** `A ⊗ B` on objects; on morphisms
`(ℰ_i)_{i∈[n]} ⊗ (ℱ_j)_{j∈[m]}` has components `ℰ_i ⊗ ℱ_j` indexed by `[n]×[m] ≅ [nm]`. The unit is
`ℂ`. The interchange law holds up to the canonical relabelling of the fourfold outcome index (the
two sides order `[m]×[q]×[n]×[p]` differently); so `⊗` is *weakly* functorial as written, and becomes
strict after quotienting by relabellings of outcome sets (equivalently: work with finite **multisets**
of CP maps). Nothing below depends on this choice except Cor. 4.11, which is stated for the quotient
model. `F_E := (−⊗E)` is a **strict** endofunctor either way, because it does not touch outcome sets.

**Convention 2.5.** All objects have `d ≥ 1`; the zero-dimensional space is excluded (Prop. 3.1 would
return a negative dimension for it).

**Remark 2.6 (modelling choices, stated as such).** Outcome components may vanish and may repeat:
`{0, Φ}` and `{Φ/2, Φ/2}` are legitimate morphisms, and the grading counts them. This is a choice, and
it is exactly the choice that makes the counting argument of Lemma 4.1 work and that Def. 2.3 records.
Categories in which coincident components are identified, zero components are dropped, or outcomes are
merged (coarse-grained) are outside the scope of the graded theorems of §4; the model-independent
Theorem 4.6, and everything in §6, are unaffected. See Open Problem 7.1.

---

## 3. Affine geometry of the slices

**Proposition 3.1 (affine dimension).** For all `d_A, d_B ≥ 1` and `n ≥ 1`,

```
dim_aff Instr_n(A,B) = d_A² (n d_B² − 1).
```

*Proof.* Under Choi–Jamiołkowski, `Instr_n(A,B)` is the set of `n`-tuples `(J₁,…,Jₙ)` of PSD operators
on `H_A⊗H_B` with `Σᵢ Tr_B J_i = I_A`. The ambient real vector space `Herm(A⊗B)^n` has dimension
`n d_A² d_B²`. The map `(J_i) ↦ Σᵢ Tr_B J_i` is linear and surjective onto `Herm(A)` (dimension
`d_A²`): given `H ∈ Herm(A)`, the tuple with `J₁ = H ⊗ I_B/d_B` and `J_i = 0` otherwise maps to `H`.
Hence the fibre is an affine subspace of codimension `d_A²`. The tuple `J_i = I_A⊗I_B/(n d_B)` lies
in the fibre and is strictly positive (identity), so it is an interior point of the PSD cone, and the
feasible set has nonempty relative interior inside the affine subspace. Therefore intersecting with
the PSD cone changes nothing: `n d_A²d_B² − d_A² = d_A²(n d_B² − 1)`. ∎

*Certificates:* rank of the normalisation map equals `d_A²` for `d_A,d_B ≤ 3`, `n ≤ 4`; the interior
point is positive definite; the depolarising Choi matrix is positive definite
(`verification_log.txt`, section A). Note `dim_aff Chan(A,B) = d_A²(d_B² − 1)` (the case `n = 1`).

**Lemma 3.2 (affine dimension lemma).** Let `C` be a nonempty convex subset of a finite-dimensional
real vector space and `L` affine and injective on `C`. Then `L|aff(C)` is injective and
`dim aff C = dim aff L(C)`.

*Proof (affine independence).* Let `x₀,…,x_r ∈ C` be affinely independent, `r = dim aff C`. If their
images were affinely dependent, there would be scalars `λ_i`, not all zero, with `Σ_i λ_i = 0` and
`Σ_i λ_i L(x_i) = 0`. Separating positive and negative coefficients and normalising expresses this as
`L(x̂) = L(x̂′)` for two convex combinations `x̂, x̂′ ∈ C` (convexity is used here); injectivity gives
`x̂ = x̂′`, hence `Σ_i λ_i x_i = 0`, contradicting affine independence. So `L` carries affinely
independent families to affinely independent families and `dim aff C ≤ dim aff L(C)`; applying the
same to the affine inverse on `L(C)` gives equality. ∎

*Alternative proof (relative interiors), used implicitly in §4.3.* In finite dimensions `ri(C) ≠ ∅`.
If a nonzero `v ∈ ker(dL) ∩ dir(aff C)` existed, then for `x ∈ ri(C)` one has `x ± εv ∈ C` for small
`ε > 0` and `L(x+εv) = L(x)`, contradicting injectivity; hence `L|_{aff C}` is injective. The
companion article [13] states the affine-independence form, and the strictly positive point of
Prop. 3.1 is exactly what supplies `ri ≠ ∅` in applications.

*Remark 3.3.* The hypothesis is not decorative: on the non-convex set `{(t,t²)}` the map `(x,y) ↦ x`
is injective while dimension drops from 2 to 1 (section B of the verification log). In applications
below, convexity is automatic and `ri ≠ ∅` is supplied by Prop. 3.1's strictly positive point.

*Remark 3.4 (dimension is quotient-robust: semialgebraic dimension).* In the relabelling-quotient
(multiset) model of Def. 2.4 the slices are images of semialgebraic sets under the quotient map, hence
semialgebraic, and semialgebraic dimension is invariant under semialgebraic bijections. Since
`Φ⁻¹(g) = ε_B ∘ (g⊗id_E)` acts componentwise it descends to the quotient and is linear — hence
semialgebraic — on Choi space. The graded dimension comparison of §4.2 therefore survives the
quotient model as well as the tuple model, and §4.3 is independent of the model altogether. (Use of
semialgebraic dimension here was suggested by the meta-review; see `audits/00_ADJUDICATED_AUDIT.md`,
D5.)

---

## 4. The obstruction

### 4.1 The counit and the slice correspondence

**Lemma 4.1 (deterministic counit, two proofs).** Suppose `R` is right adjoint to `F_E` and let
`ε_B : R(B)⊗E → B` be the counit.

1. *(Triangle identity, minimal.)* The triangle identity `ε_{F(A)} ∘ F(η_A) = id_{F(A)}` gives
   `O(ε_{F(A)}) · O(η_A) = 1` in `(ℕ⁺,·)`, so `O(ε_B) = 1` for every `B ∈ im(F_E)`. In particular
   `O(ε_{A⊗E}) = 1` for all `A`, and `O(ε_E) = 1` since `E ≅ F_E(ℂ)`.
2. *(Counting, for all B.)* The inverse of the adjunction bijection is the standard
   `Φ⁻¹(g) = ε_B ∘ F_E(g)`. If `g` has `n` outcomes, `Φ⁻¹(g)` has `O(ε_B)·n` outcomes; surjectivity
   of `Φ⁻¹` therefore makes `O(ε_B)` divide the outcome count of *every* morphism `A⊗E → B`. A
   `1`-outcome morphism always exists (e.g. trace-and-prepare), so `O(ε_B) = 1`.

The same argument applied to a putative left adjoint's unit shows the unit is deterministic.

*Remark 4.2.* In the original draft this was the "prime argument". The primes are idle: what is used
is that `(ℕ⁺,·)` has no nontrivial units, and route 1 replaces the whole argument for the sharpest
statement by the triangle identity at `ℂ`.

### 4.2 The main theorem, per-`B` form

> **Theorem 4.3 (pointwise non-representability).** Let `d_E ≥ 2`. For every object `B`, there is no
> object `R(B)` with a natural bijection `Instr(A⊗E,B) ≅ Instr(A,R(B))`. Equivalently
> `Hom(−⊗E,B)` is not representable, for every `B`.

*Proof.* Fix `B` and suppose such `R(B)` exists; let `m = O(ε_B)`. By Lemma 4.1 the bijection maps
slice `n` onto slice `nm`; by the same linearity as in Prop. 3.1
(`Φ⁻¹(g) = ε_B ∘ (g⊗id_E)` is linear on Choi tuples, naturality, and Lemma 3.2) the affine dimensions
coincide:

```
d_A² (n d_{R(B)}² − 1)  =  d_A² d_E² (n m d_B² − 1)      for all n ≥ 1.
```

Cancel `d_A² ≠ 0` and compare coefficients of `n` and constants of the two affine functions of `n`:

```
(coefficient)          d_{R(B)}² = m d_E² d_B² ,
(constant term)        m d_E² = 1 .
```

The second equation is impossible for `d_E ≥ 2`, since `m ≥ 1` forces `m d_E² ≥ 4`. ∎

*Remark.* Neither `m = 1` nor any outcome-count restriction is needed: the intercept alone kills it.
This is the version certified by the author's companion "intercept engine" [8, group J].

*Remark 4.3b (where `Φ⁻¹(g) = ε_B ∘ F_E(g)` comes from).* It is naturality of the adjunction
bijection in the *source* variable together with the triangle identity: `ε_B = Φ(id_{R(B)})`, and
unwinding the naturality square gives `Φ⁻¹(g) = ε_B ∘ (g ⊗ id_E)`. This matters because the affine
structure used in Theorems 4.3 and 4.6 is *inherited* from that formula (it is linear on Choi
matrices, as verified in section A of the verification log) and not assumed: a bare bijection of
hom-sets carries no affine information at all, and any two non-singleton convex sets are in
bijection.

*Remark 4.4 (the representing dimension is a function of `B` alone).* `d_{R(B)}` cannot depend on `n`
or on `A`: one object must serve every source `A` and — for an adjunction — every slice. Hence two
slices (`n = 1, 2`) already over-determine the two unknowns `d_{R(B)}²` and `m d_E²`, and §4.3's
two-equation elimination is exactly the case `m = 1` of Theorem 4.3. No continuous parameter occurs
anywhere in the argument.

### 4.3 The sharp form: one slice, no grading

> **Theorem 4.5 (three-line form).** Let `d_E ≥ 2`. Then `Hom(−⊗E, E)` is not representable; in
> particular `F_E` has no right adjoint.

*Proof.* By Lemma 4.1(1), `O(ε_E) = 1`, so the bijection restricts to
`Instr₁(E,E) = Chan(E,E) ≅ Instr₁(ℂ,R(E)) = States(R(E))`. This map is affine (linear on Choi
matrices) and bijective; both sides are convex with nonempty relative interior (depolarising channel;
maximally mixed state). Lemma 3.2 gives

```
d_E² (d_E² − 1) = d_R² − 1 ,  i.e.  d_R² = d_E⁴ − d_E² + 1 .
```

But for `d_E ≥ 2`, `(d_E²−1)² = d_E⁴ − 2d_E² + 1 < d_E⁴ − d_E² + 1 < d_E⁴`, so the right-hand side
lies strictly between consecutive perfect squares and is never one. Contradiction. ∎

*Certificates:* `d_E⁴−d_E²+1` is not a square for `2 ≤ d_E < 200000` (exhaustive), and the sandwich
inequality is symbolic (`verification_log.txt`, section C).

*Why this form matters beyond brevity.* The proof uses only `n = 1` slices, which are *canonically*
identical in every model of instruments (a one-element family has no relabelling ambiguity, and
`Chan` is unambiguous). It is therefore unaffected by the strictification/quotient question of
Definition 2.4 — the theorem does not need the grading, the tensor, or the primes.

> **Theorem 4.6 (no slice at `B = E`, uniformly in `n`).** Let `d_E ≥ 2` and `n ≥ 1`. There is no
> object `G` with an affine bijection `Instr_n(A⊗E, E) ≅ Instr_n(A, G)` for all `A`.

*Proof.* Put `e = d_E²`, `g = d_G²`. Comparing affine dimensions (Prop. 3.1),
`d_A² (n e² − e) = d_A² (n g − 1)`, so `g = e² − (e−1)/n`. This is an integer only if `n | (e−1)`;
and since `0 < (e−1)/n ≤ e − 1 < 2e − 1`,

```
(e−1)² = e² − (2e−1)  <  e² − (e−1)/n  <  e² .
```

So `g` lies strictly between the consecutive squares `(e−1)²` and `e²` and is never a perfect square:
contradiction. ∎

*Remarks.* (i) The sandwich works for every `n` at once, so the theorem needs neither the graded slice
bookkeeping of Thm 4.3 nor the tensor; it strictly contains the adjointness statement, since a right
adjoint would supply exactly such a `G` for the slice `n = 1`. (ii) This is the companion article's
proposition "Pointwise obstruction at fixed outcome number" [13] specialised to `B = E`, where its
hypothesis `2 d_E d_B − 1 > (e−1)/n` is automatic (`2e − 1 > e − 1`); the two-line proof is reproduced
here for self-containedness. (iii) The `n = 1` case is certified in `verification_log.txt`, section C.

> **Proposition 4.7 (which parameters escape the dimension count).** Fix `d_E ≥ 2`, `n ≥ 1`, and an
> object `B`; put `e = d_E²`, `w = d_E d_B`, `c = (e−1)/n`. If some `G` satisfies
> `Instr_n(A⊗E,B) ≅ Instr_n(A,G)` affinely for all `A`, then
> **(i)** `n | (e−1)`, and **(ii)** `c = j(2w − j)` for some integer `j` with `1 ≤ j ≤ w − 1`,
> in which case necessarily `d_G = w − j`. Conversely, if (i) or (ii) fails there is no such `G`.

*Proof.* (i)–(ii) are immediate from `g = w² − c` with `g = (w − j)²` for some integer `j ≥ 0`
(Prop. 3.1 as in Thm 4.6); `j = 0` would give `c = 0`, which is excluded, so `j ≥ 1`, and then
`c = w² − (w−j)² = j(2w − j)`. ∎

*Examples.* **(a)** `n = 1` with `j = 1`: condition (ii) reads `d_E² − 1 = 2 d_E d_B − 1`, i.e.
`d_B = d_E/2` (`d_E` even), giving `d_G = d_E²/2 − 1`; the resulting family
`(d_B, d_E, d_G) = (k, 2k, 2k²−1)` is the Pell family, and for `n = 1` these are exactly the `j = 1`
escapes. This is the "accidental boundary family" of the companion article [13, check 6b], and
Theorem 4.6 shows it is confined to `d_B = d_E/2 < d_E`. **(b)** `B = E`: then `w = e` and
(ii) would need `c ≤ e − 1 < 2e − 1 ≤ j(2e − j)`, impossible — this is Theorem 4.6 again. **(c)**
`B = ℂ` (`w = d_E`): condition (ii) holds with `j = d_E − 1` and `d_G = 1` for every `d_E ≥ 2`, and
here the representation is **genuine but degenerate**: `Instr_1(A⊗E, ℂ)` and `Instr_1(A, ℂ)` are both
single points (the normalised trace), so the bijection exists trivially.
*Status.* Conditions (i)–(ii) are necessary, and they settle for every pair `(n,B)` whether the
dimension count *can* be matched: the escapes are exactly the `(n,B)` satisfying them. Whether a
non-degenerate escape (e.g. the Pell family, whose hom-sets are large) admits an `A`-natural family of
affine bijections is a finer question that no dimension count can answer — see Open Problem 7.2.

### 4.4 The deterministic case and the direction of implication

> **Theorem 4.8 (Chan).** For `d_E > 1`, `F_E = (−⊗E)` on `Chan` has no right adjoint. *Proof:* the
> computation of Thm 4.5 with `Chan` in place of `Instr`: `Chan(E,E) ≅ Chan(ℂ, R(E)) = States(R(E))`
> affinely, so `d_R² = d_E⁴ − d_E² + 1`, never a square. ∎
> *(Pointwise strengthening, where the dimension count escapes: Theorem C.2 shows `Chan(E,B)` is not
> affinely isomorphic to **any** state space for every `B` with `d_B ≥ 2` — the extreme-boundary
> dimension `2d_E²(d_B−1)` is larger than `2(R−1)` even when the total dimensions agree. See C.2–C.3.)*

> **Proposition 4.9 (reduction).** If `F_E` has a right adjoint on `Instr`, then `(−⊗E)` has a right
> adjoint on `Chan`. Consequently `Chan`-non-closure implies `Instr`-non-closure — the direction is
> *from deterministic to probabilistic*, not the reverse.

*Proof.* Let `R` be the right adjoint on `Instr`; by Lemma 4.1(2), `R` carries `1`-outcome morphisms
to `1`-outcome morphisms, and the bijection restricts to `Chan(A⊗E,B) ≅ Chan(A,R(B))`. Naturality is
inherited. Hence `R` restricts to a functor `Chan → Chan` right adjoint to `(−⊗E)| Chan`. ∎

*Remark 4.10.* "The instrument obstruction is strictly stronger than the deterministic one" is
therefore false as a statement about the two theorems (it is *implied by* the deterministic one).
What the instrument setting genuinely adds is the per-`B` statement of Thm 4.3, which the `B = E`
computation of Thm 4.8 does not give: in `Chan` there is no `n = 2` slice, and for Pell pairs
`(d_B,d_E,d_R) = (k,2k,2k²−1)` the `n = 1` count is satisfiable. That escape is nevertheless *not*
representable: Theorem C.2 rules out an affine isomorphism with any state space for every `B` with
`d_B ≥ 2`, and Prop. 4.9 lifts the conclusion to instruments (so §7.2(2) is closed; see C.3).

> **Corollary 4.11 (non-closure).** `Instr` (in the quotient model of Def. 2.4) is not monoidal
> closed: `−⊗E` has no right adjoint as soon as one object `E` with `d_E ≥ 2` exists. In fact
> `F_E` has a right adjoint **iff** `d_E = 1` (then `E ≅ ℂ` and `F_E ≅ Id`).

### 4.5 No left adjoint; no terminal or initial object

> **Theorem 4.12.** For `d_E ≥ 2`, `F_E` has no left adjoint — in `Chan` and in `Instr`.
>
> *Proof.* (`Chan`) `ℂ` is terminal: the trace is the unique CPTP map `X → ℂ`. Right adjoints preserve
> terminal objects, but `F_E(ℂ) = E` is not terminal, since `Chan(E,E)` contains `id` and the
> depolarising map (two distinct morphisms). (`Instr`) Suppose `G ⊣ F_E` with unit `η`. The mirror of
> Lemma 4.1(2): reading the bijection as `Φ(g) = F_E(g) ∘ η_A`, every morphism `h : A → B⊗E` satisfies
> `O(h) = O(η_A)·O(Φ⁻¹(h))`, and `1`-outcome morphisms exist, so `O(η_A) = 1` for every `A` and the
> bijection respects slices. Take `A = B = ℂ`: then
> `Instr₁(G(ℂ), ℂ) ≅ Instr₁(ℂ, E)`. The left side is `Chan(G(ℂ), ℂ)`, a single point (affine dimension
> `0`); the right side is the state space of `E` (affine dimension `d_E² − 1`). Hence `0 = d_E² − 1`
> and `d_E = 1`. ∎

> **Proposition 4.13.** `Instr` has no terminal object and no initial object.
>
> *Proof.* If `T` were terminal then `Instr(ℂ,T)` would be a single point; but for any object `X` with
> `d_X ≥ 2` there are at least two distinct `1`-outcome instruments `ℂ → X` (two states), so `d_T = 1`
> and `T ≅ ℂ`. Yet `Instr(ℂ,ℂ)` contains the distinct instruments `{1}` and `{½,½}`, contradiction.
> Dually for an initial object. ∎

*Interpretation (the categorical arrow).* The asymmetry standardly associated with causal order is
"`ℂ` is terminal but not initial" — a property of `Chan`, where the discard effect is unique while
states are manifold. Prop. 4.13 shows this asymmetry does **not** survive in `Instr`: with graded
outcomes neither universal property holds. This is the honest categorical location of any "arrow"
(see §5.4); the original draft's "fibre-level arrow" has no anchor in `Instr`.

### 4.6 The causal opfibration, constructed (replacing the original Cor. 4.3 and Figure 1)

The original draft asserted that "the missing right adjoint is the missing cartesian lift". Here is the
construction that makes that sentence precise, together with its exact hypothesis.

**Definition 4.14 (causal opfibration).** Let `(P, ≤)` be a poset of *stage extensions* with least
element `⊥`, and let `u ↦ E_u` assign to each `u : X → Y` in `P` a nonzero finite-dimensional space,
coherently: `E_{⊥} = ℂ` and `E_{v∘u} ≅ E_u ⊗ E_v` for composable `u : X → Y`, `v : Y → Z`. (Example:
`P = (ℕ, ≤)` with `E_m = E^{⊗m}`.) Define `𝒞` by: objects `(X, H)` with `X ∈ P` and `H` a nonzero
finite-dimensional space; a morphism `(X,H) → (Y,K)` is a pair `(u, f)` with `u : X → Y` and `f : H⊗E_u → K`
an instrument; composition is `(v,g) ∘ (u,f) = (v∘u, g ∘ (f ⊗ id_{E_v}))` using the coherence
isomorphism; identities are `(id_X, id_H)`. The projection is `p(X,H) = X`.

> **Theorem 4.15.** (1) `p : 𝒞 → P` is an opfibration, and the cocartesian lift of `u : X → Y` at
> `(X,H)` is `(Y, H⊗E_u)` with the identity instrument. (2) Every fibre is `Instr`: `p⁻¹(X) ≅ Instr`
> for all `X` — literally the same category, since the only data in a fibre is a Hilbert space.
> (3) The reindexing functor is `u_! = (−⊗E_u)`. (4) Therefore (standard; Jacobs, *Categorical Logic
> and Type Theory*, Ch. 9) `p` is a **bifibration** iff every `u_!` has a right adjoint, i.e. **iff
> `E_u ≅ ℂ` for every `u`**; and the cartesian lift of `u` at `(Y,K)` is `(X, u_*(K))` with the missing
> `u_* : Instr → Instr` given by the non-existent internal hom `[E_u, −]`.

*Proof.* (1) Given `(u,f) : (X,H) → (Y,K)`, the morphism `(u,id_{H⊗E_u}) : (X,H) → (Y,H⊗E_u)` is a
lift of `u`, and every `(u,f)` factors as `(id_Y,f) ∘ (u,id_{H⊗E_u})`; uniqueness gives cocartesianity.
(2) A morphism over `id_X` is an instrument `H → K` (with `E_{id} = ℂ`), and vertical composition is
instrument composition. (3) is the defining formula. (4) The standard bifibration criterion plus
Thm 4.3/4.8, since `F_{E_u} = (−⊗E_u)` has a right adjoint iff `d_{E_u} = 1`. ∎

*Remark 4.16 (what the opfibration does and does not say).* (i) All fibres being `Instr`, the
opfibration is `P × Instr` twisted by the environment assignment; "fibre-level dynamics" is therefore
not additional structure, and the original figure's `Instr(A)`, `Instr(A⊗E)` annotations were
ill-typed (there is no fibre `Instr(A)`; a fibre is the whole category). (ii) The bifibration property
is a property of the *environment assignment* `u ↦ E_u`, not of the dynamics: a completely reversible
dynamics with trivial extensions is a bifibration, and a bifibration may contain irreversible
morphisms in its fibres. So the original Cor. 4.3's reading — that the missing cartesian lift is "the formal
signature of irreversibility" — is precisely inverted. (iii) The base direction is the *extension
relation* among stages, not a temporal order; the original "Past/Future" labels have no model here.
(iv) The honest content of the original Cor. 4.3, stated with all hypotheses, is: *if* a poset of stage extensions
is fixed, *then* the associated opfibration is a bifibration iff every extension is trivial
(`E_u ≅ ℂ`) — and by Thm 4.3/4.8 it is never a bifibration over a poset containing a nontrivial
extension. Figure: `figures/causal_opfibration.svg`.

---

## 5. What the obstruction is, and what it is not

### 5.1 It is the normalisation (causality), not irreversibility

**Proposition 5.1 (CPM comparison).** In `CPM(FHilb)` (CP maps, Selinger [7]) the functor `−⊗E` has
the right adjoint `E*⊗−`: the category is compact closed. Passing to trace-preserving maps costs
`d_A²d_E²` affine dimensions on the left hom-space and only `d_A²` on the right:

```
CPM(A⊗E,B)          : d_A²d_E²d_B² − d_A²d_E² = d_A²d_E²(d_B² − 1)
CPM(A, E*⊗B)        : d_A²d_E²d_B² − d_A²     = d_A²(d_E²d_B² − 1)
difference          : d_A²(d_E² − 1)            (= the "intercept")
```

Example `(d_A,d_E,d_B) = (2,2,3)`: `128` vs `140`. So the obstruction is precisely the mismatch of
causal normalisation constraints, i.e. the uniqueness of the discard/unit effect. Two consequences:

* adjointness is **not** a signature of irreversibility (`CPM` has the adjoint and contains the trace);
* a fortiori it cannot be a signature of *time direction* (see Prop. 5.5).

### 5.2 Non-quantum: the classical analogue

**Theorem 5.2 (classical instruments).** Let `Instr^cl` be finite-outcome classical instruments
(families of sub-stochastic matrices summing to a stochastic matrix). Then
`dim_aff Instr^cl_n(X,Y) = |X|(n|Y| − 1)`, and for `|E| ≥ 2` no object represents `Hom(−×E, B)`;
the obstruction is identical, with no quantum input.

*Proof.* Same as Thm 4.3 with `|·|` in place of `d_·²`, and `m|E| = 1` as the intercept equation. ∎

**Proposition 5.3 (quantum vs classical threshold — why the grading engine is needed).** In the
quantum case, `n = 1` with `B = E` already suffices (Thm 4.5), because `d_E⁴−d_E²+1` must be a square.
Classically, `n = 1` is *satisfiable*: `|R| = |E||B| − |E| + 1`, e.g. `|E| = |B| = 2 ⇒ |R| = 3`. The
contradiction appears only when the `n = 1` and `n = 2` slices are compared. Hence the graded
intercept engine — the one genuinely load-bearing part of the original draft's machinery — is exactly
what transports the result to the classical (and hence non-quantum) setting. Certificates: section G
of the verification log; vertex-count refinement `|B|^{|E|} > |E|(|B|−1)+1` (section G).

### 5.3 Reversible and irreversible tests

**Proposition 5.4.** On the groupoid of Hilbert spaces and unitaries, `−⊗E` has no right adjoint as
soon as `d_E ∤ d_B` (the left hom-set is then empty, while `U(A,R(B)) ⊇ {id}` for all `A`). This is a
purely arithmetic failure in a category where every morphism is invertible.

**Proposition 5.5.** In `Chan`, `ℂ` is terminal but not initial (`Chan(ℂ,X)` = states of `X`, a convex
set of dimension `d_X²−1 ≥ 0`, with `≥ 2` elements for `d_X ≥ 2`). `Chan ≠ Chan^op`: this is the one
categorical asymmetry that survives the tests above, and it is a property of the *category*, not of
`F_E`. It is the Coecke–Lal causality axiom territory; the physical reading is "discarding is unique,
preparation is not".

### 5.4 The defect, quantified (and why the "best" object still fails)

> **Proposition 5.6 (defect).** Let `d_E ≥ 2`, `e = d_E²`, `v = d_B²`, and let `r = d_R²` be any
> integer. Put `δ_n := e(nv − 1) − (n r − 1)`, the dimension the `E`-side hom-set has over the
> `R`-side's at slice `n`. Then
>
> 1. `δ_n = n(ev − r) + (1 − e)` is affine in `n` with constant term `−(e−1)`;
> 2. `δ_n ≡ 0` is impossible for `e ≥ 2` (slope and intercept cannot vanish together — this is
>    Thm 4.3 in other words);
> 3. `min_r max_{n≥1} |δ_n| = e − 1`, attained exactly at `r = ev`, i.e. at `d_R = d_E d_B`, where
>    `δ_n = −(e−1)` **for every `n`**;
> 4. if the `n = 1` count is matched (a Diophantine escape, `r = e(v−1)+1`), then
>    `δ_2 = e − 1`: escaping at `n = 1` costs exactly the intercept at `n = 2`.

*Proof.* (1) is expansion. (2) requires `ev = r` and `1 = e`. (3) If `r ≠ ev` then `|δ_n| → ∞`, so
only `r = ev` is admissible, where `δ_n = 1 − e` for all `n`. (4) Substitute `r = e(v−1)+1`:
`δ_2 = 2(ev − e(v−1) − 1) + 1 − e = 2(e−1) + 1 − e = e − 1`. ∎

The value `d_R = d_E d_B` in (3) is exactly the compact-closed answer `R(B) = E*⊗B` of Prop. 5.1, and
the constant defect `d_E² − 1` is exactly the normalisation mismatch computed there: the two
explanations of the obstruction are the same number seen from the graded side and from the CPM side.
Item (4) explains the companion's observation that the dimension-count escapes occur only at the
boundary `d_B = d_E/2` and fail immediately at `n = 2`; it is the quantitative form of the "missing
dimension" proposal made by the third analysis [sonnet3, E6]. The companion's no-programming battery
[8, group C] is the analogous quantitative statement for universal processors; whether `δ_n` admits a
no-programming (Nielsen–Chuang) interpretation is left open, together with Open Problem 7.2.

> **Corollary 5.7 (no state-space or ensemble structure at `B = E`).** For `d_E ≥ 2` and every
> `n ≥ 1`, `Instr_n(E,E)` is not affinely isomorphic to any `n`-outcome ensemble space
> `Instr_n(ℂ, R)`; in particular `Chan(E,E)` is not affinely isomorphic to the state space of any
> system.

*Proof.* Setting affine dimensions equal (take `A = ℂ` in Thm 4.6, i.e. `d_A = 1`) gives
`n d_R² − 1 = d_E²(n d_E² − 1)`, that is

```
d_R² = d_E⁴ − (d_E² − 1)/n .
```

For every `n ≥ 1`, `0 < (d_E²−1)/n ≤ d_E² − 1 < 2d_E² − 1`, so `(d_E²−1)² < d_R² < d_E⁴`: the value
lies strictly between consecutive squares and is never a perfect square. Hence no `R` exists. ∎
This is Theorem 4.6 with `A = ℂ`; it is the precise form of the statement that *channel spaces are not
state spaces*.

*Remark 5.8 (the right fibred picture for outcome dependence).* The forgetful ("total map") functor
`Σ : Instr → Chan`, `Σ({ℰ_i}) = Σ_i ℰ_i`, is functorial, identity-preserving and commutes with
`−⊗E`; its fibres are the instruments refining a given channel, which is where outcome-set dependence
genuinely lives. (The original draft's "base causal poset" was the wrong base: the useful base for
outcome dependence is `Chan` under `Σ`.) The companion's multiset-quotient study [8, groups M and O]
records that the induced comparison on the multiset quotient is a natural split mono which fails to be
surjective and excludes one-outcome units, with the multi-outcome case classified open.

### 5.5 Interpretation (labelled)

*What is proved:* `Hom(−⊗E, B)` is not representable; the would-be internal hom is not a quantum
system.
*What follows (must be argued, not asserted):* `[E,B]` is a higher-order object — a convex set of
combs/supermaps (Chiribella–D'Ariano–Perinotti; Kissinger–Uijlen) — and closure is recovered in those
higher-order completions at the price of fixing a causal structure. Making this precise is Open
Problem 7.4; the closest external framework is the semicartesian monoidal structure of CPTP, whose unit
is terminal (discarding is unique — the Coecke–Lal causality axiom), under which the present result
says that this semicartesian structure is not closed once environments are tracked at the instrument
level. External priority for the specific statement was not established by this revision; a full
literature search remains to be done.
*What does not follow:* irreversibility of dynamics, an arrow of time, apparatus-dependence of
retrodiction, non-existence of recovery maps. Sections 5.1–5.3 and §6 are the evidence.

*Priorities.* The affine-dimension lemma, the no-left-adjoint statement, the classical analogue and the
normalisation/intercept explanation are already proved in the author's companion articles [8,13] — the
latter names the phenomenon the "Normalization-Defect (Intercept) Principle", and the affine-dimension
formula for instrument bodies is used in a companion submission as well. The present paper's
independent contributions are the *instrument-level* per-`B` theorem (Thm 4.3), its uniform-in-`n`
sharpening at `B = E` (Thm 4.6), the escape classification (Prop. 4.7), the defect invariant
(Prop. 5.6), and the audit-corrected interpretation.

---

## 6. Retrodiction, done properly

### 6.1 The right adjoint is currying, not retrodiction

A right adjoint would give `Instr(A⊗E,B) ≅ Instr(A,[E,B])`: an object representing "B conditioned on
E". Its counit `ε_B : [E,B]⊗E → B` is **evaluation** and points *forward* (into `B`); it cannot be a
map "from a measured outcome on `B` back to a history". The original draft's identification of the
missing adjoint with retrodiction (and with Petz/Bayesian/process-matrix methods) is unsupported;
[4] in particular is about indefinite causal order, not retrodiction. Nor is the theorem a statement
about invertibility of individual channels: unitary channels are invertible *inside* `Instr`
(`U ⊗ id_E` has the one-outcome instrument `U† ⊗ id_E` as an inverse), and Petz recovery maps exist for
every channel and reference state. The missing object is the internal hom, and nothing else.

### 6.2 Exact retrodiction is a left-inverse theorem

**Proposition 6.1 (standard; Petz [2], Knill–Laflamme).** A CPTP map `N : A → B` admits a CPTP map
`R : B → A` with `R ∘ N = id_A` **iff** `N(ρ) = V ρ V†` for an isometry `V : H_A → H_B`.

*Sketch.* (⇐) `V† ∘ V = I`. (⇒) `R∘N = id` implies no information leaves the system: the
complementary channel of `N` is constant, which is the Knill–Laflamme condition with the whole space
as code; equivalently, `N` is a channel of Choi rank `d_A` with orthogonal complement determined, and
one recovers `N = V·V†`. (The author's companion suite certifies the square case numerically:
"recoverable square channel is unitary".) ∎

*Corollary.* Irreversibility is graded and quantitative, not a yes/no categorical property: the right
measures are Petz recovery fidelity, approximate-recovery bounds, and the entropy-production
quantity `D(ρ‖σ) − D(Nρ‖Nσ)`. The paper's claim that a missing adjoint is "the formal signature of
open-system irreversibility in all its forms" is replaced by: *the missing adjoint is the failure of
the internal hom to be a system; irreversibility is measured by recoverability.*

### 6.3 Prior-indexed retrodiction is functorial

**Proposition 6.2 (Cho–Jacobs; Leifer–Spekkens; Parzygnat–Russo).** Bayesian inversion is a
well-defined, functorial operation on the category of *pointed* channels `(A,σ) → (B,Nσ)`; it is
dagger-like and prior-dependent. Hence "retrodiction requires a prior" is a statement about the
correct domain of definition (the prior is part of the object, and in the fibred picture it is the
base), not a defect exposed by `F_E`. In particular the original draft's conflation of *prior*,
*apparatus* and *outcome set* into one "apparatus-dependence" is dissolved: only the prior is
intrinsic to inversion.

### 6.4 The defensible one-sentence reading

> Channel spaces are not state spaces, and `[E,B]` is a comb-type convex object, not a system; this is
> why currying an environment into a system cannot be represented internally — and it holds for
> classical, quantum, reversible and irreversible dynamics alike.

---

## 7. Scope, limits, and open problems (replacing the "epistemic asymptote")

### 7.1 Hypotheses actually used, and counter-models where they are dropped

| Hypothesis | Used where | Dropped ⇒ |
|---|---|---|
| finite dimension, `d ≥ 1` | Prop. 3.1, all dimension counts | infinite dimensions: affine dimensions are infinite, counting is vacuous |
| finite outcome sets + multiplicative grading | Thm 4.3 (per-`B`), Prop. 4.9, Thm 5.2 | measurable/infinite outcomes: `|I×M| = |I|` and divisibility disappears |
| trace-preserving normalisation | everywhere | `CPM`: the right adjoint exists (Prop. 5.1) |
| rigid outcome labels (no coarse-graining) | Thm 4.3's grading step | quotient categories: see Open Problem 7.1 |
| nonzero objects | Prop. 3.1's positivity | `d = 0`: empty hom-sets, formula meaningless |

### 7.2 Open problems (status after Revisions 2.2–2.3)

Each item is marked **closed**, **closed under hypotheses**, or **open**, with a pointer to the proof in
Appendix C and to the machine checks in `verification/` (section L). The adjudication of the source
note that these resolutions rest on is `audits/05_OPEN_PROBLEMS_SOURCE_EVAL.md`.

1. **Coarse-graining quotient — closed.** The obstruction survives forgetting the outcome grading. For
   `Hom_cg` (proportional components identified, recorded mixing) Theorem C.8 gives a quadrilateral face
   — `P_T = {c ≥ 0 : Σc_l = 4, Σβ_lc_l = 0}`, β = (1,−1,2,−2), with vertices `e₁₂, e₃₄, e₁₄, e₂₃` and the
   exact identity `½e₁₂ ⊕ ½e₃₄ = ¼e₃₄ ⊕ ⅜e₁₄ ⊕ ⅜e₂₃` — which no simplex of measures can match;
   preparations are simplicial, measurements are not (C.9). This holds for **any** `B` (including `ℂ`),
   **any** `R` (separable or not) and finite **or countably supported** outcomes (Lemma C.7). For the
   no-merging model `Instr_0` the contradiction is even literal (Theorem C.10, the pair-sum example);
   for the infinite-merge dyadic quotient `D^ω` it is Proposition C.11; for the finite-outcome dyadic
   and rational quotients it is the rigidity theorem C.12. *Hypotheses:* for `Instr_D`/`Instr_Q` the
   counit must have finitely many outcomes; for measurable (uncountable) outcome sets see gap R2.
2. **Dimension escapes and representability — closed.** By Theorem C.2, `Chan(E,B)` is not affinely
   isomorphic to the normal state space of any `B(H_R)`, finite- or infinite-dimensional, separable or
   not, as soon as `d_E, d_B ≥ 2`; the same pair of invariants (dimension and extreme-set dimension)
   rules out finite-dimensional direct sums (C.3(ii)). Since an instrument representation restricts to a
   `Chan` representation (Prop. 4.9), no dimension escape of §4's count — the Pell family
   `(d_B,d_E,d_R) = (k,2k,2k²−1)` included, which is exactly the boundary `d_B = d_E/2` — is
   representable at the deterministic level, hence none is representable at the instrument level. *What
   is not excluded:* affine **embeddings** into state spaces (C.2, closing remark). The instrument-level
   content is concentrated at `B = ℂ` (C.4), where it is supplied by C.8/C.10/C.12.
3. **Infinite-dimensional and measurable-outcome versions — closed under hypotheses; two gaps left
   open.** Record-forgetting gives a uniform no-right-adjoint theorem (Theorem C.5) whose only
   hypothesis on the register is *finite-dimensional or separable* — and separability is essential:
   a non-separable register admits a lookup-table processor whose response map is not injective
   (checked: L11), so counting arguments stop there (C.13(c)). The `Chan` and `cg` results (C.2, C.8)
   hold in any dimension without extra hypotheses. **Open:** R2 (measurable/uncountable outcome sets
   for `cg`: the quotient must be defined modulo label-forgetting and the disintegration check is not
   done) and R3 (non-normal states beyond finite-dimensional `E`). The source note's infinite-dimensional
   theorems `Thm 5`/`Thm 7` (Arveson-based) are **not** re-derived here and are not used (R4).
4. **Higher-order completions — resolved constructively (first-order environments).** Appendix C.15–C.18
   constructs the typed category `𝒯` (affine slices of trace-one Hermitians) and proves
   `−⊗E ⊣ [E,−]` for every **first-order** `E` (Theorem C.16), with `(E0): ev(C(f)⊗Y) = f(Y)` as the
   engine. The internal hom is a typed system, not a first-order one, and its intercept is exactly the
   codimension `d_E²−1` of Prop. 3.1 (Cor. C.17); instruments are recovered at grade `n` by the
   block-diagonal types `𝔅_n` (Prop. C.18). The counit is Bell post-selection: a morphism of `𝒯`,
   trace-preserving **on the admissible slice** (exact), with a non-zero, example-dependent trace defect
   off it (computed: L17a/L17b) — it is *not* a trace-preserving map of state spaces (C.19). **Open:**
   R5 (agreement of the affine-span tensor with the double-orthogonal/comb closure of
   `Caus[CPM(FHilb)]`, and maximality of `𝒯`).
5. **Graded instruments — closed in `𝒯`, and independently by the grading argument.** Prop. C.18 and
   §4.4.
6. **Formal verification — extended, still partial.** Prop. 3.1, Lemma 3.2, Thms 4.3–4.6, Props.
   4.7/5.6, and now Cor. C.3, Thm. C.8, Thm. C.10, Thm. C.12, Thm. C.16 are Lean-sized; the arithmetic
   certificates, the exact quadrilateral, the Kraus strata, the (E0) identities and the finite instances
   of C.5/C.11 are machine-checked (`verification/verify_claims.py`, section L). R7.
7. **Residual gaps (collected in C.20).** R1 finitary `D` with `dim E = ∞`, non-separable `R` and
   infinite counit; R2 measurable outcomes; R3 non-normal states; R4 the source note's
   infinite-dimensional sketches; R5 `𝒯` vs `Caus[CPM]`; R6 the note's face-of-dimension-2 invariant;
   R7 proof-assistant formalisation.

### 7.3 What this section replaces

The original §6 promised to "formalize" an "epistemic asymptote" without definitions, admitted that
the claim could not be proved, and was then contradicted by §7's "the deductive content is now fully
extracted". The items in §7.2 are exactly the further mathematics that was available; the taxonomy of
"repetition / semantic extrapolation / syntactic interpolation" is retained only as an editorial
reminder — applied to this text, it forbids the original §§5–6 as written.

---

## 8. Conclusion

For `dim E ≥ 2`, tensoring with `E` has no right adjoint in the category of quantum instruments (nor
in the deterministic subcategory), the presheaf `Hom(−⊗E,B)` is never representable, and neither
adjoint exists; the obstruction is the normalisation imposed by trace preservation, it is insensitive
to whether the dynamics is reversible or quantum, and it is captured at a single slice by the fact
that `d_E⁴ − d_E² + 1` is never a perfect square. The missing object is a curried process — a
higher-order, comb-type convex object — not a retrodiction apparatus. Exact retrodiction is instead
governed by the isometry/recoverability theorem, and prior-indexed inversion is functorial on pointed
channels. The corrected theory is smaller, sharper, and entirely elementary.

---

## References (corrected)

1. A. Abaee, *The Opfibration Ontology: Separating Causal Order from Quantum Irreversibility*,
   manuscript, 2026. — **Note (audit finding D13):** the DOI printed in the original draft
   (`10.5281/zenodo.20860298`) resolves to the **software** record *"MIKEAA2020/opfibration-supplement:
   Initial supplementary simulation"* (Zenodo record 20860299, 2026-06-25, MIT). Either cite the
   manuscript by its own DOI/repository, or cite the supplement as software [8] and refer to the
   manuscript separately.
2. D. Petz, *Sufficiency of channels over von Neumann algebras*, Quart. J. Math. Oxford **39**, 97
   (1988).
3. B. Coecke and R. W. Spekkens, *Picturing classical and quantum Bayesian inference*, Synthese
   **186**(3), 651–696 (2012). DOI 10.1007/s11229-011-9917-5. *(Corrects "194, 3185 (2017)".)*
4. O. Oreshkov, F. Costa, C. Brukner, *Quantum correlations with no causal order*, Nature Commun.
   **3**, 1092 (2012). *(Process matrices / indefinite causal order — not retrodiction.)*
5. E. B. Davies, J. T. Lewis, *An operational approach to quantum probability*, Commun. Math. Phys.
   **17**, 239 (1970). *(Cite at Def. 2.1 and in §5.2.)*
6. M. Ozawa, *Quantum measuring processes of continuous observables*, J. Math. Phys. **25**, 79
   (1984). *(Cite at Def. 2.1: continuous outcomes are outside the finite-outcome scope.)*
7. P. Selinger, *Dagger compact closed categories and completely positive maps*, Electron. Notes
   Theor. Comput. Sci. **170**, 139 (2007). *(Decisive for Prop. 5.1.)*
8. A. Abaee, *No Universal Process Currying: The Intercept Principle, Environmental Currying, and
   Finite-Dimensional Obstructions to Exact Process Storage, Evaluation, and Recovery*, companion
   manuscript with verification suite `verify_abaee_currying.py` (73 checks), repository
   `github.com/MIKEAA2020/opfibration-merged-`; and the Zenodo software record 20860299 (2026).
   *(Contains, independently: the square-gap `e⁴−e²+1`, the intercept engine, the FinStoch vertex
   mismatch, the multiset-quotient partial results.)*
9. E. Knill, R. Laflamme, *Theory of quantum error-correcting codes*, Phys. Rev. A **55**, 900 (1997).
   *(Exact-recovery characterisation of Prop. 6.1.)*
10. K. Cho, B. Jacobs, *Disintegration and Bayesian inversion via string diagrams*, Math. Struct.
    Comput. Sci. **29**(7) (2019); M. S. Leifer, R. W. Spekkens, Phys. Rev. A **88**, 052130 (2013);
    A. Parzygnat, A. Russo, *Bayesian inversion and the conditional expectation* (2022). *(Pointed
    channels, Prop. 6.2 — cite after checking final bibliographic details.)*
11. B. Coecke, R. Lal, *Categorical quantum mechanics* (Handbook of Quantum Logic, 2012);
    A. Kissinger, S. Uijlen, *A categorical semantics for causal structure*, LICS 2017.
    *(Causality axioms; §5.4, Prop. 5.5.)*
12. G. Chiribella, G. M. D'Ariano, P. Perinotti, *Quantum circuit architecture*, PRL **101**, 060401
    (2008). *(Combs; §5.4.)*
13. A. Abaee, *Quantum Combs, Higher-Order Processes, and the Normalization-Defect (Intercept)
    Principle*, with numerical supplement `verification_checks.py` (checks 1a–6b), repository
    `github.com/MIKEAA2020/Quantum-combs`. *(Contains, independently: the affine-dimension lemma
    under affine bijection, no-right- and no-left-adjoint theorems for environment decoration, the
    classical `FinStoch` proposition (dimension + vertex count), the "parallel tensor is not closed"
    corollary, the pointwise obstruction at fixed outcome number with its boundary/escape analysis,
    and the e²−e+1 sandwich.)*
14. M. Huot, S. Staton, *Universal properties in quantum theory*, QPL 2018; B. Coecke, R. Lal,
    *Categorical quantum mechanics* (Handbook of Quantum Logic, 2012). *(CPTP is semicartesian
    monoidal with terminal unit — the causal/discard asymmetry used in §5.5.)*
15. *Working note on the four open problems of §7.2* (unpublished; supplied with this revision as
    `uploads/sonnet time open problems.txt`, machine-generated and human-edited). Its results are
    adjudicated in `audits/05_OPEN_PROBLEMS_SOURCE_EVAL.md` and re-proved, with the hypotheses and the
    residual gaps made explicit, in Appendix C of this revision; nothing is cited from it as authority.
    Related literature used there: W. Arveson, *Subalgebras of C\*-algebras*, Acta Math. **123**, 141
    (1969) (extremality criterion, recorded as unchecked here); M. A. Nielsen, I. L. Chuang, *Programmable
    quantum gates*, Phys. Rev. Lett. **79**, 321 (1997) (no-programming, the model for Theorem C.5);
    A. Kissinger, S. Uijlen, *A categorical semantics for causal structure*, LICS 2017 (Caus[CPM];
    the closing remark of §C.19).

---

## Appendix A — Computational certificates

All claims tagged "(verified)", "(certificate)" or "(section X of the verification log)" are produced
by `verification/verify_claims.py`; the full transcript is `verification/verification_log.txt`
(**182 checks, 0 failures**). Highlights: rank computations for Prop. 3.1; the affine-dimension
lemma's mechanism and its necessity; the square-gap over `d_E < 200000` and symbolically; the
`d_E<400, d_B<60` box reproducing exactly 70 nontrivial solutions; the general-`m` collapse
`m d_E² = 1`; the classical threshold contrast; the CPM bookkeeping (128 vs 140); the lexicographic
strictification (composition associative; interchange only up to a permutation).

For Appendix C the same suite provides, in its section **L**: the exact quadrilateral of Thm. C.8
(all basic feasible solutions, four vertices, each outside the triangle of the other three, exact
rational weights `½,½` and `¼,⅜,⅜`); the pair-sum example of Thm. C.10 (exact, literal multiset
identity); the Kraus strata `2Nr−r²−d_E²` with the submersion rank `d_E²` (and the one empty stratum
identified), the escape table of (C.2) `32/12, 384/60, 4900/196`, and the two-algebra proof that
`R = d_E²(d_B−1)+1` forces `d_E = 1` (exhaustive search `d_E, d_B ≤ 60`, `R ≤ 400`, plus a
symbolic factorisation), together with the
direct-sum search of Cor. C.3(ii); the same equation's escape at `d_B = d_E/2` (the Pell boundary,
`d_V² = (2k²−1)²`) which is why C.2, not the dimension count, is used for general `B`; the cg count
`(d_E²d_B)² − (d_E²−1)` sandwiched strictly between consecutive squares; the finitary dyadic moves and
the equal-merge non-congruence; the ℚ-quadrilateral; the `(E0)` evaluation identity and Choi linearity
`(id⊗k)C(f) = C(k∘f)`; Lemma C.14's rank `(m−1)d_E²+1` (13 with `dim R = 4`, 21 with `dim R = 5`,
capped at 9 with `dim R = 3`); the genericity lemma's kernels for `k = 5,6,7` (qubit) and
`d_E = 3`; the `D^ω` orbit weights; and the Bell-slice trace (exactly 1 on the admissible slice,
`1.072/0.989/1.011` for three random off-slice examples).

## Appendix B — Map from the original draft

See `REVISION_CHANGELOG.md`: every claim of the original manuscript is listed with its verdict
(verified / corrected / deleted / re-labelled as interpretation), together with the audit finding that
drove the change.

---

## Appendix C — The open problems of §7.2: statements, proofs, and residual gaps

This appendix carries the mathematics that resolves the open problems of §7.2. The results are due to
an unpublished working note supplied with this revision [15]; every statement below has been re-derived
and machine-checked here (`verification/verify_claims.py`, section **L**, checks L1–L20; see
`audits/05_OPEN_PROBLEMS_SOURCE_EVAL.md` for the claim-by-claim adjudication), and the proofs are folded
in so that this revision is self-contained. Each result is printed with its hypotheses and with the
class of objects it rules out; residual gaps are collected in C.20 and in §7.2.

**Conventions.** `E, B, A, R` are nonzero Hilbert spaces, `d_X = dim X`; unless a statement says
otherwise, `E`, `B`, `A` are finite-dimensional (statements allowing infinite-dimensional `B` or `R` say
so explicitly); `Chan`,
`Instr_n`, `State` as in §2–§3. `Chan(E,B)` is identified with the set of Choi operators
`{J ≥ 0 : Tr_B J = 1_E}` of dimension `d_E²(d_B²−1)` (Prop. 3.1 at `n = 1`). `M_r ⊂ Chan(E,B)` is the
subset of Choi rank `≤ r`. "Representable" means: there is an object `R` and a counit
`ε_B ∈ Instr(R⊗B, B)` (per `B`) such that `g ↦ ε_B ∘ (g ⊗ id_E)` is a bijection
`Instr(A⊗E,B) → Instr(A, R(B))` for every `A` — the slicing form of `F_E ⊣ R` (Def. 4.6, Lemma 4.1).
Dimension of a semialgebraic set means the maximum of its local (real) dimensions; it is a
homeomorphism invariant, which is all that is used below.

### C.1 The overlap identity

> **Lemma C.1.** Let `R, E, B, G` be Hilbert spaces, `W: R⊗E → B⊗G` an isometry, and write
> `W = Σ_r |r⟩ ⊗ W_r` with `W_r : E → B⊗G` (so that `W_r†W_{r'} = δ_{rr'} 1_E`). For `ψ ∈ R` put
> `Λ_ψ := Σ_r ψ_r W_r : E → B⊗G`. Then for all `ψ, ψ'`:
> - (i) `Λ_ψ† Λ_ψ' = ⟨ψ|ψ'⟩ · 1_E`;
> - (ii) for any orthonormal families `{e_i} ⊂ G`, `{e'_l} ⊂ G` and `K_i := (1_B⊗⟨e_i|)Λ_ψ`,
>   `K'_l := (1_B⊗⟨e'_l|)Λ_ψ'`, one has `Σ_{il} ⟨e_i|e'_l⟩ K_i† K'_l = ⟨ψ|ψ'⟩ · 1_E`.
> In particular `⟨ψ|ψ'⟩ ≠ 0` implies `1_E ∈ span{K_i†K'_l}`.

*Proof.* (i) `Λ_ψ†Λ_ψ' = Σ_{rr'} ψ̄_r ψ'_{r'} W_r†W_{r'} = (Σ_r ψ̄_rψ'_r) 1_E = ⟨ψ|ψ'⟩1_E`.
(ii) `Σ_{il}⟨e_i|e'_l⟩(1⊗|e_i⟩⟨e'_l|) = 1_B⊗(Σ_{il}⟨e_i|e'_l⟩|e_i⟩⟨e'_l|) = 1_B⊗1_G` because
`Σ_i⟨e_i|e'_l⟩|e_i⟩ = |e'_l⟩`. Hence `Σ_{il}⟨e_i|e'_l⟩K_i†K'_l = Λ_ψ†(1_B⊗1_G)Λ_ψ' = Λ_ψ†Λ_ψ'`, and
(i) applies. ∎

*Remark.* Version (ii) is the "generalised overlap identity" used in the source note as
`⟨ψ|ψ'⟩·1 = Σ_{il}Γ_{il}K_i†K'_l` with the contraction `Γ_{il} = ⟨e_i|e'_l⟩`; the proof above shows it
is a special case of (i) and needs no relation between the two Stinespring dilations, only that they
share the compressed isometry `Λ`. Machine check: L4c (including an independent unitary change of basis
on the second family).

### C.2 The Kraus-rank theorem: `Chan(E,B)` is not a state space

> **Theorem C.2.** Let `d_E, d_B ≥ 2`. Then `Chan(E,B)` is not affinely isomorphic to the normal state
> space of `B(H_R)`, for any Hilbert space `R` — finite- or infinite-dimensional, separable or not.

*Proof.* Write `N = d_E d_B`.
**(0) Reduction to finite `R`.** An affine isomorphism preserves affine dimension. `Chan(E,B)` has
finite affine dimension `d_E²(d_B²−1)`, whereas the normal state space of an infinite-dimensional
Hilbert space has infinite affine dimension (it contains a simplex of every finite dimension, e.g. from
countably many orthogonal rank-one projections). So `R < ∞`.
**(1) Strata.** For `J = KK†` of Choi rank `r` (i.e. `K: ℂ^N → ℂ^r` of rank `r`), the tangent space of
the rank-`r` PSD manifold is the image of `δK ↦ δK K† + K δK†`, of dimension `2Nr − r²`
(L3a: this is the real dimension; the kernel is the `u(r)` stabiliser).
**(2) Submersion.** `Tr_B` restricted to that tangent image has real rank `d_E²` at every point of every
*non-empty* stratum: a Hermitian `H` annihilating the image satisfies `(H⊗1)K = 0`, i.e. `K_i H^T = 0`
for all Kraus operators, and `ΣK_i†K_i = 1` leaves no common kernel. Hence
`dim M_r = 2Nr − r² − d_E²` for non-empty strata (L3b; emptiness is possible only for `r = 1`,
`d_E > d_B`, where it is exactly what the numerical rank deficiency of one records).
**(3) Extremal channels have `r ≤ d_E`.** By Choi's criterion `f` is extreme iff `{K_i†K_j}_{ij}` is
linearly independent; these are `r²` elements of the `d_E²`-dimensional space of operators `E → E`, so
`r ≤ d_E` (L3d).
**(4) Attainment.** For `d_B ≥ 2`, `K_i = |u⟩⟨e_i|` with `u` a unit vector gives a trace-preserving
channel of Choi rank exactly `d_E` with independent `{K_i†K_j}`, i.e. an extreme point (L3c). The
condition "`{K_i†K_j}` independent" is (the complement of) a proper algebraic condition on `M_{d_E}`,
hence holds on a Zariski-open dense subset; extremality therefore holds on a subset of `M_{d_E}` of full
dimension. Since `2Nr − r² − d_E²` is strictly increasing for `r < N` and `r ≤ d_E < N`, no lower
stratum can contribute more. So `dim Ext Chan(E,B) = 2d_E²(d_B−1)` (L3a–L3f).
**(5) The algebra.** An affine isomorphism of convex bodies maps extreme points bijectively onto extreme
points, hence `dim Ext Chan = dim Ext State(ℂ^R) = 2(R−1)`, while (0)/(1) give `R²−1 = d_E²(d_B²−1)`.
Substituting `R = d_E²(d_B−1)+1` into the second equation gives
`d_E²(d_B−1)(d_E²(d_B−1)+2) = d_E²(d_B−1)(d_B+1)`, i.e. (as `d_E²(d_B−1) ≠ 0`)
`d_E²(d_B−1) = d_B − 1`, hence `d_E = 1` — a contradiction (L3e, L3e′). ∎

In the dimension-matched escape cases the extreme boundaries differ sharply:

| `(d_B, d_E, d_R)` | `dim Ext Chan(E,B)` | `dim Ext State(ℂ^R)` |
|---|---|---|
| `(2, 4, 7)` | `32` | `12` |
| `(4, 8, 31)` | `384` | `60` |
| `(3, 35, 99)` | `4900` | `196` |

*(machine checked: L3f.)*

> **Corollary C.3.** (i) `Chan(E,B)` is not affinely isomorphic to the normal state space of any
> Hilbert space, separable or not (Theorem C.2 with (0)).
> (ii) The same invariants rule out the state spaces of finite-dimensional direct sums `M_R ⊕ M_S`:
> matching both `dim = R²+S²−2` and `dim Ext = 2 max(R−1, S−1)` has no solution with `d_E, d_B ≥ 2`
> (exhaustive check L19).
> (iii) If `Instr(−⊗E,B)` is representable, then so is `Chan(−⊗E,B)` (Prop. 4.9). Hence for every `B`
> with `d_B ≥ 2` the graded, quotiented, and coarse-grained instrument categories of C.5–C.12 are
> non-representable *at every outcome number*, and the Diophantine escape question of §7.2(2) is
> closed: escapes of the dimension count are not representable. *(§7.2(2) resolved.)*

*A class of state spaces not excluded by this argument:* affine **embeddings** of `Chan(E,B)` into state
spaces, and isomorphism with convex bodies that are not state spaces. The theorems below exclude
representability, not embeddability.

### C.4 Why `B = ℂ` is the genuinely instrument-specific case

For `d_B = 1`, `Chan(E,ℂ)` is a single point and `State(ℂ^R) ≅ Chan(E,ℂ)` for `R = 1`: Theorem C.2 is
vacuous there. It is exactly the `B = ℂ` fibre that requires the instrument-level (recorded-mixing)
arguments of C.8, C.10, C.12. This is the precise sense in which the *instruments* add content beyond
the deterministic category.

### C.5 Record forgetting: no right adjoint

Let `C` be any of the categories `Instr` (graded), `Instr_0`, `Instr_D`, `Instr_Q`, `Instr_cg` of §2 and
C.6, and let `c: C → Chan` be the forget-the-record operation of Rem. 5.8 (`c({E_i}) = Σ_i E_i`). `c` is
a functor (`c(T∘S) = c(T)∘c(S)`), the identity on `Chan`, and commutes with `F_E`.

> **Theorem C.5.** Let `E` be finite-dimensional with `d_E ≥ 2`, `B = E`, and suppose `F_E` has a right
> adjoint `R` on such a `C` with counit `ε_E`. Then, contrapositively: this is impossible whenever the
> program object `R(E)` is finite-dimensional **or separable**.
>
> *Proof.* Suppose `R` is a right adjoint. A channel `f: E → E` is a one-outcome instrument, so by the
> universal property `f = ε_E ∘ F(g) = ε_E ∘ (g⊗id_E)` for a unique `g ∈ C(ℂ,R(E))`. Applying `c`:
> `f = ε̄ ∘ (c(g)⊗id_E)` with `ε̄ := c(ε_E) ∈ Chan(R(E)⊗E, E)` and `c(g) = Σ_iρ_i ∈ State(R(E))`. So
> `T: State(R(E)) → Chan(E,E)`, `T(ρ) = ε̄(ρ⊗·)`, is *onto*.
> Take `f = Ad_U` for a unitary `U` of `E`. It is extreme in `Chan(E,E)` (Choi rank 1, Choi's
> criterion), so `F_U := T^{-1}(Ad_U)` is a face of `State(R(E))`: if `ρ = pρ₁+(1−p)ρ₂` lies in it, then
> `Ad_U = pT(ρ₁)+(1−p)T(ρ₂)` and extremality forces `T(ρ₁) = T(ρ₂) = Ad_U`. A non-empty compact convex
> face has extreme points (Krein–Milman), so pick a pure `ψ_U ∈ F_U`. Let `W: R(E)⊗E → E⊗G` be a
> Stinespring dilation of `ε̄` (an isometry) and put `Λ_ψ = Σ_rψ_rW_r` as in C.1, so that
> `T(ψ) = tr_G[Λ_ψ(·)Λ_ψ†]`. Since `T(ψ_U) = Ad_U` and `Ad_U` has Choi rank 1, the Kraus operators
> `K_i = (1⊗⟨e_i|)Λ_{ψ_U}` of `T(ψ_U)` are all proportional to `U`:
> `K_i = c_iU`, `Σ|c_i|² = 1`; hence `Λ_{ψ_U}(x) = (Ux)⊗η_U` with `η_U = Σ_ic_i|e_i⟩`, `‖η_U‖ = 1`.
> (Kraus operators of a map of Choi rank one are pairwise proportional: its Choi operator
> `Σ_i|K_i⟩⟩⟨⟨K_i|` has rank one.)
> Now let `U, U'` be unitaries with `U†U' ∉ ℂ1`. For every unit vector `x`,
> `⟨ψ_U|ψ_{U'}⟩ = ⟨Λ_{ψ_U}x, Λ_{ψ_{U'}}x⟩ = ⟨Ux|U'x⟩·⟨η_U|η_{U'}⟩ = ⟨x|U†U'x⟩·⟨η_U|η_{U'}⟩`
> (the first equality is C.1(i); the second uses the displayed form of `Λ`). The Rayleigh quotient
> `x ↦ ⟨x|U†U'x⟩` is non-constant exactly when `U†U' ∉ ℂ1`; choosing two unit vectors with different
> values forces `⟨η_U|η_{U'}⟩ = 0` and then `⟨ψ_U|ψ_{U'}⟩ = 0`.
> The unitaries `U_θ = diag(e^{iθ},1,…,1)`, `θ ∈ [0,2π)`, have `U_θ†U_{θ'} ∉ ℂ1` for `θ ≠ θ'`, so the
> `ψ_{U_θ}` are **uncountably many pairwise orthogonal vectors**. This is impossible in a
> finite-dimensional or separable Hilbert space. ∎

*Remarks.* (i) This is the Nielsen–Chuang no-programming theorem in categorical form; the source note
calls the conclusion "a right adjoint would be a deterministic universal programmable processor".
(ii) The hypothesis is on `R(E)`, not on `E`: with a non-separable register the counting argument
stops (the note's `ℓ²(Chan)` lookup-table processor; the finite-register instance is machine-checked,
L11), but non-representability is then supplied by the *other* route, C.2 — so no case is left open for
representability (as opposed to adjointness) of `Chan`. (iii) For `d_B ≥ d_E ≥ 2` the same proof runs
with isometric channels `Ad_V`, `V: E → B` (then `V†V' ∉ ℂ1_B`; see the source note's §3, not needed
below).

### C.6 The coarse-graining category `Instr_cg`

**Definition C.6 (cg instruments).** For objects `A, B`, let `Hom_cg(A,B)` be the set of those finitely
supported (or countably supported) measures `μ = Σ_{i∈I} c_i δ_{r_i}` on the set of rays `r` of nonzero
CP maps `A → B`, such that `Σ_i c_i e(r_i)†(1_B) = 1_A`, where `e(r)` is a fixed representative of the
ray `r` and `I` is finite (resp. countable). Composition and identity are componentwise,
`(T∘S) = reduce{F∘E}` where `reduce` merges components in the same ray and drops zero composites; the
zero composites are dropped, so `reduce` is a congruence: `E ∝ E'` implies `F∘E ∝ F∘E'`. Recorded
mixing is `pμ + (1−p)μ'`. Two elementary facts, both immediate: (i) `reduce` is linear in the measure
`μ`, so composition is bi-affine and `F_E = (−⊗id_E)` preserves rays and weights; (ii) hence for any
representation `(R, ε)`, the map `Φ_A(g) = ε_B ∘ F(g)` is **affine** for recorded mixing and, being a
bijection, an isomorphism of convex sets — so it maps extreme points onto extreme points and preserves
supports of finitely supported measures.

### C.7 Extreme points of the cg hom-sets

> **Lemma C.7.** *In `Hom_cg(A,B)`, `μ = Σ_{i∈I}c_iδ_{r_i}` is extreme (for recorded mixing) iff the
> marginals `v_i := e(r_i)†(1_B) ∈ Herm(A)`, `i ∈ supp μ`, are linearly independent. Consequently every
> extreme point has `|supp μ| ≤ d_A²`, and in particular is **finitely supported** — also in the
> countably supported model.*

*Proof.* (⇐, "independent ⇒ extreme") A decomposition `μ = pμ' + (1−p)μ''` has
`supp μ' ∪ supp μ'' = supp μ` and, writing `w_i` for the difference of the weights, `Σ_i w_i v_i = 0`;
independence forces `w = 0`, i.e. `μ' = μ'' = μ`. (⇒, "dependent ⇒ not extreme") Let
`Σ_{i∈J}w_iv_i = 0`, `w ≠ 0`, `J` a finite subset of `supp μ`. For small `ε > 0` the perturbed weights
`c_i ± εw_i` (`i ∈ J`) stay positive and still satisfy the constraint, so
`μ = ½(μ + εW) + ½(μ − εW)` is a non-trivial decomposition. The bound `|supp μ| ≤ d_A²` follows since
`Herm(A)` has dimension `d_A²`; for a countably supported `μ` pick any dependent finite subset (one
exists as soon as `|supp μ| > d_A²`), which the same perturbation argument uses without touching the
other, infinitely many, weights. ∎

*Machine checks:* L15a (independent ⇒ extreme), L15b (dependent ⇒ not extreme, explicit perturbation),
L15c (Carathéodory bound).

### C.8 The quadrilateral: `Instr_cg` is not representable

> **Theorem C.8.** Let `d_E ≥ 2`, let `B` be arbitrary (including `B = ℂ`) and let `R` be arbitrary.
> Then `Hom_cg(−⊗E, B)` is not representable, for finite **or countably supported** outcome sets.
> *(§7.2(1) for `Instr_cg`: resolved.)*

*Proof.* Suppose `(R, ε)` represents. Take `A = ℂ`; by C.6(ii) and C.7, `Φ: Hom_cg(ℂ,R) → Hom_cg(E,B)`
is an affine isomorphism of convex sets, and `Hom_cg(ℂ,R) ≅ {finitely supported probability measures
on State(R)}` (allowed rays with trace-one representatives; recorded mixing = convex combination).
**Step 1 (a quadrilateral face in the target).** Let `a` be a non-scalar Hermitian on `E` and
`δ > 0` small; set `v_l = ¼·1_E + δβ_l a` with `β = (1,−1,2,−2)`, so that every `v_l` is positive.
Since `Σ_l v_l = 1_E` automatically (because `Σβ_l = 0` and the scalar part is `4·¼ = 1`), the four
classes `v_l` are effects with `Σ_l v_l = 1_E`. Let `σ` be a state of `B` and put
`f_l := tr(v_l · )σ`; these are pairwise non-proportional, nonzero CP maps `E → B` with marginals `v_l`,
and `f := {f_1,f_2,f_3,f_4}` is a four-outcome instrument of `Hom_cg(E,B)`. Its two decompositions into
extreme instruments are
> `f = ½e₁₂ ⊕ ½e₃₄ = ¼e₃₄ ⊕ ⅜e₁₄ ⊕ ⅜e₂₃`,  with
> `e₁₂ = {2f_1,2f_2}`, `e₃₄ = {2f_3,2f_4}`, `e₁₄ = {(8/3)f_1,(4/3)f_4}`, `e₂₃ = {(8/3)f_2,(4/3)f_3}`,
where a scalar prefactor multiplies every component. The weights `(½,½)` and `(¼,⅜,⅜)` sum to `1`, and
both sides reproduce the multiset `{f_1,f_2,f_3,f_4}` — verified in exact rational arithmetic (L1e).

**Step 2 (the face is a quadrilateral, not a simplex).** The face of the target carried by `f` is
`P_T = {c ≥ 0 : Σ_l c_l v_l = 1_E}`. Because `Σ_l v_l = 1_E` and `a` is non-scalar,
`Σ_l c_l v_l = (Σ_l c_l)/4·1_E + δ(Σ_l β_l c_l)a`, so
> `P_T = {c ≥ 0 : Σ_l c_l = 4, Σ_l β_l c_l = 0}`,
a polygon in a 2-plane. Its vertex set (all basic feasible solutions, enumerated in exact arithmetic,
L1b) is exactly `{(2,2,0,0), (0,0,2,2), (8/3,0,0,4/3), (0,8/3,4/3,0)}`, and the corresponding
instruments `e₁₂, e₃₄, e₁₄, e₂₃` are trace-preserving with linearly independent marginals, hence extreme
in `Hom_cg(E,B)` (L1c, L1d). Four vertices in a 2-plane: a quadrilateral, not a simplex.

**Step 3 (source-side contradiction).** `Φ⁻¹` maps the four extreme points `e₁₂, e₃₄, e₁₄, e₂₃` to
extreme points of `Hom_cg(ℂ,R)`, i.e. (C.7) to four pairwise **distinct** states `ρ₁₂, ρ₃₄, ρ₁₄, ρ₂₃`,
and the equality of Step 1 to an equality of probability measures on `State(R)`:
`½δ_{ρ₁₂} + ½δ_{ρ₃₄} = ¼δ_{ρ₃₄} + ⅜δ_{ρ₁₄} + ⅜δ_{ρ₂₃}`.
The left side is supported on `{ρ₁₂,ρ₃₄}`, the right side on `{ρ₃₄,ρ₁₄,ρ₂₃}`; with `ρ₁₄,ρ₂₃ ∉ {ρ₁₂,ρ₃₄}`
the supports differ, and two positive measures with different supports are different. Contradiction. ∎

> **Remark C.9 (the arithmetic of this section).**
> (i) *Top stratum.* Since `k = d_A²` extreme instruments exist generically and their stratum is open in
> the `n = d_A²` slice of Prop. 3.1, the extreme set of `Instr_cg(A,B)` has dimension
> `d_A²(d_A²d_B²−1)` (L10).
> (ii) *Simplex vs quadrilateral.* Preparation-type hom-sets `Hom_cg(ℂ,R)` are simplices whose extreme
> points are single states; measurement-type hom-sets carry the quadrilateral above. That is the whole
> obstruction.
> (iii) *Scales.* Over `ℚ`-convexity the same quadrilateral reappears (weights `τ_t = ¼+β_t√2/20`), so
> the ℚ-simplex test fails; the source note retracts its earlier ℚ-simplex remark, and this is verified
> (L7a–L7c). The ℚ-quotient is closed instead by Theorem C.12.
> (iv) *A deprecated route.* A dimension count of extreme sets (as attempted in the source note's part 1)
> is *not* used here: it requires semialgebraic bookkeeping that was never written, and it cannot see
> `B = ℂ`. The quadrilateral proof replaces it.

### C.10 `Instr_0`: atomic factorization (no merging at all)

Let `Hom_0(A,B)` be the set of finite multisets `{E_1,…,E_k}` of nonzero CP maps `A → B` with
`ΣE_i` trace-preserving; composition is componentwise, dropping zero composites; two elements are equal
iff their multisets are equal. Recorded mixing is `pS ⊕ (1−p)S' := {pE}_{E∈S} ⊎ {(1−p)F}_{F∈S'}`, and
composition is linear in each argument, so the universal map is again affine.

> **Theorem C.10.** Let `d_E ≥ 2`, `B` arbitrary, `R` arbitrary, and let the outcome multiplicity be
> arbitrary. Then `Hom_0(−⊗E, B)` is not representable. *(§7.2(1) for `Instr_0`: resolved.)*

*Proof.* Call `f` **irreducible** if no proper non-empty sub-multiset of `f` has marginals summing to a
scalar multiple of `1_E`. Two elementary facts.
(a) *Irreducible ⇒ atom.* If `f = pS ⊕ (1−p)S'` with both summands non-empty, then the components of
`pS` form a proper non-empty sub-multiset whose marginals sum to `p·1_E`.
(b) *Atoms of `Hom_0(ℂ,R)` are single states.* A multiset `{c_1ρ_1,…}` with `k ≥ 2` components splits as
`p·{c_1ρ_1/p} ⊕ (1−p)·{c_2ρ_2/(1−p),…}`; and a one-component element cannot be a non-trivial mix, since
a union of two non-empty multisets has at least two elements.

Now take the **pair-sum example** (a different one from the quadrilateral of C.8): a bounded non-scalar
Hermitian `x` with `‖x‖` small and the four positive effects
> `A = 1/5·1_E + x`, `B' = 3/10·1_E − x`, `C = 1/4·1_E + x`, `D = 1/4·1_E − x`,
so that `A+B' = C+D = ½·1_E`, `A+D = 9/20·1_E`, `C+B' = 11/20·1_E` (all *scalar* pair sums: the
`S`-shaped parameter choice is what makes the identity below literal), and let
`f_l = tr(v_l ·)σ` for `v = (A,B',C,D)` with any state `σ ∈ State(B)`. The four atoms
> `a_{AB'} = {2f_1,2f_2}`, `a_{CD} = {2f_3,2f_4}`, `a_{AD} = {(20/9)f_1,(20/9)f_4}`,
> `a_{CB'} = {(20/11)f_3,(20/11)f_2}`
are irreducible — each has two components with non-scalar marginals (a proper non-empty sub-multiset is
a single component, whose marginal is `2A`, `2B'`, … , not a scalar multiple of `1_E`) — hence atoms,
and they are pairwise distinct. In `Instr_0` there is no merging, and the identity
> `½a_{AB'} ⊕ ½a_{CD} = 9/20·a_{AD} ⊕ 11/20·a_{CB'} = f`
holds **literally, component by component**: `½·(2f_1) = f_1`, `(9/20)·(20/9)f_1 = f_1`, and so on for
all four components, both sides giving the multiset `{f_1,f_2,f_3,f_4}` (exact arithmetic: L2a–L2c,
L18). A representation would pull this back, along the affine bijection of C.6(ii), to
> `{½ρ̂₁, ½ρ̂₂} = {9/20·ρ̂₃, 11/20·ρ̂₄}`
with four pairwise distinct states; but the two sides are multisets of CP maps `ℂ → R` whose components
have different traces (`½ ≠ 9/20`, `½ ≠ 11/20`), so the multisets differ. Contradiction. ∎

### C.11 The infinite-merge dyadic quotient `D^ω`

> **Proposition C.11.** In the quotient `D^ω` of countably supported orbit-weight vectors
> (`w = Σ_O w_O δ_O`, `Σ_O w_O r_O` trace-preserving, mixing by midpoint averaging), `Hom_{D^ω}(E,B)`
> carries the same quadrilateral: the four orbit-weight vectors `(2,2,0,0)`, `(0,0,2,2)`,
> `(8/3,0,0,4/3)`, `(0,8/3,4/3,0)` satisfy `Σ_l c_l = 4`, `Σβ_lc_l = 0`, and the two decompositions
> with dyadic weights `(½,½)` and `(¼,⅜,⅜)` agree orbit-by-orbit. Hence `Hom_{D^ω}(−⊗E,B)` is not
> representable for `d_E ≥ 2`. *(Machine checks L16a, L16b; same proof as C.8 with C.7.)*

### C.12 Dyadic and rational quotients: rigidity of small weights

> **Theorem C.12.** Let `d_E ≥ 2`, let the outcome set of the potential representation be **finite**
> with `m` components in the counit, and let `B`, `R` be arbitrary (any dimension, non-separable
> included). Then `Hom(−⊗E,B)` is not representable in `Instr_D` or in `Instr_Q`.
> *(§7.2(1) for `Instr_D`, `Instr_Q`: resolved for finite outcomes.)*

*Proof.* **Genericity lemma.** For `k = m+1` there are positive effects `v_1,…,v_k` with `Σv_l = 1_E`
whose classes `M̄_l = v_l − (1/d_E)1_E ∈ Herm_0(E) ≅ ℝ^{d_E²−1}` satisfy: the only `ℚ`-linear relations
among `M̄_1,…,M̄_k` are multiples of the forced relation `Σ_l M̄_l = 0`. Equivalently
`M̄_1,…,M̄_{k−1}` are `ℚ`-independent. Indeed, `ℚ`-dependent tuples form a countable union of proper
algebraic subsets of `(ℝ^{d_E²−1})^{k−1}`, so their complement is dense, and small traceless
perturbations of `v_l = 1/k·1_E` keep the `v_l` positive. (Machine checks L13a–L13c: for generic qubit
POVMs with `k = 5,6,7` effects the real kernel of `(a_l) ↦ Σa_lM̄_l` has dimension `k−3` and the only
kernel vectors with entries in `[−3,3]` are multiples of `(1,…,1)`; for `d_E = 3`, `k = 6,8` likewise.)
Now suppose `(R,ε)` represents; let `f = {f_1,…,f_k}` with `f_l = tr(v_l·)σ` for such `v_l`. Let
`g = {ρ_i}` be the preimage of `f` at `A = ℂ`. Each group `i` has a nonzero composite, because
`Σ_j M_{ij} = τ_i1_E` with `τ_i = trρ_i > 0`, where `M_{ij}` is the marginal of `ε_j(ρ_i⊗id)`. In the
quotient, a composite multiset is equivalent to `f` iff, per class of proportional components, the total
weight is 1; so for the class of `f_l` the weights `a_{i,l}` (group `i`, class `l`) satisfy
`Σ_i a_{i,l} = 1`, and they are rational (dyadic for `D`). The marginal equation gives, in the quotient
`Herm(E)/ℝ1`, `Σ_l a_{i,l}M̄_l = 0`. As `M̄_1,…,M̄_{k−1}` are `ℚ`-independent and
`M̄_k = −Σ_{l<k}M̄_l`, this forces `a_{i,1} = … = a_{i,k}`. Taking traces in
`Σ_l a_{i,l}v_l = τ_i1_E` and using `Σ_l tr v_l = d_E` gives `a_{i,l} = τ_i > 0` for **every** `l`.
Hence group `i` has at least one nonzero composite in each of the `k` classes, i.e. at least
`k = m+1` nonzero composites — but group `i` has only `m` outcomes `j` available. Contradiction. ∎

*Remarks.* (i) Only finiteness of `m` and `d_E ≥ 2` are used; `R` may be non-separable and
infinite-dimensional, `B` may be `ℂ`. (ii) Countable outcome sets are *not* covered by this argument
(`k ≤ m` becomes vacuous) — see C.13 and R1.

### C.13 Scope in infinite dimensions, measurable outcomes, and non-normal states

> **Proposition C.13 (what is closed, and under what hypotheses).**
> (a) *Unconditional, finite-dimensional `E` and `B`, arbitrary `R`*: `Chan` non-representability
> (C.2, C.3) — the strata, the submersion and Choi's criterion are finite-dimensional statements, and
> `R` enters only through `dim Ext State(ℂ^R) = 2(R−1)` and `dim State(ℂ^R) = R²−1`, so infinite and
> non-separable `R` are covered (an infinite-dimensional state space fails on affine dimension alone).
> The `Instr_cg` quadrilateral (C.8) and the `Instr_0`/`D^ω`/dyadic and rational results
> (C.10, C.11, C.12) hold for finite-dimensional `E` and **arbitrary `B`** (including `B = ℂ`, and
> `B` infinite-dimensional) and carry **no hypothesis on `R`**: the only property of `Hom(ℂ,R)` used is
> that `Φ: Hom(ℂ,R) → Hom(E,B)` is an affine bijection, which is what representability supplies, so
> separability, compactness and normality of `R` are not used.
> (b) *Unconditional for finite `m`*: `Instr_D`, `Instr_Q` (C.12); for `B = ℂ` and countable outcomes
> additionally `Instr_0` (C.10) and `Instr_cg` (C.8).
> (c) *Conditional / not verified here*: the source note's `Thm 5` (separable infinite-dimensional,
> normal maps, arbitrary outcome spaces) and `Thm 7` (non-separable `Instr_0`) — these use Arveson's
> extremality criterion and a face-partition argument that this revision does not re-derive; their
> conclusions are in any case implied by (a)/(b) in the cases listed there. The ℓ²(Chan) lookup-table
> processor (non-separable register) shows that *separability hypotheses are not removable from the
> adjoint theorem*; it is not needed for representability. (Finite-register certificate: L11.)
> (d) *Open*: measurable/uncountable outcome sets for `cg` (the hom-set must be *defined* as a space of
> measures modulo label-forgetting, and the identification needs a disintegration theorem); non-normal
> states beyond finite-dimensional `E`; finitary `D` with infinite-dimensional `E`, non-separable `R`
> and infinite counit.

### C.14 The two counting lemmas (for the record)

> **Lemma C.14** (Lemmas A, B of the note). (a) If `f` is a finite class and `ε∘F(g) ≈ f` in the
> finitary `D`-quotient, then the composite multiset is finite, so every component of `g`, and every
> pure component of every `ρ̂_i`, has finite support `J = {j : ε_j(ψ) ≠ 0}`; the hypothesis "finitary"
> (each move changes the multiset size by one) is what makes "finite class ⇒ finite representative"
> true. (b) For finite `J` let `V_J = ∩_{j∉J}Z_j`, `Z_j = {v : ε_j(|v⟩⟨v|) = 0}`. Then `Λ` maps
> `Herm₁(V_J)` injectively into `∏_{j∈J}B_sa(E)`; hence `(dim V_J)² ≤ |J|d_E²`, sharpened for `B = ℂ`
> to `(|J|−1)d_E²+1` because `Σ_jΛ_j(h) = (tr h)·1`. *(Machine check L12: the rank of
> `Λ: h ↦ (ε_j(h))_j` equals `(m−1)d_E²+1` whenever `dim Herm(R)` allows: rank 13 for `dim R = 4`,
> `m = 4`; rank 21 for `dim R = 5`, `m = 6`; capped at 9 for `dim R = 3`.)*

### C.15–C.18 A minimal completion: the typed category `𝒯`

The obstruction of §4 says `[E,B]` cannot be a first-order quantum system. The following construction
exhibits the minimal enlargement of `Chan` in which `−⊗E` *does* have a right adjoint, and shows
exactly what is added: an affine slice of a state space, of codimension `d_E²−1`.

**C.15 (typed systems and `𝒯`).**
*Definition.* A **typed system** `𝔸 = (H_A, 𝔏_A)` is a finite-dimensional Hilbert space together with
an affine subspace `𝔏_A ⊆ {X : tr X = 1, X = X†}` containing a positive-definite operator; its
admissible states are `𝒮_A = 𝔏_A ∩ Herm⁺`. Morphisms `𝔸 → 𝔹` are the CP maps `f: A → B` with
`f(𝔏_A) ⊆ 𝔏_B`. The **first-order** system is `𝔄 = (H_A, T(H_A))`.
> **Lemma C.15.** (i) `aff 𝒮_A = 𝔏_A`. (ii) For `f ∈ CP(A,B)`: `f(𝔏_A) ⊆ 𝔏_B ⟺ f(𝒮_A) ⊆ 𝒮_B`.
> (iii) `𝒯` is a category and `ι: Chan → 𝒯`, `A ↦ 𝔄`, is fully faithful. (iv) With
> `𝔏_A ⊠ 𝔏_B := aff{a⊗b}`, `𝒯` is symmetric monoidal and `ι` is strong monoidal.

*Proof.* (i) A positive-definite point of `𝔏_A` is relatively interior (positive-definite operators are
open in `Herm`), so `𝔏_A` contains a relatively open subset of itself. (ii) `⇒` is immediate from
`𝒮_A ⊆ 𝔏_A` and complete positivity; `⇐` follows from `f(𝔏_A) = f(aff𝒮_A) = aff f(𝒮_A) ⊆ aff𝒮_B = 𝔏_B`
by (i) and affinity. (iii) Composition is CP and maps slices to slices by (ii). Let
`f ∈ Hom(𝔄,𝔄′)`; then `f(T(H_A)) ⊆ T(H_B)`, i.e. `tr f(X) = tr X` for all `X ∈ T(H_A)`, and since
`T(H_A)` spans `Herm(A)` linearly, `tr∘f = tr` on `Herm(A)` — that is, `f` is trace-preserving. So
`Hom(𝔄,𝔄′) = Chan(A,B)`. (iv) `a⊗b` is trace-one Hermitian for `a ∈ 𝔏_A`, `b ∈ 𝔏_B`, and `p_A⊗p_B` is
positive-definite; associativity follows because `aff{a⊗b⊗c}` is the same set for either bracketing;
the unit is `(ℂ,{1})`; the structural unitaries are unitary conjugations. For strong monoidality,
`⊆` is clear and `⊇` holds because products of states span `Herm(H_A⊗H_B)`, so every trace-one
Hermitian is an affine combination of product states. ∎

**C.16 (the internal hom and the adjunction).** For first-order `𝔼 = ι(E)` and typed `𝔹` put
`𝔏_[E,𝔹] = {C(f)/d_E : f ∈ HP(E,B), f(T(H_E)) ⊆ 𝔏_B}` and `[E,𝔹] = (H_{E*}⊗H_B, 𝔏_[E,𝔹])`, and let
`ε_𝔹 = d_E·ev_{E,B}: [E,𝔹]⊗𝔼 → 𝔹`, where `ev_{E,B}(Y) = (⟨Ω|⊗1_B)Y(|Ω⟩⊗1_B)` with
`|Ω⟩ = Σ_i|ii⟩ ∈ H_{E*}⊗H_E`. The **evaluation identity (E0)** is
`ev(C(f)⊗Y) = f(Y)` for every linear `f` and every `Y`, and `C` is the Choi bijection
`C(f) = Σ_{ij}|i⟩⟨j|⊗f(|i⟩⟨j|)`, natural enough that for linear `k`, `(id⊗k)(C(f)) = C(k∘f)`.
> **Lemma C.16.** (i) `[E,𝔹]` is a typed system. (ii) `ε_𝔹 ∈ Hom([E,𝔹]⊗𝔼, 𝔹)`.
> (iii) `Φ_{𝔸,𝔹}: Hom(𝔸,[E,𝔹]) → Hom(𝔸⊗𝔼,𝔹)`, `g ↦ ε_𝔹∘(g⊗id_E)`, is a bijection, natural in
> `𝔸` and `𝔹`; so `−⊗𝔼 ⊣ [E,−]` on `𝒯` for first-order `E`. *(§7.2(4) resolved for first-order `E`.)*

*Proof.* (i) For admissible `f`, `tr∘f = tr` on `Herm(E)` (as in C.15(iii) with `T(H_E)` in place of the
slice), so `Tr_B C(f) = 1_E` and `tr(C(f)/d_E) = 1`; the admissibility condition is affine in `f` and
`C` is linear; finally `f_0(X) = tr(X)b'` for positive-definite `b' ∈ 𝔏_B` is admissible and
`C(f_0) = 1⊗b'` is positive-definite; the remaining verifications are `(E0)` and linearity.
(ii) `ε` is CP; for products `C(f)/d_E ⊗ τ` with `f` admissible and `τ ∈ T(H_E)`,
`ε(C(f)/d_E ⊗ τ) = f(τ) ∈ 𝔏_B` by `(E0)`; the affine hull of these products is `𝔏_[E,𝔹] ⊠ T(H_E)`.
(iii) *Inverse.* For `f ∈ Hom(𝔸⊗𝔼,𝔹)` set `Ψ(f)(X) = (1/d_E)Σ_{ij}|i⟩⟨j|⊗f(X⊗|i⟩⟨j|)`; its Choi
operator is `C(f_a)/d_E` with `f_a(τ) = f(a⊗τ)`, CP, and admissible because `a⊗τ ∈ 𝔏_A ⊠ T(H_E)`
(L8c). *Round trips.* `ΦΨ = id` and `ΨΦ = id` are exactly `(E0)`, with `f_X(τ) = f(X⊗τ)`:
`ε(Ψ(f)(X)⊗Y) = f_X(Y) = f(X⊗Y)` (L8a, L14b for the numerical instances).
*Functoriality.* `[E,k] = id_{E*}⊗k` sends `C(f)/d_E` to `C(k∘f)/d_E`, and `k∘f` is admissible.
*Naturality in `𝔹`* reduces to counit naturality `ε_{𝔹'}∘([E,k]⊗id) = k∘ε_𝔹`, which holds on all of
`B(H_{E*}⊗H_B⊗H_E)` by `(E0)` and linearity. ∎

**C.17 (what this says about the paper's obstruction).**
> **Corollary C.17.** (i) For first-order `B`, `𝒮_[E,𝔅] = {C(f)/d_E : f ∈ Chan(E,B)}`, an affine copy of
> `Chan(E,B)` (L14a). (ii) `dim 𝒮_[E,𝔅] = d_E²(d_B²−1) = dim State(E*⊗B) − (d_E²−1)`: the intercept of
> Prop. 3.1 *is* the codimension of the typed slice (L9a). (iii) By C.2, `[E,𝔅]` is not isomorphic to any
> first-order object for `d_B ≥ 2`, and `−⊗E` has no right adjoint in `Chan`; the adjunction above is
> therefore genuinely a statement about the completion `𝒯`, not about quantum systems.

**C.18 (graded instruments in `𝒯`).** For `𝔅_n = (H_B⊗ℂⁿ, 𝔏^bd)`,
`𝔏^bd = {Σ_ib_i⊗|i⟩⟨i| : b_i ∈ Herm, Σ_i tr b_i = 1}`:
> **Proposition C.18.** (i) `Hom(𝔄,𝔅_n) = Instr_n(A,B)`. (ii) `Instr_n(A⊗E,B) ≅ Hom(𝔄,[E,𝔅_n])`.
> (iii) `dim 𝒮_[E,𝔅_n] = n d_E²d_B² − d_E²`, which is `dim` of the block-diagonal state space of
> `𝔅_n(E*⊗B)` minus `d_E²−1`, independent of `n` (L9b). In particular the grading is the choice of `n`
> and the intercept is the same codimension at every grade.

### C.19 The typed counit is trace-preserving only on the admissible slice

`ε_𝔹 = d_E·ev` is a morphism of `𝒯` (Lemma C.16(ii)), i.e. it preserves the *slice*, and it is CP; but
it is **not** trace-preserving on all of `B(H_{E*}⊗H_B)⊗B(H_E)`: it is the Bell post-selection. On the
admissible slice it is exactly trace-preserving: for `X = C(f)/d_E` with `f` a channel and `τ` a state,
`tr ε(X⊗τ) = tr f(τ) = 1` (L17a). Off the slice the trace defect is real and example-dependent: for
normalised PSD `X` chosen at random we computed traces `1.072, 0.989, 1.011` (L17b) — the note's quoted
"0.97" is one such instance, not a theorem. This is exactly why the completion is *typed*: the counit is
a morphism between slices, not between state spaces.

*Relation to the literature (unproven here).* The note observes that `𝒯` looks like the affine-slice
shadow of the *-autonomous category `Caus[CPM(FHilb)]` of Kissinger–Uijlen [11], whose objects are
"double-orthogonal" (comb-like) closures, and that the affine-span tensor `⊠` should agree with that
closure on the objects used above; likewise the admissible states of `[E,𝔅]` are the first-level
quantum combs of [12]. That agreement is **not proven** in the note or here (residual gap R5); the
adjunction C.16 is proved only for first-order `E`, which is all the paper needs.

### C.20 Residual gaps (kept visible in §7.2)

* **R1** Finitary `D` with `dim E = ∞`, non-separable `R`, and infinitely many counit outcomes: partial
  arithmetic merging makes the source non-simplicial, Lemma C.14(b) needs a finite-dimensional target,
  and the retract reduction needs split idempotents. Open.
* **R2** Measurable/uncountable outcome sets for `cg`: the hom-set must be defined as a measure space on
  rays modulo label-forgetting; the required disintegration check is not done.
* **R3** Non-normal states: closed only for `dim E < ∞` in `Instr_0`, `cg`, `D^ω`; the categories need
  definitions beyond that.
* **R4** The note's infinite-dimensional theorems (`Thm 5`, `Thm 7`) are not re-derived here and are not
  used; the infinite-dimensional statements printed in this revision are C.2, C.3, C.5, C.10, C.12.
* **R5** `𝒯` vs `Caus[CPM(FHilb)]`: tensor agreement and maximality unproven.
* **R6** The note's alternative "face of dimension 2" invariant for non-separable `Chan` is not verified
  here (and is unnecessary given C.2).
* **R7** Formal (proof-assistant) verification of C.1, C.7, C.8, C.10, C.12, C.16 remains future work;
  the arithmetic and the finite instances are machine-checked in `verification/`.
