#! /usr/bin/env -S bqn -f

_FP ← { ⊑ ((𝔽⋈⊢)⊑)•_while_(≢´) (𝔽𝕩)‿𝕩 ; 𝕨⊸𝔽 _𝕣 𝕩 }

Load ← >∘•FLines

moves ← ⟨«, »˘, », «˘⟩
c0 ← -2⋆15
Solve ← { 𝕊 map:
  mask ← '#'≠map
  epos ← ⊑ ('E'⊸= /○⥊ ↕∘≢) map

  Step ← { m 𝕊 c: c⌊ ⌊´ moves {m×𝕎𝕩}¨ <1+c }
  e2cost ← mask Step _FP c0×'E'=map
  s2cost ← mask Step _FP c0×'S'=map
  base ← c0-˜ epos⊑s2cost

  CheatSavings ← { 𝕨 𝕊 𝕩:
    s2cheat ← 0⌊ mask× 𝕎𝕏 2+ s2cost
    total ← 0⌊ e2cost+ c0-˜ s2cheat
    +´ (base-100)≥ ⥊c0-˜total
  }
  +´ ⥊> CheatSavings⌜˜ moves
}

•Show∘Solve∘Load¨ •args
