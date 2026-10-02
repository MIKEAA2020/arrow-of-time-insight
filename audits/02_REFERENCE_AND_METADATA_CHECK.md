# 02 — Reference and metadata check (external verification)

All items below were checked against primary records on 2026-10-02, not against secondary sources.
The original audits (S1/S2) could not settle items 1, 3 and 4; they are settled here.

## 1. Reference [1] — MISATTRIBUTED (new finding)

Original citation: *A. Abaee, "The Opfibration Ontology: Separating Causal Order from Quantum
Irreversibility," (2026). Zenodo. https://doi.org/10.5281/zenodo.20860298.*

What the DOI actually resolves to:

* `https://doi.org/10.5281/zenodo.20860298` → 302 → `https://zenodo.org/doi/10.5281/zenodo.20860298`
  → Zenodo record **20860299**.
* Record metadata (Zenodo API): title **"MIKEAA2020/opfibration-supplement: Initial supplementary
  simulation"**; resource type **Software**; publication date **2026-06-25**; version `v1.0`;
  creator **"MIKEAA2020"**; licence **MIT**; file `MIKEAA2020/opfibration-supplement-v1.0.zip`;
  related identifier `isSupplementTo https://github.com/MIKEAA2020/opfibration-supplement/tree/v1.0`.
* Description: *"Supplementary simulation for 'The Opfibration Ontology' manuscript. Demonstrates the
  concrete example of Section 3.4 and verifies the bifibration obstruction (Theorem 3.1)."*

Consequences.

1. The DOI does **not** identify a manuscript titled *"The Opfibration Ontology: Separating Causal
   Order from Quantum Irreversibility"*; it identifies a **software deposit** (the supplementary
   simulation). Title, author string, type and date in [1] do not match the record.
2. A Zenodo search for `opfibration` returns 4 records; none is the manuscript. The manuscript text
   is not publicly indexed under that title (as of 2026-10-02).
3. Therefore the original draft's §1 sentence *"The Opfibration Ontology [1] establishes that …"*
   cannot be checked against a public document, and the claim that [1]'s proof "contained an unproven
   Diophantine claim" is unverifiable from the cited record. Independently, that phrase understates
   the issue: an assertion that `d_R² = d_E²(d_B²−1)+1` has no integer solutions is **false**
   (infinitely many solutions, family `(k, 2k, 2k²−1)`), so the defect was a false claim — or, more
   charitably, a quantifier error (the equation must hold for *every* `B`).
4. Recommended fix: cite the manuscript by its own persistent identifier (or repository), and cite
   the simulation as software, e.g.
   * A. Abaee, *The Opfibration Ontology: Separating Causal Order from Quantum Irreversibility*,
     manuscript (2026).
   * A. Abaee, *opfibration-supplement: Initial supplementary simulation*, Zenodo software,
     DOI 10.5281/zenodo.20860298 (2026), MIT.

## 2. Reference [2] — verified correct

D. Petz, *Sufficiency of channels over von Neumann algebras*, Quart. J. Math. Oxford **39**, 97–108
(1988). Used for: prior-dependent recovery maps (Petz); exact/approximate sufficiency.

## 3. Reference [3] — WRONG as printed

The paper prints "Synthese **194**, 3185 (2017)". Verified correct record: B. Coecke and
R. W. Spekkens, *Picturing classical and quantum Bayesian inference*, **Synthese 186(3), 651–696
(2012)**, DOI `10.1007/s11229-011-9917-5`. (Cross-checked against two independent bibliographies.)
The printed volume/page/year triple does not correspond to this article.

## 4. Reference [4] — correct citation, wrong characterisation

O. Oreshkov, F. Costa, C. Brukner, *Quantum correlations with no causal order*, Nature Commun. **3**,
1092 (2012). The paper is about process matrices and indefinite causal order; it contains no
retrodiction or process-matrix *tomography* construction. The original draft uses it as
"[4] process-matrix retrodiction". Replace, or drop the citation; appropriate replacements for the
retrodiction claim are the pointed-channel/Bayesian-inversion literature.

## 5. References [5], [6], [7] — correct but never cited in the text

* [5] Davies–Lewis, Commun. Math. Phys. **17**, 239 (1970) — operational instruments with general
  outcome spaces; belongs at Def. 2.1 and in the scope discussion (continuous outcomes are outside
  the finite-outcome hypothesis).
* [6] Ozawa, J. Math. Phys. **25**, 79 (1984) — quantum measuring processes of *continuous*
  observables; belongs at Def. 2.1 and is the direct counterexample to §5.2's claim that
  finite-outcome instruments are "the most general post-measurement state updates".
* [7] Selinger, Electron. Notes Theor. Comput. Sci. **170**, 139 (2007) — dagger compact closed
  categories and CP maps. This is the key citation for the corrected explanation: `CPM(FHilb)` is
  compact closed, so `−⊗E` *does* have a right adjoint there; the obstruction lives in the
  trace-preserving normalisation, not in quantumness or irreversibility.

## 6. Author metadata

* The title page prints affiliation "Independent Researcher" beside the address
  `amin_abaee@ut.ac.ir` (University of Tehran). The three audits that flagged this are right:
  make the affiliation and the address consistent (e.g. "Independent researcher; correspondence:
  amin_abaee@ut.ac.ir").
* ORCID `0000-0002-0019-1842` is printed; consistent with the above caveat.
* Author-identifiers cross-check: the Zenodo software record [1]-as-printed lists the creator as the
  GitHub handle "MIKEAA2020", the same handle that owns `arrow-of-time-insight`,
  `opfibration-supplement` and `opfibration-merged-` — i.e. the deposit in [1] is by the same author,
  which strengthens (rather than resolves) the finding in §1: the DOI is the author's own, but it
  points at the *supplement*, not the manuscript.

## 7. Verification aids

* Reference checks: Zenodo REST API (`/api/records/20860298`, `?q=opfibration`), DOI content
  negotiation (`Accept: application/vnd.citationstyles.csl+json`), Crossref-style bibliographies
  (two independent sources) for the Synthese record.
* Arithmetic checks that depend on no references: `verification/verify_claims.py`.
