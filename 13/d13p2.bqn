#! /usr/bin/env -S bqn -f

ToNats ← { ((>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢) 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }
SplitM ← (¬-˜ ⊢× ·+`»⊸>)⊸⊔

Load ← { 2 (>∘↑ ⋈ (10⋆13)+⊑)¨ ⟨⟩⊸≢¨⊸SplitM ToNats¨ •FLines 𝕩 }
Det22 ← -´ ×⟜⌽˝
UnsInv22 ← { 𝕊 [a‿b, c‿d]: [d‿(-b), (-c)‿a] }
PrizeCost ← { 𝕊 b‿p:
  d ← Det22 b ⋄ {
     0=d ? 0 ;
     uns ← p +˝∘×⚇1‿∞ UnsInv22 b ⋄ {
       (∨´ 0≠d|uns) ? 0 ;
       +´ ⟨3, 1⟩ × uns ÷ d
     }
  }
}
Solve ← +´ PrizeCost¨

•Show∘Solve∘Load¨ •args
