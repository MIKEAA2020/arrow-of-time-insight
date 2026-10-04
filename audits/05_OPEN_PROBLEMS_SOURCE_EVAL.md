# 05 — Source-claim adjudication and §7.2 disposition

**Source note:** `uploads/sonnet time open problems.txt` (832 lines; supplied with this revision). Line
numbers below refer to that file. The review is against the manuscript's actual definitions and stated
hypotheses, not against the source note's reported numerical checks.

**Mandatory disposition order.** Source claims are handled in this order:

1. **Complete** a claim only after its proof has been checked against the defined category and the full
   range of its hypotheses.
2. **Close** a named §7.2 case with a proved argument; this may be a different, category-specific
   argument from the source's.
3. If the source's broad claim is not established, **replace with a companion** theorem whose narrower
   scope and structural limitation are named in the manuscript, while keeping the unproved remainder
   open.
4. **Drop** only unsupported/redundant proofs or inferences—not named open cases and not valid scope
   limitations.

**Critical category boundary.** Proposition 4.9 applies only to literal finite-tuple, rigidly graded
`Instr` (Definition 2.2). The total-map/record-forgetting functor is generally surjective, not
injective. No `Chan`-restriction is inferred for `Instr_0`, `Instr_cg`, `Instr_D`, `Instr_Q`, `D^ω`,
or other quotients. Those are adjudicated from their own proofs.

**Verification status (2026-10-05 local, Asia/Tehran; run completed 2026-10-04 22:09:35 UTC,
which is 2026-10-05 01:39:35 local).** The independent suite was extended with 15 finite checks
(L20a–L27b; the former L20 placeholder was removed), then run to completion: **196 checks passed, 0
failed**. `verification/verification_log.txt` was regenerated from that run (2026-10-04 22:09:35Z).
The updated `s1.py` category boundary and `face_block.py` numerical probe were also run; C.22 now has
separate exact-rank coverage in L22. These checks do not machine-prove the analytic arguments. The
changelog, final repository review, commit, push, bundle export, and remote-tree verification remain
pending.

---

## 1. Required source excerpts: line-level adjudication

### Lines 145–162 — pointwise “all variants” theorem

The note states a finite-dimensional pointwise theorem for `d_E,d_B≥2` across `Chan`, graded `Instr`,
`Instr_0`, dyadic/rational quotients, and `Instr_cg`; it explicitly leaves several `B=ℂ` variants open
at lines 160–163. Its proposed block-Kraus overlap proof is **not adopted as a blanket theorem**. In
particular, its span/orthogonality argument is not a substitute for checking the actual morphism
quotient, and its later versions use hypotheses (finite-outcome counit, separable program, or a particular
orbit model) that cannot be suppressed.

Disposition by category:

- `Chan`: finite-dimensional state-space non-isomorphism is independently proved in C.2; the point
  `B=ℂ` is separately trivial for deterministic channels.
- Literal graded `Instr`: the strict-grade reduction in Proposition 4.9 is applicable only here and
  only to Definition 2.2; combine it with the deterministic result in the main finite-dimensional
  category.
- `Instr_0`: C.10 supplies a separate no-merging/atomicity proof, including `B=ℂ`, all nonzero `B`,
  arbitrary `R`, and finite or countable outcome multiplicity.
- `Instr_cg`: C.8 closes finite or countably supported ray measures for arbitrary `E,B,R`, including
  `B=ℂ`.
- Finitary dyadic `Instr_D`: C.12 closes arbitrary `E,B,R` for a finite counit; C.23 closes countable
  counits when `E` is finite. C.5 separately handles a separable program register when both dimensions
  are at least two.
- Rational `Instr_Q`: C.12 is limited to the finite-outcome quotient/finite counit. No countably
  supported rational-merge category is inferred from it.
- `D^ω`: C.11 uses the note's explicit countably supported `2^ℤ` orbit-weight model and midpoint
  mixing; it is not conflated with finitary `D`.

