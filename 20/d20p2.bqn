#! /usr/bin/env -S bqn -f

_FP ← { ⊑ ((𝔽⋈⊢)⊑)•_while_(≢´) (𝔽𝕩)‿𝕩 ; 𝕨⊸𝔽 _𝕣 𝕩 }

Load ← >∘•FLines

moves ← ⟨«, »˘, », «˘⟩
c0 ← -2⋆15
cdist ← 20 ⋄ cpad ← 2×cdist ⋄ cwin ← 1+cpad
Solve ← { 𝕊 map:
  mask ← '#'≠map
  epos ← ⊑ ('E'⊸= /○⥊ ↕∘≢) map

  Step ← { m 𝕊 c: c⌊ ⌊´ moves {m×𝕎𝕩}¨ <1+c }
  e2cost ← mask Step _FP c0×'E'=map
  s2cost ← mask Step _FP c0×'S'=map
  base ← c0-˜ epos⊑s2cost

  ⟨Pad⟩ ← { Pad ⇐ F˘ (F← »⍟cdist (cpad+≠)↑⊢) }
  mdol ← +´¨ | cdist-˜ ↕41‿41
  cmask ← cdist≥ mdol
  CheatSavings ← { s2cost 𝕊 e2cost:
    s2cheat ← cmask× mdol+ s2cost
    total ← 0⌊ e2cost+ c0-˜ s2cheat
    +´ (base-100)≥ ⥊c0-˜total
  }
  +´ ⥊ s2cost CheatSavings⎉0‿2 cwin‿cwin↕ Pad e2cost
}

•Show∘Solve∘Load¨ •args
