#! /usr/bin/env -S bqn -f

_FP ← { F _𝕣 x: {F x↩𝕩}•_while_{x≢𝕩} F x ; 𝕨⊸𝔽 _𝕣 𝕩  }

Load ← >∘•FLines
deltas ← ⟨0‿1, 1‿0, 0‿¯1, ¯1‿0⟩
Solve ← { 𝕊 map:
  ⟨nr, nc⟩ ← mapdim ← ≢map
  flatmap ← ⥊map
  flatindex ← ↕≠flatmap
  Iob ← (0⊸≤ ∧´∘∧ <⟜mapdim)∘⊢
  CoordIndex ← { r‿c: c + r × nr }
  neighbori ← > (⥊↕mapdim) {Iob◶¯1‿CoordIndex 𝕨+𝕩}⌜ deltas
  selfneighbori ← flatindex ∾⎉0‿1 neighbori
  sameplant ← (neighbori ≥ 0) ∧ (flatmap =⟜(⊏⟜flatmap) neighbori)
  selfsameplant ← 1⊸∾˘ sameplant
  perimeters ← +´˘ ¬sameplant
  CountCorners ← { sp 𝕊 ni: +´ (¬sp) ∧ (¬1⌽sp) ∨ (0‿0⍉(1⌽ni)⊏sameplant) }
  sides ← sameplant CountCorners˘ neighbori
  RegionCost ← ≠ × +´∘⊏⟜sides
  Step ← { selfsameplant (⌊´ ⊏⟜𝕩∘/)˘ selfneighbori }

  +´ RegionCost¨ ⊔⊐ Step _FP flatindex
}

•Show∘Solve∘Load¨ •args
