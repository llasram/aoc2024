#! /usr/bin/env -S bqn -f

ToInts ← •ParseFloat¨ ⊢⊔˜ ¯1+ ((+` »⊸<)⊸× ∊⟜"0123456789-")

Load ← { > ToInts¨ •FLines 𝕩 }
Display ← {•Out˘ ((⌽𝕨)⥊" ") {'X'⌾((⌽𝕨)⊸⊑) 𝕩}˝ 𝕩 ⋄ @}
Solve ← {
  [p0, v] ← 1‿0‿2⍉ ∘‿2‿2⥊ 𝕩 ⋄ wh ← 1+⌈˝p0 ⋄ mwh ← 2⌊∘÷˜¯1+wh
  p0 {•Out ("# " ∾ •Fmt 𝕨) ⋄ wh Display 𝕩 ⋄ •Out "" ⋄ wh⊸|˘𝕩+v}´ ⌽↕10000
}

•Show∘Solve∘Load¨ •args
