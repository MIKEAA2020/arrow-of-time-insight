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
section and a list of open problems.

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
`(d_B,d_E,d_R) = (k,2k,2k²−1)` the `n = 1` count is satisfiable (see Open Problem 7.2).

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

### 7.2 Open problems

1. **Coarse-graining quotient.** Does the obstruction survive the category in which outcomes may be
   merged (grading forgotten)? Thm 4.5 (one-slice form) is unaffected; the graded argument is not.
   The author's companion suite classifies the multiset quotient as *open*, with partial levers
   (adjunction transpose is a split mono; `d_R ≥ d_A + 1`; non-square/cokernel estimates). A useful
   invariant must survive quotienting; note that the class of an ensemble `(p_i,ρ_i)` under merging is
   captured by its finite set of partial sums `{Σ_{i∈S} p_iρ_i}`, and such class-sets are **not
   convex**, so affine-dimension methods cannot be applied verbatim. Unproved.
2. **Which `(n, B)` escape the dimension count, and are the non-degenerate escapes representable?**
   By Prop. 4.7 the count can be matched precisely when `n | (d_E²−1)` and `(d_E²−1)/n = j(2 d_E d_B − j)`
   for some `1 ≤ j ≤ d_E d_B − 1`, the representing dimension then being `d_G = d_E d_B − j`. This set
   is never empty: `B = ℂ` gives `j = d_E − 1`, `d_G = 1` (a genuine but degenerate escape — both
   hom-sets are single points), and the Pell family `(k, 2k, 2k²−1)` matches dimensions with large,
   non-degenerate hom-sets. `B = E` never escapes (Thm 4.6). Open: whether a non-degenerate escape
   admits an `A`-natural family of affine bijections — no dimension count can decide this, and the
   classical case shows that one invariant is not enough (there the *vertex* count obstructs inside a
   matched-dimension regime). In `Chan` the same question reads: the original Diophantine equation has
   infinitely many solutions, but naturality in `A` — not dimension — is what a representation must
   satisfy.
3. **Infinite-dimensional / measurable-outcome versions.** The mechanism above is intrinsically
   finite; a different invariant (Petz/conditional-expectation structure) is needed.
4. **Higher-order completions.** Prove, rather than assert, that `[E,B]` is a convex type of comb and
   that closure is restored in `Caus[−]`/quantum-comb completions.
5. **Formal verification.** Prop. 3.1, Lemma 3.2, Thms 4.3–4.6, Props. 4.7/5.6 are Lean-sized; the arithmetic
   certificates are already machine-checked (`verification/`).

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

---

## Appendix A — Computational certificates

All claims tagged "(verified)", "(certificate)" or "(section X of the verification log)" are produced
by `verification/verify_claims.py`; the full transcript is `verification/verification_log.txt`
(111 checks, 0 failures). Highlights: rank computations for Prop. 3.1; the affine-dimension lemma's
mechanism and its necessity; the square-gap over `d_E < 200000` and symbolically; the
`d_E<400, d_B<60` box reproducing exactly 70 nontrivial solutions; the general-`m` collapse
`m d_E² = 1`; the classical threshold contrast; the CPM bookkeeping (128 vs 140); the lexicographic
strictification (composition associative; interchange only up to a permutation).

## Appendix B — Map from the original draft

See `REVISION_CHANGELOG.md`: every claim of the original manuscript is listed with its verdict
(verified / corrected / deleted / re-labelled as interpretation), together with the audit finding that
drove the change.