Thus the source's finite-dimensional theorem is not cited as authority. The paper closes the listed
cases via the proofs above, with the separate hypotheses printed in §7.2/C.13 and C.27.

### Lines 171–227 — “large-stratum” arguments for `Instr_0`, `D`, and `Q`

The note proposes a `k=m+1` construction, where `m` is the number of counit outcomes, and a genericity
argument for `Instr_0`; it then proposes rational/dyadic rigidity. The direct sketches are **replaced**,
not silently generalized:

- Their `k=m+1` step is a finite-counit argument. It does not itself handle a countably infinite
  counit (`m=∞`), and the stated genericity paragraph does not supply a complete infinite-dimensional
  affine/Baire proof for arbitrary effects.
- The source's finite-rational/dyadic proof uses algebraic-independence claims but does not fully
  reconcile the coefficients with the exact finite split/merge orbit. C.12 gives an explicit
  Q-independent scalar construction and explains why every component coefficient in a finite
  equivalence is dyadic/rational.
- C.10 replaces the `Instr_0` argument with the literal pair-sum/atomic-factorization proof; it does
  not rely on a graded reduction.
- C.23 extends only finitary `D` to countably many counit outcomes for finite-dimensional `E`; it does not
  extend `Instr_Q` or settle infinite-dimensional `E` with non-separable `R`.

The source's stated B=ℂ gaps are closed only in the scopes just listed. In particular, retain the
open `D`, `dim E=∞`, non-separable `R`, countably infinite-counit-outcome case (R1), and do not invent a
countable rational quotient (R2).

### Lines 618–629 — infinite-dimensional overlap sketch

The source invokes a family of pairwise orthogonal program vectors and concludes a contradiction only
from a separability/finite-dimension bound. It explicitly assumes separable `R` for its infinite
Theorem 5; its “dimension at least `2^ℵ₀`” sentence is not a contradiction for non-separable `R`.
The block-channel extremality step relies on normal CP Radon–Nikodym/Arveson facts that were not
verified in the note. C.5 independently proves the needed separable-register no-go using a complete
common Stinespring environment, with the register hypothesis stated. C.26 constructs a non-separable
surjective lookup processor and proves non-injectivity; it does not show representability. The
non-separable infinite-input cases remain open as recorded in R1/R4.

---

## 2. Ordered disposition: complete → close → replace with companion → drop

The stages below are deliberately ordered. **Complete** records arguments whose proof and hypotheses
were checked; **close** records the named cases those results settle; **replace with companion** states
a narrower proved result while preserving the broader gap; **drop** removes only an unsupported proof or
inference, never a still-open case.

### 2.1 Complete: source claims checked in their stated/explicit scopes

| Source claim / location | What is completed | Exact scope / certificate |
|---|---|---|
| A4, first semialgebraic dimension route, l.29–38 | C.20 supplies the missing strata and finite-permutation bookkeeping; its one-slice square gap includes `B=ℂ`. | Finite-dimensional `A,B`; finite-counit consequence additionally assumes finite `R`. The source's sketch itself is not treated as a proof. L20a–c check finite instances. |
| A6/Thm 8, cg quadrilateral, l.288–330 | C.8 proves the four-vertex/non-simplex obstruction and its pullback. | `d_E≥2`, arbitrary nonzero `B,R`, finite or countably supported ray outcomes. L1a–e provide exact arithmetic. |
| Source Thm 5 / overlap, l.233–243 and l.618–629 | C.5 independently proves the normal-channel no-go with its register hypothesis. | `dim E,dim B≥2`, separable candidate register; complete bases in a common Stinespring environment. It does not exclude non-separable `R`. |
| Source B8 isometric-face invariant, l.612–614 | C.21 proves the two-isometric-channel face calculation. | Finite `E`, `dim B≥d_E`; face dimension 1 for `d_E≥3`, 2 for `d_E=2`. L21a–b check exact finite cases. |
| Source Thm 6, finite block-face claim, l.246–253 | C.22 proves the separate block-channel result and identifies the supported Choi slice as the minimal face of the endpoints. | Finite `d_E,d_B≥2`, including `d_B<d_E`; L22a–b check endpoints, support and exact trace-map rank for `d_E=2,…,7`, `d_B∈{2,3,5}`. |
| E5, `D^ω`, l.454–460 | C.11 gives the orbit-weight/midpoint proof with source atoms and target quadrilateral treated separately. | The stated `2^ℤ` orbit-weight model; not the finitary `D` quotient. L16/L25 check orbit identities and finite support examples. |
| Typed category/internal hom, l.711–832 | C.15–C.19 rederive the affine-slice tensor closure and weighted-Choi adjunction. | Finite-dimensional typed inputs. Bell evaluation is TP only on the admissible slice; C.19 states the generic trace-defect proposition (L17/L24 finite checks). |
| Non-separable lookup processor, l.631–641 | C.26 proves a normal block-diagonal lookup processor and its non-injectivity. | Arbitrary normal channel hom-set; this is a processor limitation, not a representation. Finite instance L26a–b. |

