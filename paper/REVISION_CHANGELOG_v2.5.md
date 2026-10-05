# Revision changelog and proof-recheck record — Rev. 2.4 → Rev. 2.5

**Date:** 2026-10-05

**Primary deliverables:** `paper/REVISED_PAPER_v2.5.md` and this file.

Rev. 2.5 is a new version. It does not overwrite `paper/REVISED_PAPER.md` (Rev. 2.4), the original
PDF, or `paper/REVISION_CHANGELOG.md`. To honor the requested two-file delivery boundary, this
versioned changelog also contains the proof-recheck audit and the fresh finite-check transcript; no
separate audit, verifier, or log file was added. The existing verifier source and Rev. 2.4 verification
log remain unchanged.

## Summary of changes

1. **Corrected the quantum and classical intercepts.** A prior audit and Rev. 2.4 incorrectly expanded
the process-side affine dimension as though the counit's outcome grade multiplied the normalization
codimension. Rev. 2.5 uses the exact slice dimension and a two-grade finite difference; the contradiction
is independent of the counit grade `m`.
2. **Separated pointwise and global claims.** Theorem 4.3 has its own per-target proof for literal
`Instr_lab` and, using semialgebraic dimension, `Instr_perm`. The `Chan(E,E)` one-slice obstruction plus
Proposition 4.9 is stated only as a global no-right-adjoint route. In particular, the `Chan` target
`B=ℂ` is pointwise representable.
3. **Replaced an incorrect exact-recovery criterion.** Proposition 6.1 now states and proves the
full-space Knill–Laflamme condition, which allows a mixture of orthogonal isometric branches; it no
longer asserts that every exactly recoverable channel is one isometry channel.
4. **Narrowed prior-indexed inversion.** Proposition 6.2 states the finite-dimensional Petz-transpose
composition law under explicit full-support hypotheses and makes no claim for non-faithful priors
without support conventions.
5. **Repaired Appendix C.** Lemma C.1 requires complete orthonormal bases of one common environment;
its identity is not asserted for arbitrary incomplete families. The C.5 extremality argument applies
the normal CP Radon–Nikodym theorem to the dominated map `p f_1`, keeping the factor `p` throughout.
6. **Clarified the monoidal model.** The labelled tuple presentation is not monoidal on the nose; the
monoidal-closedness claim is restricted to `Instr_perm`, which quotients only outcome relabellings and
retains zero/repeated components with multiplicity.
7. **Kept scope and residuals visible.** The source-adjudication order remains **complete → close →
replace with a companion → drop**. The distinct limits on `Instr_0`, `Instr_cg`, `Instr_D`, `Instr_Q`,
`D^ω`, and other quotients remain explicit. §7.2 retains residuals R1–R6 and names two additional
unsettled questions as R7–R8; finite computations are not presented as proofs.

## Independent proof recheck and source adjudication

### 1. Quantum affine-dimension intercept: the earlier audit's general-`m` step is wrong

The Rev. 2.4 proof and `audits/00_ADJUDICATED_AUDIT.md` §2.4 (repeated in
`audits/04_REMAINING_POINTS_IMPLEMENTED.md`, row B4) use the incorrect process-side constant
`−m d_E²`, leading to the equation `m d_E²=1`. The error is the expansion

`d_E²(n m d_B² − 1) = n m d_E² d_B² − d_E²`,

whose constant term is `−d_E²`, not `−m d_E²`. The counit grade multiplies the number of outcomes; it
does not multiply the trace-preserving normalization codimension.

For a fixed target `B`, let `e=d_E²`, `b=d_B²`, and `r=d_{R(B)}²`. At `A=ℂ`, the representing and
process-side grade strata have dimensions

`q_R(n)=n r−1`,  and  `q_E(n)=e(n m b−1)`.

The inverse representability map sends grade `n` to grade `n m`. Because the full hom-set map is a
bijection and grade is multiplicative, a process of grade `n m` has a preimage `g` with
`m O(g)=n m`, hence `O(g)=n`; thus this restriction is a bijection between those two strata. This
argument does not first substitute `m=1`. At `n=1,2`,

`q_R(2)−2q_R(1)=1`,  while  `q_E(2)−2q_E(1)=e`.

Equality forces `e=1`, contradicting `d_E≥2`, for every `m,b`. Lemma 4.1 separately forces `m=1`
from total surjectivity and the existence of a one-outcome process, but that fact is not used in the
two-slice contradiction. The derivation is valid for each fixed target `B` in literal `Instr_lab`;
Rem. 3.4 carries it to `Instr_perm` through finite semialgebraic quotients.

This corrects both the manuscript and the earlier audit, rather than repeating the audit's claim as
authority. The result remains genuinely pointwise: it does not rely on the separate global
`Chan`-to-`Instr` reduction.

### 2. The Chan route is global, not a second per-target proof

The one-slice square-gap argument concerns `Chan(E,E)` and proves that `F_E` has no right adjoint on
`Chan`. Proposition 4.9 uses multiplicative outcome grade to transfer that **global** conclusion to
`Instr_lab` and `Instr_perm`. It cannot establish non-representability for every individual target.
Indeed, for `B=ℂ`, `Chan(A⊗E,ℂ)` and `Chan(A,ℂ)` are singleton sets for every `A`, so the corresponding
pointwise presheaf is represented by `ℂ`. Theorem 4.3 supplies the separate all-target statement in
the literal instrument model; Rem. 3.4 supplies its permutation-quotient extension. No Prop. 4.9
grade argument is extended to `Instr_0`, `Instr_cg`, `Instr_D`, `Instr_Q`, `D^ω`, or another quotient
without its own category-specific proof.

### 3. Classical affine-dimension intercept: same root cause, same repair

`audits/00_ADJUDICATED_AUDIT.md` §2.8 states `m|E|=1`. That repeats the same erroneous scaling. Put
`e=|E|`, `b=|B|`, and `r=|R|`. The correct dimensions at `A=1` are

`q_R(n)=n r−1`,  and  `q_E(n)=e(n m b−1)=n m e b−e`.

The global bijection again restricts bijectively from grade `n` to grade `n m`. Hence the two-slice
finite difference is `1` on the representing side and `e` on the process side, forcing `e=1`
independently of `m`. The separate one-outcome count also forces `m=1`, but is not substituted in
this affine-dimension argument. The proof uses no specifically quantum structure.

