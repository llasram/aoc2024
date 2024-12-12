#! /usr/bin/env -S bqn -f

_FP ← { F _𝕣 x: {F x↩𝕩}•_while_{x≢𝕩} F x ; 𝕨⊸𝔽 _𝕣 𝕩  }

Load ← >∘•FLines
deltas ← ⟨0‿0, 0‿1, 1‿0, 0‿¯1, ¯1‿0⟩
Solve ← { 𝕊 map:
  ⟨nr, nc⟩ ← mapdim ← ≢map
  flatmap ← ⥊map
  flatindex ← ↕≠flatmap
  Iob ← (0⊸≤ ∧´∘∧ <⟜mapdim)∘⊢
  CoordIndex ← { r‿c: c + r × nr }
  neighbori ← > (⥊↕mapdim) {Iob◶¯1‿CoordIndex 𝕨+𝕩}⌜ deltas
  sameplant ← (neighbori ≥ 0) ∧ (flatmap =⟜(⊏⟜flatmap) neighbori)
  perimeters ← +´˘ ¬sameplant
  RegionCost ← ≠ × +´∘⊏⟜perimeters
  Step ← { sameplant (⌊´ ⊏⟜𝕩∘/)˘ neighbori }

  +´ RegionCost¨ ⊔⊐ Step _FP flatindex
}

•Show∘Solve∘Load¨ •args