### 2.2 Close: named pointwise cases, with category-specific proofs

| Named case / source | Closing result | Hypotheses that remain attached |
|---|---|---|
| Finite-dimensional deterministic `Chan` and its state-space claim, source l.145–162 | C.2–C.3 rule out affine isomorphism to normal state spaces for finite `d_E,d_B≥2`; `B=ℂ` is separately a point. | No propagation to quotients. The finite-dimensional direct-sum result is as stated in C.3. |
| `Instr_cg`, including the source's `B=ℂ` gaps | C.8 closes the pointwise representability case. | Arbitrary nonzero `B,R`; finite/countably supported rays; `d_E≥2`. |
| Literal rigidly graded `Instr` | Proposition 4.9 transfers the deterministic non-closure to the literal category of Definition 2.2. | Finite-tuple, strict grade with zero/repeated components counted; this is the sole use of the grade reduction. |
| No-merging `Instr_0`, source Thm 4(a) and Thm 7 | C.10's pair-sum/atomicity proof closes the pointwise case, including `B=ℂ`. | Arbitrary Hilbert `E,B,R` with `d_E≥2`; finite or countable outcome multiplicity. No compactness/separability premise. |
| Finitary dyadic `Instr_D` and finite-outcome rational `Instr_Q`, source Thm 4(b) | C.12 closes both finite-counit cases. | Arbitrary Hilbert `E,B,R`, `d_E≥2`, finite counit. `Instr_Q` remains the finite-outcome quotient. |
| Countably supported counit in finitary `D` | C.23 closes the finite-input case. | Finite-dimensional `E`, `d_E≥2`, arbitrary `B,R`; the infinite-input/non-separable/countable-counit case remains R1. L23 checks only the scalar overlap equation, not the full theorem. |
| `D^ω` | C.11 closes the explicit infinite-merge dyadic model. | Its real orbit weights and midpoint mixing; no countable rational-merge category is inferred. |

**Strict-grade boundary.** Proposition 4.9 does not restrict a quotient-category adjunction to `Chan`.
`Instr_0`, `Instr_cg`, `Instr_D`, `Instr_Q`, and `D^ω` are closed only by the category-specific
arguments listed above; the total-map functor is generally surjective, not injective.

### 2.3 Replace with a companion: narrower results and named limitations