### 4. Exact channel recovery: the isometry-only statement was false

Rev. 2.4 §6.2 and `audits/04_REMAINING_POINTS_IMPLEMENTED.md`, row C2, treat a single isometric
channel as necessary. It is only a special case. Let `V_0,V_1:A→A⊕A` be the orthogonal canonical
embeddings and `0<p<1`. Then

`N(ρ)=p V_0ρV_0†+(1−p)V_1ρV_1†`

has the CPTP left inverse

`R(X)=V_0†XV_0+V_1†XV_1`,

although a pure input is sent to a rank-two state. The corrected proposition states the
representation-independent full-space criterion

`K_i†K_j=c_ij I_A` for all Kraus operators, with `C=(c_ij)≥0`.

For necessity, if `{L_a}` are Kraus operators of a CPTP left inverse, `{L_aK_i}` is a Kraus family for
`id_A`. Its Choi matrix has rank one, so `L_aK_i=α_ai I_A`. Consequently
`c_ij=Σ_a conjugate(α_ai) α_aj`, a positive Gram matrix. Conversely, a unitary Kraus rotation
diagonalizes `C`, yielding `K_s†K_t=p_s δ_st I_A`; after removing zero branches,
`V_s=K_s/√p_s` are orthogonal-range isometries with `Σ_s p_s=1`. With
`P=Σ_s V_sV_s†` and any state `τ_A`,

`R(X)=Σ_s V_s†XV_s + tr((I_B−P)X)τ_A`

is CP, trace-preserving, and satisfies `R∘N=id_A`. This proof replaces the old criterion, not merely
its wording.

### 5. Petz/Bayesian qualification

The paper no longer conflates a prior-dependent transpose with a global left inverse or a universal
adjunction. Proposition 6.2 assumes finite dimensions, `σ>0`, `τ=N(σ)>0`, and for a composite
`M:B→C`, `υ=M(τ)>0`. Under these assumptions it defines

`N♯_σ(X)=σ^(1/2) N*(τ^(−1/2)Xτ^(−1/2)) σ^(1/2)`,

proves complete positivity, trace preservation, `N♯_σ(τ)=σ`, and
`(M∘N)♯_σ=N♯_σ∘M♯_τ`. For non-faithful priors, support restrictions/extensions are not claimed.
The finite matrix-unit/depolarizing-channel check below is corroboration only; the displayed proof is
the argument.

### 6. Lemma C.1: complete common environments only

The Kraus-basis expansion follows by inserting the resolution of the identity for **complete
orthonormal bases of the same environment** `G`. For two compressed channels from one Stinespring
isometry `W`, the two basis embeddings must be induced by that same dilation. Zero Kraus operators
may be added when completing a minimal dilation's basis to a basis of `G`; the added terms vanish.
An arbitrary incomplete orthonormal family resolves only its support projection, not `I_G`, so no
identity with `I_E` is asserted for such a family. The C.5 application now spells out the completion
and identifies the nonzero-support cross-Gram block as the contraction `J_θ†J_θ′`. The existing
finite L4c regression check uses complete bases and is not evidence for the excluded incomplete-family
claim.

### 7. Appendix C.5: the missing probability scale

If `f_θ=p f_1+(1−p)f_2`, the map dominated by `f_θ` is `p f_1`, not `f_1`. The normal CP
Radon–Nikodym theorem therefore gives a positive contraction `D` representing `p f_1` in the minimal
Stinespring environment of `f_θ`. Trace preservation of `f_1` gives

`V_θ†(I_B⊗D)V_θ=pI_E`,

so the zero-compression equation is for `D−pI`, not `D−I`. The proof uses the linearly independent
block-supported products `(K_i^θ)†K_j^θ` to force every coefficient of `D−pI` to vanish; then
`D=pI` and `f_1=f_θ` (and similarly `f_2=f_θ`). This restores the factor needed for the extremality
argument. The supporting common-environment overlap step is Lemma C.1 as qualified above.

### 8. Monoidal and quotient scope

The lexicographically labelled tuple presentation has composition but its tensor interchange holds
only up to outcome permutation; it is not claimed to be a symmetric monoidal category on the nose.
`Instr_perm` quotients by label permutation while retaining zeros and repeated outcomes with
multiplicity; it is the symmetric monoidal model in which the monoidal-closedness statement is made.
Theorem 4.6 remains a fixed-grade affine-body result for labelled tuples, not a representability
claim for `Instr_0`, `Instr_cg`, `Instr_D`, `Instr_Q`, `D^ω`, or any other quotient.

## Verification record

### Regression-suite rerun

- **Command:** `python3 verification/verify_claims.py`
- **Suite source:** unchanged; SHA-256 `470d7b44ba06e3030ec876da3fd488622465ccf2d01b485c510bb2b7eb6a98d5`
- **Workspace base at run:** `c413ebd` (the versioned paper files were untracked additions)
- **Environment:** Python 3.13.14; NumPy 2.3.5; SymPy 1.14.0
- **Result:** exit status 0; 197 checks passed, 0 failed, 197 total. A final rerun after the Rev. 2.5
  proof/scope edits produced byte-identical console output.
- **Scope limit:** this is a finite regression battery, not a text parser or proof assistant. The
  existing `verification/verification_log.txt` remains the Rev. 2.4 log; it was not overwritten. The
  fresh run is reproduced below in this versioned change record.

### Targeted Rev. 2.5 checks

Separate short Python/SymPy/NumPy checks were run for the revisions above:

- Symbolically, with positive symbols `e,m,b,r`, the quantum and classical slice formulas each give
  finite differences `1` and `e` at grades 1 and 2; the result is independent of `m,b`.
- For `(d_A,d_E,d_B)=(2,2,3)`, the two deterministic Choi-slice dimensions are `128` and `140`,
  with right-minus-left difference `12=d_A²(d_E²−1)`.
- A qubit channel with two orthogonal isometry branches and branch weights `p=0.37`, `1−p` obeys
  the full-space Kraus condition, is not a single isometry channel, and has a CPTP left inverse on the
  full `A⊕A` output space.
- For full-rank qubit input `σ=diag(0.71,0.29)` and depolarizing channels with parameters `0.2` and
  `0.35`, both intermediate priors are full rank; the Petz-transpose composition law and trace
  preservation hold on a matrix-unit basis, with maximum composition error `2.220e−16`.

