#! /usr/bin/env -S bqn -f

SplitM ← (¬-˜ ⊢× ·+`»⊸>)⊸⊔
Load ← ((¬∊⟜", ")⊸SplitM∘⊑ ⋈ 2⊸↓) •FLines

CountMatches ← { lgunits 𝕊 design:
  matches ← ⍉ lgunits ⊑⊸(∊˜)˘ (↕≠lgunits) ↑⌜ ↓design
  ⊑ (≠⊸↑⟜1 (1↓ ⊢+ ≠∘⊢↑ ×⟜⊑)˝ 1↓⌽) matches
}
Solve ← { 𝕊 units‿designs:
  (≠¨⊸⊔ units)⊸CountMatches¨ designs
}

Display ← { 𝕊 ways:
  •Show +´ ×ways
  •Show +´ ways
}

Display∘Solve∘Load¨ •args