| Broader source claim / location | Companion result | Structural limitation kept open |
|---|---|---|
| Source Thm 6's unrestricted/infinite-dimensional face extension, l.246–253 | C.21 covers finite `E` with `dim B≥d_E`; C.22 covers every finite pair `d_E,d_B≥2`. | Neither proves a face theorem for infinite-dimensional `E`; R4. C.22 is not an extension of the isometric construction below `d_B=d_E`. |
| Measurable `cg`, l.466–474 | C.25 defines finite-dimensional ray-measure instruments, weighted-pushforward composition, and its own quadrilateral no-go. | Equivalence to every intended labelled standard-Borel quotient, disintegration choices, and non-finite-dimensional objects remain open (R2). |
| `𝒯`/`Caus` remark, l.830 | C.24 proves closedness, flatness and tensor equality for balanced finite-dimensional slices. Kissinger–Uijlen, Definition 4.2 requires invertible scalar multiples of the transpose-discarding state in `c` and the discard effect in `c^*`; for normalized finite-dimensional slices this reads `I/d∈S` and `I∈S^⊥`. | The full arXiv v6 HTML text at `https://arxiv.org/html/1701.04732` was inspected; direct PDF fetches at `https://www.cs.ru.nl/~suijlen/cat-causal-full.pdf` and `https://arxiv.org/pdf/1701.04732` failed. Flatness excludes unbalanced slices; maximality/full equivalence beyond the balanced subcategory remains R5. |
| Infinite-input / non-separable dyadic case, source l.475–481 | C.12 covers finite counit; C.23 covers countable counit for finite `E`; C.5 covers a separable program register in the normal `dim E,dim B≥2` case. | Infinite `E`, non-separable `R`, countably supported `D` counit remains R1 (including the separately stated `B=ℂ` boundary). |

### 2.4 Drop: unsupported proofs/inferences only; preserve the open cases

| Source proof or inference | Disposition | What is not dropped |
|---|---|---|
| Blanket block-Kraus all-variant proof, l.145–162 | Do not use as a universal proof across categories; close its named pointwise cases only by §2.2. | The `B=ℂ`, quotient and infinite-dimensional scopes listed in R1–R4. |
| Large-stratum/genericity proof for `Instr_0`, dyadic and rational variants, l.171–227 | Do not rely on the finite `k=m+1` sketch outside its finite-counit hypotheses; C.10/C.12/C.23 are the replacements. | R1 and the undefined countable rational-merge orbit. |
| Source non-separable `Instr_0` partition proof, l.256–268 | Drop the source proof; C.10 is a stronger category-specific replacement for `Instr_0`. Do not extend Prop. 4.9 to a non-separable graded category. | The non-separable graded extension in R4. |
| Non-normal/C*-algebraic extension, l.462–466 | No new theorem adopted from the source's finite-`E` slice-map assertion. | R3. |
| Inference from surjective record forgetting to a `Chan`-restricted adjunction | Reject: surjectivity does not give injectivity or a hom-set bijection. | All independently closed quotient cases and the non-separable gaps. |
| Countable rational-merge extension | Do not define it by changing “finite” to “countable”; positive rational decimal-place terms may sum irrationally (C.12). | This is a definition boundary, not a proved no-go for an undefined category. |
| Formal verification | Do not call finite checks proofs of analytic/category-level claims. | Proof-assistant verification remains R6. |

**No open item is removed by these drops.** R1–R6 remain listed in `paper/REVISED_PAPER.md` §7.2/C.27.

---

## 3. Mathematical adjudication notes

### A4: why the old audit disposition changed

The source itself labels its first semialgebraic route a sketch. The old audit marked it “not used” and
said it could not see `B=ℂ`; that was too strong. In C.20 the ordered `k`-tuple of Choi matrices lies
in an affine normalization space of dimension `k a²b²−a²`; the unordered quotient is finite-to-one;
independent marginals and positive Choi matrices give the full top stratum. The resulting formula is
`dim Ext Hom_cg(A,B)=a²(a²b²−1)`. With a finite counit the inverse adjunction map is piecewise
semialgebraic on the finite support/proportionality patterns. At `A=ℂ`, the equation
`r²=e⁴b²−e²+1` lies strictly between `(e²b−1)²` and `(e²b)²` for every finite `b≥1,e≥2`, so A4
also sees `B=ℂ`. The two-slice alternative gives `e²=1`. This completes A4 only in its finite-dimensional,
finite-counit scope; the countable/arbitrary-register quadrilateral C.8 remains stronger.

### Proposition 4.9: strict grade and no quotient inference