These tests reproduce finite instances and exact symbolic identities only. The analytic proofs in the
manuscript carry the universal claims. In particular, the numerical L4c overlap check is not used to
justify Lemma C.1 for incomplete bases, and no finite computation is used as proof of a categorical
adjunction obstruction.

### Full console transcript of the unchanged 197-check regression suite

```text

==============================================================================
A. PROPOSITION 3.1 -- affine dimension of the instrument slices
==============================================================================
[PASS] Prop 3.1: dim_aff Instr_1(A,B) = d_A^2(n d_B^2-1)  [dA=1,dB=1,n=1]   -- rank=1 (=d_A^2), aff.dim=0, formula=0
[PASS] Prop 3.1: dim_aff Instr_2(A,B) = d_A^2(n d_B^2-1)  [dA=1,dB=1,n=2]   -- rank=1 (=d_A^2), aff.dim=1, formula=1
[PASS] Prop 3.1: dim_aff Instr_3(A,B) = d_A^2(n d_B^2-1)  [dA=1,dB=1,n=3]   -- rank=1 (=d_A^2), aff.dim=2, formula=2
[PASS] Prop 3.1: dim_aff Instr_4(A,B) = d_A^2(n d_B^2-1)  [dA=1,dB=1,n=4]   -- rank=1 (=d_A^2), aff.dim=3, formula=3
[PASS] Prop 3.1: dim_aff Instr_1(A,B) = d_A^2(n d_B^2-1)  [dA=1,dB=2,n=1]   -- rank=1 (=d_A^2), aff.dim=3, formula=3
[PASS] Prop 3.1: dim_aff Instr_2(A,B) = d_A^2(n d_B^2-1)  [dA=1,dB=2,n=2]   -- rank=1 (=d_A^2), aff.dim=7, formula=7
[PASS] Prop 3.1: dim_aff Instr_3(A,B) = d_A^2(n d_B^2-1)  [dA=1,dB=2,n=3]   -- rank=1 (=d_A^2), aff.dim=11, formula=11
[PASS] Prop 3.1: dim_aff Instr_4(A,B) = d_A^2(n d_B^2-1)  [dA=1,dB=2,n=4]   -- rank=1 (=d_A^2), aff.dim=15, formula=15
[PASS] Prop 3.1: dim_aff Instr_1(A,B) = d_A^2(n d_B^2-1)  [dA=1,dB=3,n=1]   -- rank=1 (=d_A^2), aff.dim=8, formula=8
[PASS] Prop 3.1: dim_aff Instr_2(A,B) = d_A^2(n d_B^2-1)  [dA=1,dB=3,n=2]   -- rank=1 (=d_A^2), aff.dim=17, formula=17
[PASS] Prop 3.1: dim_aff Instr_3(A,B) = d_A^2(n d_B^2-1)  [dA=1,dB=3,n=3]   -- rank=1 (=d_A^2), aff.dim=26, formula=26
[PASS] Prop 3.1: dim_aff Instr_4(A,B) = d_A^2(n d_B^2-1)  [dA=1,dB=3,n=4]   -- rank=1 (=d_A^2), aff.dim=35, formula=35
[PASS] Prop 3.1: dim_aff Instr_1(A,B) = d_A^2(n d_B^2-1)  [dA=2,dB=1,n=1]   -- rank=4 (=d_A^2), aff.dim=0, formula=0
[PASS] Prop 3.1: dim_aff Instr_2(A,B) = d_A^2(n d_B^2-1)  [dA=2,dB=1,n=2]   -- rank=4 (=d_A^2), aff.dim=4, formula=4
[PASS] Prop 3.1: dim_aff Instr_3(A,B) = d_A^2(n d_B^2-1)  [dA=2,dB=1,n=3]   -- rank=4 (=d_A^2), aff.dim=8, formula=8
[PASS] Prop 3.1: dim_aff Instr_4(A,B) = d_A^2(n d_B^2-1)  [dA=2,dB=1,n=4]   -- rank=4 (=d_A^2), aff.dim=12, formula=12
[PASS] Prop 3.1: dim_aff Instr_1(A,B) = d_A^2(n d_B^2-1)  [dA=2,dB=2,n=1]   -- rank=4 (=d_A^2), aff.dim=12, formula=12
[PASS] Prop 3.1: dim_aff Instr_2(A,B) = d_A^2(n d_B^2-1)  [dA=2,dB=2,n=2]   -- rank=4 (=d_A^2), aff.dim=28, formula=28
[PASS] Prop 3.1: dim_aff Instr_3(A,B) = d_A^2(n d_B^2-1)  [dA=2,dB=2,n=3]   -- rank=4 (=d_A^2), aff.dim=44, formula=44
[PASS] Prop 3.1: dim_aff Instr_4(A,B) = d_A^2(n d_B^2-1)  [dA=2,dB=2,n=4]   -- rank=4 (=d_A^2), aff.dim=60, formula=60
[PASS] Prop 3.1: dim_aff Instr_1(A,B) = d_A^2(n d_B^2-1)  [dA=2,dB=3,n=1]   -- rank=4 (=d_A^2), aff.dim=32, formula=32
[PASS] Prop 3.1: dim_aff Instr_2(A,B) = d_A^2(n d_B^2-1)  [dA=2,dB=3,n=2]   -- rank=4 (=d_A^2), aff.dim=68, formula=68
[PASS] Prop 3.1: dim_aff Instr_3(A,B) = d_A^2(n d_B^2-1)  [dA=2,dB=3,n=3]   -- rank=4 (=d_A^2), aff.dim=104, formula=104
[PASS] Prop 3.1: dim_aff Instr_4(A,B) = d_A^2(n d_B^2-1)  [dA=2,dB=3,n=4]   -- rank=4 (=d_A^2), aff.dim=140, formula=140
[PASS] Prop 3.1: dim_aff Instr_1(A,B) = d_A^2(n d_B^2-1)  [dA=3,dB=1,n=1]   -- rank=9 (=d_A^2), aff.dim=0, formula=0
[PASS] Prop 3.1: dim_aff Instr_2(A,B) = d_A^2(n d_B^2-1)  [dA=3,dB=1,n=2]   -- rank=9 (=d_A^2), aff.dim=9, formula=9
[PASS] Prop 3.1: dim_aff Instr_3(A,B) = d_A^2(n d_B^2-1)  [dA=3,dB=1,n=3]   -- rank=9 (=d_A^2), aff.dim=18, formula=18
[PASS] Prop 3.1: dim_aff Instr_4(A,B) = d_A^2(n d_B^2-1)  [dA=3,dB=1,n=4]   -- rank=9 (=d_A^2), aff.dim=27, formula=27
[PASS] Prop 3.1: dim_aff Instr_1(A,B) = d_A^2(n d_B^2-1)  [dA=3,dB=2,n=1]   -- rank=9 (=d_A^2), aff.dim=27, formula=27
[PASS] Prop 3.1: dim_aff Instr_2(A,B) = d_A^2(n d_B^2-1)  [dA=3,dB=2,n=2]   -- rank=9 (=d_A^2), aff.dim=63, formula=63
[PASS] Prop 3.1: dim_aff Instr_3(A,B) = d_A^2(n d_B^2-1)  [dA=3,dB=2,n=3]   -- rank=9 (=d_A^2), aff.dim=99, formula=99
[PASS] Prop 3.1: dim_aff Instr_4(A,B) = d_A^2(n d_B^2-1)  [dA=3,dB=2,n=4]   -- rank=9 (=d_A^2), aff.dim=135, formula=135
[PASS] Prop 3.1: dim_aff Instr_1(A,B) = d_A^2(n d_B^2-1)  [dA=3,dB=3,n=1]   -- rank=9 (=d_A^2), aff.dim=72, formula=72
[PASS] Prop 3.1: dim_aff Instr_2(A,B) = d_A^2(n d_B^2-1)  [dA=3,dB=3,n=2]   -- rank=9 (=d_A^2), aff.dim=153, formula=153
[PASS] Prop 3.1: dim_aff Instr_3(A,B) = d_A^2(n d_B^2-1)  [dA=3,dB=3,n=3]   -- rank=9 (=d_A^2), aff.dim=234, formula=234
[PASS] Prop 3.1: dim_aff Instr_4(A,B) = d_A^2(n d_B^2-1)  [dA=3,dB=3,n=4]   -- rank=9 (=d_A^2), aff.dim=315, formula=315
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=1,dB=1,n=1]   -- min eig=1
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=1,dB=1,n=2]   -- min eig=0.5
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=1,dB=1,n=3]   -- min eig=0.333
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=1,dB=2,n=1]   -- min eig=0.5
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=1,dB=2,n=2]   -- min eig=0.25
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=1,dB=2,n=3]   -- min eig=0.167
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=1,dB=3,n=1]   -- min eig=0.333
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=1,dB=3,n=2]   -- min eig=0.167
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=1,dB=3,n=3]   -- min eig=0.111
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=2,dB=1,n=1]   -- min eig=1
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=2,dB=1,n=2]   -- min eig=0.5
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=2,dB=1,n=3]   -- min eig=0.333
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=2,dB=2,n=1]   -- min eig=0.5
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=2,dB=2,n=2]   -- min eig=0.25
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=2,dB=2,n=3]   -- min eig=0.167
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=2,dB=3,n=1]   -- min eig=0.333
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=2,dB=3,n=2]   -- min eig=0.167
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=2,dB=3,n=3]   -- min eig=0.111
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=3,dB=1,n=1]   -- min eig=1
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=3,dB=1,n=2]   -- min eig=0.5
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=3,dB=1,n=3]   -- min eig=0.333
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=3,dB=2,n=1]   -- min eig=0.5
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=3,dB=2,n=2]   -- min eig=0.25
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=3,dB=2,n=3]   -- min eig=0.167
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=3,dB=3,n=1]   -- min eig=0.333
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=3,dB=3,n=2]   -- min eig=0.167
[PASS] Prop 3.1 interior point: PSD-strict & sum_i Tr_B J_i = I_A  [dA=3,dB=3,n=3]   -- min eig=0.111
[PASS] Thm 4.2 step: g |-> eps o (g (x) id_E) is AFFINE (indeed linear) on Choi operators   -- verified on a genuine affine combination of Kraus lists
[PASS] Chan(B,B) interior point exists (depolarising Choi PD)  [dB=1]   -- min eig=1
[PASS] Chan(B,B) interior point exists (depolarising Choi PD)  [dB=2]   -- min eig=0.5
[PASS] Chan(B,B) interior point exists (depolarising Choi PD)  [dB=3]   -- min eig=0.333

==============================================================================
B. Missing lemma -- affine bijection implies equal affine dimension
==============================================================================
[PASS] Lemma: hypothesis 'convex' is essential (parabola: L injective on set, dim drops)   -- graph of x^2 is injectively mapped to the line, dim 2 -> 1
[PASS] Lemma mechanism: ker-L direction moves an interior point inside C [k=3,m=2]
[PASS] Lemma mechanism: ker-L direction moves an interior point inside C [k=4,m=2]
[PASS] Lemma mechanism: ker-L direction moves an interior point inside C [k=4,m=3]

==============================================================================
C. The Diophantine gap in [1] and the square-gap (Chan, B = E)
==============================================================================
[PASS] Diophantine family (k, 2k, 2k^2-1) solves d_R^2 = d_E^2(d_B^2-1)+1
[PASS] Example (4,8,31) satisfies the equation   -- 8^2*(4^2-1)+1 = 31^2
[PASS] Example (2,4,7) satisfies the equation   -- 4^2*(2^2-1)+1 = 7^2
[PASS] Example (8,16,127) satisfies the equation   -- 16^2*(8^2-1)+1 = 127^2
[PASS] Pell branch d_B=2 (sonnet2/grok3): (d_R,d_E) = (2,1),(7,4),(26,15) all solve
[PASS] grok2's example (d_B=1 -> d_R=1, any d_E) is the trivial solution only
[PASS] meta-review's '70 solutions with d_E<400, d_B<60' -- reproduced exactly once the trivial d_B=1 family is excluded: 70   -- with d_B=1 included: 468 (the 398 extra are the trivial d_B=1, d_R=1 solutions); first non-trivial: [(2, 4, 7), (2, 15, 26), (2, 56, 97)]
       (with d_E=1 included the box gives 527 solutions)
[PASS] SQUARE-GAP: d_E^4-d_E^2+1 is never a perfect square for 2 <= d_E < 200000   -- counterexamples: []
[PASS] SQUARE-GAP (symbolic): (e^2-1)^2 < e^4-e^2+1 < e^4  for all e >= 2   -- lower gap = e**2, upper gap = e**2 - 1
[PASS] SQUARE-GAP: e=2 gives 13 (between 9 and 16) -- sonnet2's check

==============================================================================
D. Theorem 4.2 -- two-equation / intercept elimination (symbolic)
==============================================================================
[PASS] Thm 4.2 (n=1,2 elimination): forces E = 1 and X = B  [pdf's slope + intercept]   -- solution: [{E: 1, X: B}]
[PASS] Thm 4.2 (intercepts only): n*d_R^2-1 = n*d_E^2*d_B^2-d_E^2 forces d_E^2 = 1   -- -1 = -d_E^2 at n = 1 once slopes match
[PASS] pdf 'two-grade affine-dimension defect': q(2) - 2 q(1) = d_E^2 - 1

==============================================================================
E. Counit determinism (Lemma 4.1), incl. the triangle-identity route
==============================================================================
[PASS] Lemma 4.1: the p-outcome dummy instrument {Phi/p} is CP with sum = Phi (TP)
[PASS] Lemma 4.1: trace-and-prepare K_i = |0><i| is a 1-outcome CPTP map A -> B (so m | 1 => m = 1); primes play no role   -- sum_i K_i^dag K_i = I_A (dA=3, dB=2)
[PASS] Triangle identity route: only the monoid (N+,x) having no nontrivial units is used   -- irreducibility of primes plays no role (corrects pdf section 6 item 1)
[PASS] Triangle identity at A = C (monoidal unit) pins eps_E (B = E is in im F)   -- eps_{F(1)} o F(eta_1) = id_{F(1)}, F(1) = E

==============================================================================
F. Left adjoint obstruction (both categories)
==============================================================================
[PASS] Left adjoint (Instr): A = B = C gives 0 = d_E^2 - 1, so d_E = 1
[PASS] Left adjoint (Chan): C is terminal (unique discard) but F_E(C) = E is not (Chan(E,E) has >= 2 maps), so F_E cannot be a right adjoint   -- qualitative -- terminal objects are preserved by right adjoints
[PASS] Instr(C,C) has >= 2 morphisms, so C is not terminal in Instr   -- {1} and {1/2,1/2} are distinct legitimate instruments
[PASS] Chan(E,E) has >= 2 elements for d_E >= 2 (id vs depolarising), so E is not terminal   -- and Chan(C, E) = states of E has affine dim d_E^2 - 1 >= 3 for d_E >= 2
[PASS] Instr has NO terminal object: T terminal => Hom(C,T) = 1 pt => d_T = 1 => T = C, but Hom(C,C) >= 2  (contradiction)   -- and dually no initial object (Hom(C,C) >= 2 again)
[PASS] Consequence: no left/right asymmetry in the obstruction -- both adjoints are absent for d_E > 1   -- so the pdf's asymmetry narrative is unsupported

==============================================================================
G. Classical analogue (FinStoch instruments)
==============================================================================
[PASS] Classical: n = 1 is satisfiable (no square constraint!) e.g. |E|=|B|=2 -> |R|=3
[PASS] Classical: n = 1 AND n = 2 jointly force |E| = 1 (intercept mismatch -1 vs -|E|)   -- solution: [{r: b, s: 1}]
[PASS] Classical: exhaustive search finds no integral solution with |E| > 1
[PASS] Classical vertex count: |B|^|E| > |E|(|B|-1)+1 for |B|,|E| >= 2 (strict)
[PASS] CONTRAST: quantum killer is n=1 at B=E (square-gap); classical killer is n=2 (no square constraint classically)   -- reason the grading/intercept engine is genuinely needed for the classical analogue

==============================================================================
H. Normalisation explanation (CPM vs Chan/Instr) and CPM closure
==============================================================================
[PASS] Normalisation bookkeeping [dA=2,dE=2,dB=3]: TP slices differ by d_A^2(d_E^2-1) = 12   -- 128 vs 140
[PASS] Normalisation bookkeeping [dA=3,dE=2,dB=2]: TP slices differ by d_A^2(d_E^2-1) = 27   -- 108 vs 135
[PASS] Normalisation bookkeeping [dA=2,dE=3,dB=4]: TP slices differ by d_A^2(d_E^2-1) = 32   -- 540 vs 572
[PASS] CPM: both hom-spaces have the same ambient dimension d_A^2 d_E^2 d_B^2 (so no obstruction before normalisation)
[PASS] CPM is compact closed => -(x)E HAS a right adjoint (E* (x) -) there, while containing irreversible maps (trace, discard)   -- adjointness is therefore NOT a signature of reversibility
[PASS] Reversible-case test: in the unitary groupoid F_E has no right adjoint whenever d_E does not divide d_B (left hom-set empty, R(B) would need an empty hom-set)

==============================================================================
I. Strictification: what the lexicographic fix does and does not give
==============================================================================
[PASS] Category axioms: with outcome sets [n] and lexicographic product, COMPOSITION is strictly associative (mixed-radix encoding agrees)   -- (n,m,k) = (2,3,4), (3,3,2), (5,2,3) -- meta-review's fix is correct
[PASS] Category axioms: unit law holds strictly ([n] x [1] = [n] = [1] x [n])
[PASS] Monoidal structure: the interchange law for (x) holds only up to a label PERMUTATION ([mq]x[np] vs [mn]x[qp] order the 4-tuple differently)   -- e.g. (j,k,i,t)=(0, 0, 1, 0): left index 2 vs right index 4
[PASS] => Cor. 4.4 (non-monoidal-closure) needs the relabelling quotient / a weak monoidal structure; Thm 4.2 itself needs only F_E as an endofunctor, which the lexicographic model makes strict   -- meta-review correct about the category; sonnet2 correct about (x)

==============================================================================
K. ESCAPES, THE UNIFORM-IN-n THEOREM, AND THE DEFECT (Thm 4.6, Prop 4.7, Prop 5.6)
==============================================================================
[PASS] Thm 4.6: g = e^2 - (e-1)/n lies strictly between (e-1)^2 and e^2 and is never a square (e<=120, n<=120, n | e-1)   -- counterexample: None
[PASS] Prop 4.7: brute-force escapes (g square) = factorised escapes (c = j(2w-j)), i.e. the classification is complete   -- 11 escapes for d_E<=8, d_B<=30; symmetric difference: []
[PASS] Prop 4.7 example (a): the Pell family (d_B, d_E, d_G) = (k, 2k, 2k^2-1) is the j = 1 escape
[PASS] Prop 4.7 example (a)': at n = 1 the j = 1 escapes are exactly d_B = d_E/2 (d_E even)
[PASS] Prop 4.7 non-boundary escape: (d_E,d_B,n,j)=(15,2,1,4) gives c=224, d_G=26 and matched affine dimensions
[PASS] Prop 4.7 example (b) / Thm 4.6: B = E admits no escape (e<=200)
[PASS] Prop 4.7 example (c): B = C escapes with j = d_E-1, d_G = 1 for every d_E >= 2
[PASS] Prop 4.7 example (c)': Instr_1(A, C) has affine dimension d_A^2(1*1-1) = 0 for every A, so both hom-sets are single points: the escape is genuine (though degenerate)
[PASS] cross-validation: the 70 n = 1 solutions in d_E<400, d_B<60 are reproduced by the factorisation criterion   -- 70 vs 70
[PASS] Prop 5.6(1): delta_n = n(ev - r) + (1 - e) is affine in n
[PASS] Prop 5.6(4): if the n = 1 count is matched, delta_2 = e - 1
[PASS] Prop 5.6(3): min_r max_n |delta_n| = e-1, attained at r = e*v (checked over e<=5, v<=9)
[PASS] Cor 5.7: d_R^2 = e^2 - (e-1)/n lies between (e-1)^2 and e^2 and is never a square (no n-outcome ensemble space represents Instr_n(E,E); e<=149)
[PASS] companion route: (e-1)^2 < e^2 - e + 1 < e^2 for all e >= 2, and never a square   -- checked to e = 20000

==============================================================================
L. THE OPEN-PROBLEMS DOCUMENT: EVALUATION AND VERIFICATION (S4)
==============================================================================
[PASS] L1a quadrilateral: v_l = 1/4 + delta*beta_l*a is positive definite (beta=(1,-1,2,-2))   -- sum_l v_l = 1_E
[PASS] L1b quadrilateral: P_T = {c >= 0 : sum c_l v_l = 1} has EXACTLY the four listed vertices (all basic feasible solutions enumerated)   -- found [(0, 0, 2, 2), (0, 8/3, 4/3, 0), (2, 2, 0, 0), (8/3, 0, 0, 4/3)]
[PASS] L1b' quadrilateral: the four effects v_1..v_4 are pairwise non-proportional (so f_l are pairwise non-proportional and the four rays are distinct)   -- v_l = lam*v_m forces lam = 1 and beta_l = beta_m, impossible for l != m
[PASS] L1b'' quadrilateral: the four vertices are distinct, span a 2-plane (affine rank 2), and each one lies OUTSIDE the triangle of the other three (its exact barycentric coordinates have a negative entry: -1/2, -2, -1, -1), so the face is a genuine quadrilateral and not a simplex   -- degenerate vertices: []
[PASS] L1c quadrilateral: all four extreme instruments are trace-preserving (sum = 1_E)
[PASS] L1d quadrilateral: their marginals are linearly independent (recorded-mixing extremes)
[PASS] L1e quadrilateral: (1/2)e12 + (1/2)e34 = (1/4)e34 + (3/8)e14 + (3/8)e23 exactly
[PASS] L2a Instr_0 example: A=1/5+x, B'=3/10-x, C=1/4+x, D=1/4-x are positive (x = sigma_z/10) and sum to 1_E
[PASS] L2b Instr_0 example: pair-sums A+B' = C+D = 1/2 and A+D = 9/20, C+B' = 11/20 are all scalars
[PASS] L2c Instr_0 example: (1/2)a_AB + (1/2)a_CD = (9/20)a_AD + (11/20)a_CB = {A,B',C,D}
[PASS] L2d Instr_0 example: all four atoms are irreducible (no component is a scalar multiple of 1_E)
[PASS] L2e Instr_0 example: pulled-back multisets have trace multisets {1/2,1/2} vs {9/20,11/20} -- unequal, which is the contradiction
[PASS] L3a Lemma K: rank-r PSD manifold has tangent dimension 2Nr - r^2 (N = d_E d_B, r <= min(N,d_E*d_B)); the differential of K -> K K^dag has image exactly 2Nr - r^2 (kernel = the u(r) stabiliser)
[PASS] L3b Lemma K: Tr_B restricted to the tangent space is onto Herm(E) (rank d_E^2) at every non-empty rank stratum, giving dim M_r = 2Nr - r^2 - d_E^2   -- at r = 1 with d_E > d_B the stratum is EMPTY (no isometry C^{d_E} -> C^{d_B} exists), so nothing is claimed there; the numerical rank deficiency (8 < 9) is that emptiness showing up
[PASS] L3c Lemma K: extremal channels of Kraus rank exactly d_E exist for d_B >= 2 (K_i = |u><e_i| gives trace preservation and independent {K_i^dag K_j})
[PASS] L3d Lemma K: Kraus rank r > d_E forces dependence of {K_i^dag K_j} (r^2 elements in the d_E^2-dimensional space of E -> E matrices), so extremal channels have r <= d_E
[PASS] L4a block family: K_i = V_i P_i is trace-preserving and {K_i^dag K_j} is linearly independent (so f_theta is extreme in Chan) for (d_E,d_B) in {(2,2),(3,2),(4,2),(2,3),(5,2),(3,3),(8,3)}
[PASS] L4b span condition: 1_E lies in span{K_i^dag K'_l} iff theta = theta' (same pairs, including d_B < d_E)
[PASS] L4c overlap identity (Lemma 2, restated and re-proved): <psi|psi'> 1_E = sum_il <g_i|g'_l> K_i^dag K'_l, verified from a random Stinespring dilation, including with an independent unitary basis change on the second dilation
[PASS] L5a Instr_0 square-gap (B = E): d_V^2 = d_E^4 - d_E^2 + 1 lies strictly between (d_E^2-1)^2 and d_E^4, hence is never a square (d_E <= 3000)
[PASS] L5a' the source's B = C count d_R^2 = d_E^4 - d_E^2 + 1 is the same number (states of R versus extreme POVMs on E: d_R^2 - 1 = d_E^2(d_E^2 - 1))
[PASS] L5a'' ADJUDICATION (escape): the Instr_0 dimension count has the boundary family d_B=d_E/2=k, with d_V=2k^2-1, but this is not exhaustive; the non-boundary triple (d_E,d_B,d_V)=(15,2,26) also solves d_V^2=d_E^2(d_B^2-1)+1. Thus dimension counting alone is escape-prone for general B; the source's general-B theorem must (and does) use its separate irreducibility/genericity route
[PASS] L5b cg count: d_R^2 = (d_E^2 d_B)^2 - (d_E^2 - 1) is never a square (d_E, d_B < 400, as in the source, plus the sandwich proof)
[PASS] L5b' cg count (symbolic): (e^2 b - 1)^2 < (e^2 b)^2 - (e^2 - 1) < (e^2 b)^2, the gap below being e^2(2b-1) > 0 and the gap above e^2 - 1 > 0
[PASS] L6a dyadic congruence: {E,2E} is NOT equivalent to {3E} (bounded reachability search plus invariant)
[PASS] L6b dyadic congruence: {Phi/3,Phi/3,Phi/3} ~ {2Phi/3,Phi/3} but NOT ~ {Phi}
[PASS] L6b' the mantissa/weight invariant is consistent with every move and separates the pairs {E,2E} vs {3E} and {Phi/3 x3} vs {Phi}
[PASS] L6b'' k-fold (rational) merge collapses {E,2E} ~ {3E} but keeps {E, sqrt2 E} apart   -- rational merging identifies all rational multiples; irrational ones stay in distinct orbits
[PASS] L6c equal-only merging: canon({E,E,E'}) = canon({2E,E'}) = {2E, E'} (same formal instrument)
[PASS] L6c' the 'merge all equal at once' canonicalisation is NOT a congruence: with T = {F,F'} such that F'oE = FoE' = X, FoE = P, F'oE' = Q one gets different canonical forms   -- T o S -> (('FoE', 2), ('FoEp', 1), ('FpoE', 2), ('FpoEp', 1)), T o S' -> (('Fo2E', 1), ('FoEp', 1), ('Fpo2E', 1), ('FpoEp', 1))
[PASS] L7a Q-simplex retraction: tau_t = 1/4 + beta_t sqrt(2)/20 are positive and sum to 1
[PASS] L7a' the four rational scalings give valid ensembles (total weight exactly 1 each)
[PASS] L7b Q-simplex retraction: the two decompositions reproduce the same ensemble (per-state weights match exactly, before merging)
[PASS] L7c Q-simplex retraction: e12 is Q-extreme ({1, sqrt2} are Q-independent, so the two rational equations force q = (2,2,0,0))
[PASS] L8a0 (E0), scalar step: <Omega|(|i><j| (x) Y)|Omega> = sum_{kl} delta_ki delta_jl <k|Y|l> = <i|Y|j> (symbolic; the Kronecker deltas collapse the double sum)
[PASS] L8a (E0): ev(C(f) (x) Y) = f(Y) for every linear f and every Y (checked numerically against f(Y) = sum_{a,c} Y[a,c] f(|a><c|) for a random f and Y)
[PASS] L8b Choi linearity (source Section 0): (id (x) k)(C(f)) = C(k o f) for a linear (not necessarily CP) k -- so composing is a fixed linear operation on Choi operators, verified numerically
[PASS] L8c Psi(f) is CP for every CP f ('its Choi operator is C(f)/d_E up to reordering of tensor factors', i.e. a permutation conjugation): the Choi operator of Psi(f) is PSD
[PASS] L9a typed hom [E,B]: dim = d_E^2(d_B^2 - 1) = dim State(E* (x) B) - (d_E^2 - 1) via the trace-preserving constraint rank
[PASS] L9b graded typed system: the codimension of the admissible slice in the block-diagonal state space is d_E^2 - 1, independent of n
[PASS] L10 cg top stratum: extreme instruments with exactly d_A^2 components exist (explicit positive-definite, linearly independent marginals summing to 1_E)
[PASS] L11 lookup-table processor: the 2-program register is an isometry and reproduces the programmed channel exactly from its basis program
[PASS] L12 response-map rank (Lemma B): rank of Lambda: Herm(R) -> prod_j Herm(E), h -> (eps_j(h))_j equals (m-1)d_E^2 + 1 whenever dim Herm(R) allows it -- dim R = 4, m = 4 -> 13 and dim R = 5, m = 6 -> 21 (both d_E = 2), while dim R = 3 caps the rank at 9 < 13   -- computed 13, 21, 9
[PASS] L13a genericity (source Thm 4(b)): for generic qubit POVMs with k = 5, 6, 7 effects the real kernel of (a_l) -> sum a_l M-bar_l has dimension k - 3 = 2, 3, 4   -- computed [np.int64(2), np.int64(3), np.int64(4)]
[PASS] L13b genericity: the only kernel vectors with entries in [-3,3] are multiples of (1,...,1), and no proper subset of the effects sums to a scalar multiple of 1_E (k = 5, 6, 7, qubit)
[PASS] L13c genericity: for d_E = 3 the map (a_l) -> sum a_l M-bar_l has k - (d_E^2 - 1) dimensional kernel, so k = 6 (resp. 8) gives the one-dimensional kernel spanned by (1,...,1) (resp. 0); in both cases the only kernel vectors with entries in [-3,3] are multiples of (1,...,1) and no proper subset sums to a scalar   -- computed [(np.int64(1), True, False), (np.int64(1), True, False)]
[PASS] L14a Corollary 1: C(f)/d_E is a state (PSD, trace one) for every channel f, so the admissible slice of [E,B] is an affine copy of Chan(E,B)
[PASS] L14b Theorem 1 round trip at A = C: Phi(Psi(f)) = f, i.e. d_E*ev(C(f)/d_E (x) Y) = f(Y) for all Y (so Psi then Phi returns the channel)
[PASS] L15a extremes iff independent marginals, 'independent => extreme' direction: the only solution of sum_l w_l v_l = 0 for three independent positive marginals of Herm(C^2) is w = 0, so any decomposition forced to have the same marginals is trivial
[PASS] L15b 'dependent => not extreme' direction: duplicating a marginal gives the relation (1,0,-1,0); a perturbation c -> c + eps*w of the weights keeps the constraint sum_l (c_l + eps w_l) v_l = 1_E for every eps and keeps all weights positive for small eps (so the element is a non-trivial recorded mixture)
[PASS] L15c Caratheodory bound: k marginals in Herm(C^{d_A}) are linearly dependent once k > d_A^2, so extreme instruments have at most d_A^2 components (numerically: random k = d_A^2 + 1 tuples have rank <= d_A^2 for d_A = 2, 3, 4)
[PASS] L16a D^omega: the four orbit-weight vectors of the source lie in the quadrilateral P_T (c >= 0, sum c_l = 4, beta.c = 0) and are exactly its vertices; the mixing weights 1/2, 1/2, 1/4, 3/8, 3/8 are all dyadic rationals (3/8 = 3*2^-3), as required for iterated midpoint mixing in the infinite-merge quotient
[PASS] L16b D^omega: the two decompositions agree orbit-by-orbit (same w-vector on each of the four rays), which is the exact-arithmetic content the source reuses from the quadrilateral
[PASS] L17a Bell-slice counit: eps = d_E * ev is trace-preserving on the admissible slice ([E,B] (x) E): tr eps(C(f)/d_E (x) tau) = tr f(tau) = 1 for every channel f and state tau
[PASS] L17b Bell-slice counit is NOT trace-preserving off the slice: for generic (normalised, PSD) X on E* (x) B the trace differs from 1 (computed values for the three cases; the defect is example-dependent -- the source's '0.97' is one such instance, not a theorem)   -- off-slice traces: [0.7226, 0.9932, 1.0659]
[PASS] L18 Instr_0 (no merging): with A + B' = C + D = 1/2 and A + D = 9/20, C + B' = 11/20 the identity holds LITERALLY, component by component: (1/2)*(2A) = A, (9/20)*(20/9)A = A, ... so the two multisets are equal as multisets of four components (no cancellation needed)   -- each component of the two sides is literally one of A, B', C, D; no merging is used
[PASS] L19 the Kraus-rank invariants also rule out direct sums: no (d_E, d_B, R, S) with d_E, d_B >= 2 matches dim State(M_R (+) M_S) = R^2 + S^2 - 2 and extreme-set dimension 2 max(R-1, S-1) simultaneously (search to 199)   -- solutions: []
[PASS] L20a C.20 top stratum: explicit positive definite TP Choi tuples have a^2 independent marginals (a=1..4, b=1..3)
[PASS] L20b C.20 normalization affine dimension: k*a^2*b^2-a^2, maximized at k=a^2 to a^2(a^2*b^2-1)
[PASS] L20c C.20 finite-counit obstruction: the one-slice value lies strictly between consecutive squares, including b=1; the A=C and A=C^2 equations are incompatible (e=2..100,b=1..30)
[PASS] L21a C.21 exact Kraus-support slice rank: nullity is 2 for d_E=2 and 1 for d_E=3..7   -- ranks={2: 2, 3: 3, 4: 3, 5: 3, 6: 3, 7: 3}
[PASS] L21b C.21 state-space face obstruction: k^2-1 is never 1 or 2 for finite k>=1
[PASS] L22a C.22 endpoint channels are TP and the combined Kraus family has full support rank (d_E=2..7; d_B=2,3,5)
[PASS] L22b C.22 exact trace-constraint rank is d_E^2-2, hence the supported TP face has affine dimension 2 for every tested pair including d_B<d_E   -- nullities=[2]
[PASS] L23 C.23 scalar overlap: for distinct angles in (0,pi/2), sin(delta) forces gamma_P=gamma_Q=c=0; at delta=0 the rank drops as expected
[PASS] L24 C.19 exact trace functional: maximally mixed tau gives unit trace on the admissible slice, while nonmaximally mixed tau gives off-slice product-state witnesses on both sides of 1 (d=2..7)
[PASS] L25a C.11 D^omega exact quadrilateral: each target extreme has two independent supported marginals on distinct rays
[PASS] L25b C.11 source midpoint geometry: a multi-orbit probability vector splits nontrivially, while a one-orbit probability vector cannot split by positivity
[PASS] L26 C.26 finite instance: controlled identity/Z processor is CP and TP and basis programs implement two distinct channels
[PASS] L26b C.26 finite instance: a coherent superposition and its dephased program state are distinct but have the same processor output
[PASS] L27a fixed grade-2 slice: two distinct TP positive pairs average componentwise to AB
[PASS] L27b operation boundary: the fixed-grade average has two components, while an Instr_0 recorded union of its two grade-2 inputs has four; this is not an Instr_0 split or a quotient theorem

==============================================================================
J. Terminology / metadata cross-checks (recorded facts)
==============================================================================
       [3] Coecke-Spekkens: Synthese 186(3):651-696, 2012, doi:10.1007/s11229-011-9917-5
           -> pdf's 'Synthese 194, 3185 (2017)' is WRONG
       [4] Oreshkov-Costa-Brukner: Nature Commun. 3, 1092 (2012): process matrices, indefinite causal order
           -> pdf calls it 'process-matrix retrodiction' -- mischaracterised
       [1] doi:10.5281/zenodo.20860298: resolves to Zenodo record 20860299, SOFTWARE: 'MIKEAA2020/opfibration-supplement: Initial supplementary simulation', 2026-06-25, MIT, creator 'MIKEAA2020'
           -> NOT the manuscript title/author given in [1]
       [2] Petz 1988: Quart. J. Math. Oxford 39, 97 (1988)
           -> correct
       [5] Davies-Lewis 1970: Commun. Math. Phys. 17, 239 (1970)
           -> correct; never cited in text
       [6] Ozawa 1984: J. Math. Phys. 25, 79 (1984)
           -> correct; never cited in text
       [7] Selinger 2007: ENTCS 170, 139 (2007); CPM(FHilb) compact closed
           -> correct; never cited in text -- and decisive for the normalisation explanation
[PASS] All seven references checked against external records (see audits/02_REFERENCE_AND_METADATA_CHECK.md)
[PASS] Acknowledgement: LLM-assisted verification; the pdf's own admitted error plus the missing lemma motivate machine-checked or human-checked proofs (this file is one step)

==============================================================================
SUMMARY
==============================================================================
197 checks passed, 0 failed, 197 total

```
