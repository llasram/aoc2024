#! /usr/bin/env -S bqn -f

SplitM ← (¬-˜ ⊢× ·+`»⊸>)⊸⊔
Load ← ((¬∘∊⟜", ")⊸SplitM∘⊑ ⋈ 2⊸↓) •FLines

CountMatches ← { lgunits 𝕊 design:
  np ← ≠lgunits
  CountSuffix ← { suffix 𝕊 counts:
    counts (⊣+⊣≠⊸↑⊑⊸×) lgunits ⊑∘∊˜⟜⋈¨ np↑↑suffix
  }
  ⊑ (≠⊸↑⟜1 (1⊸↓)∘CountSuffix´ 1↓⌽) ↓design
}
Solve ← { 𝕊 units‿designs:
  (≠¨⊸⊔ units)⊸CountMatches¨ designs
}

Display ← { 𝕊 ways:
  •Show +´ ×ways
  •Show +´ ways
}

Display∘Solve∘Load¨ •args