For literal `Instr`, each hom-set has a nonzero outcome-count grade with multiplicative composition.
A counit must have grade one; the adjunction bijection and its inverse preserve grades, and naturality
forces the right adjoint to restrict to `Chan`. This proof depends on strict tuples, zero/repeated
components being counted, and multiplicativity. In `Instr_0`, `Instr_cg`, `Instr_D`, `Instr_Q`, and
`D^ω`, merging, splitting, or zero-dropping destroys the grade. Their pointwise results come from the
category-specific proofs above; the surjective total-map functor is not used as a substitute.

### Two face invariants, two different scopes

- **C.21 / B8:** two isometric channels; requires finite `E` and `dim B≥d_E`; gives a 1- or 2-dimensional
  minimal face according to `d_E≥3` or `d_E=2`.
- **C.22 / block-channel companion:** uses a combined Kraus support with a two-dimensional TP slice;
  applies to every finite pair `d_E,d_B≥2`, including `d_B<d_E`.

Both exclude normal state-space isomorphisms in their finite-input scopes, but C.22 is not a proof that
the isometric construction works below `d_B=d_E`. Neither is asserted for infinite-dimensional `E`.

### Residual source claims kept visible

1. Finitary `D` with `dim E=∞`, non-separable `R`, and countably infinite counit (source l.475–481).
2. The intended standard-Borel labelled quotient versus the explicit finite-dimensional ray-measure
   category (source l.466–474).
3. Non-normal/C*-algebraic states (source l.462–466).
4. Infinite-dimensional `E` extensions of the source's channel-face theorem and non-separable graded
   instrument partition proof (source l.246–268); C.5 still requires a separable program register.
5. Full `𝒯`/`Caus` equivalence/maximality beyond balanced slices (source l.830).
6. Formal proof-assistant verification of analytic/category results.

These correspond to R1–R6 in `paper/REVISED_PAPER.md` §7.2/C.27. In particular, `B=ℂ` with infinitely
many counit outcomes is **not** declared uniformly open or closed: it is closed for `cg`, `Instr_0`,
finite-input `D`, and separable-register normal models where applicable; the infinite-input,
non-separable, countably supported-counit `D` case remains open, and countable `Q` is undefined.

---

## 4. Verification cross-reference and release work

The refreshed suite has **196 checks, 0 failures**; its exact per-check output and package versions are
in `verification/verification_log.txt`. New coverage:

- L20a–c: finite-dimensional positive TP top-stratum witnesses, dimension formula/monotonicity, and
  finite-counit square-gap/two-slice arithmetic for C.20;
- L21a–b: exact Kraus-support ranks and the finite-rank state-face dimension gap for C.21;
- L22a–b: exact trace-constraint ranks, endpoint TP, and full combined support for C.22, including
  `d_B<d_E` examples;
- L23: exact scalar overlap equation from the `B=ℂ` part of C.23;
- L24: exact product-state trace witnesses for C.19; L25a–b: exact `D^ω` orbit supports and source
  midpoint tests; L26a–b: finite controlled-channel instance of C.26; L27a–b: grade-preserving
  componentwise slice test kept distinct from the `Instr_0` recorded union.

The script `work/deep/s1.py` was corrected to label its grade-2 componentwise average as a fixed-grade
convex-slice fact—not an `Instr_0` union decomposition or quotient result—and ran successfully. The
separate numerical `work/deep/face_block.py` probe returned nullity 2 for all tested `d_E=2,…,9`,
`d_B∈{2,3,5}`; L22 independently checks the paper's exact-phase construction using exact arithmetic.

Remaining release work is not mathematical adjudication: update `paper/REVISION_CHANGELOG.md`, review
the final diff/status and secret scans, commit and push to the designated remote, export the bundle, and
verify the remote tree. The finite checks are not proof-assistant proofs. “Manually checked” in this
ledger means the stated argument was reviewed against its definitions and hypotheses and its listed
finite certificates were rerun; it does not certify every analytic/category-level inference formally.
