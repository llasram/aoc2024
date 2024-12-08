#! /usr/bin/env -S bqn -f

Load ← > •FLines
Solve ← { 𝕊 map:
  antennas ← (⊢ ⊔○⥊ ↕∘≢) ¯1+ (∧∘⍷∘⥊ ⊐⎉1 ⊢) map
  Iob ← 0⊸≤ ∧○(∧´) <⟜(≢map)
  Antinodes ← { d←𝕨-𝕩 ⋄ ⟨⟩ {Iob◶𝕨‿(𝕨⊸∾⟜< 𝕊 d⊸+) 𝕩} 𝕨 }
  MaybeAntinodes ← ≢◶⟨⟩‿Antinodes
  ≠ ⍷ ∾ ∾∘⥊∘(MaybeAntinodes⌜˜)¨ antennas
}

•Show∘Solve∘Load¨ •args
