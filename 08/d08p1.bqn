#! /usr/bin/env -S bqn -f

Load ← > •FLines
Solve ← { 𝕊 map:
  antennas ← (⊢ ⊔○⥊ ↕∘≢) ¯1+ (∧∘⍷∘⥊ ⊐⎉1 ⊢) map
  Iob ← ∧´ 0⊸≤ ∧ <⟜(≢map)
  MaybeAntinode ← ≢◶⟨⟩‿(Iob◶⟨⟩‿< ⊣+-)
  ≠⍷ ∾ ∾∘⥊∘(MaybeAntinode⌜˜)¨ antennas
}

•Show∘Solve∘Load¨ •args
