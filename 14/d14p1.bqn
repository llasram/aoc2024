#! /usr/bin/env -S bqn -f

ToInts ← •ParseFloat¨ ⊢⊔˜ ¯1+ ((+` »⊸<)⊸× ∊⟜"0123456789-")

Load ← { > ToInts¨ •FLines 𝕩 }
Solve ← {
  [p0, v] ← 1‿0‿2⍉ ∘‿2‿2⥊ 𝕩 ⋄ wh ← 1+⌈˝p0 ⋄ mwh ← 2⌊∘÷˜¯1+wh
  ×´ /⁼ (+´ 2‿1× mwh⊸>)˘ (¬∘∨´ mwh⊸=)˘⊸/ wh⊸|˘ p0+ 100× v
}

•Show∘Solve∘Load¨ •args
