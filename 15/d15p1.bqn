#! /usr/bin/env -S bqn -f

SplitM ← (¬-˜ ⊢× ·+`»⊸>)⊸⊔

Load ← {{a‿b: (>a)‿(∾b)} ""⊸≢¨⊸SplitM •FLines 𝕩}
moveopts ← "^>v<"
deltas ← ⟨¯1‿0, 0‿1, 1‿0, 0‿¯1⟩
Solve ← { 𝕊 map‿moves:
  rpos0 ← ⊑ ('@'=map) /○⥊ ↕≢map
  map '.'⌾(rpos0⊸⊑)↩
  moves (⊏⟜deltas moveopts⊸⊐)↩

  NextEmpty ← { 𝕊 p0‿d:
    p ← p0 + d
    CheckSquare ← {
      𝕊 '.': 0 ;
      𝕊 '#': p ↩ p0 ⋄ 0 ;
      𝕊 'O': p +↩ d ⋄ 1 ;
      ! "Unexpected map entry"
    }
    Step ← {𝕤⋄ CheckSquare p⊑map }
    (Step)•_while_(⊢) 1
    p
  }
  TryMove ← { d 𝕊 rpos:
    rpos1 ← d+rpos ⋄ epos ← NextEmpty rpos‿d ⋄ {
      epos ≡ rpos ? rpos ;
      epos ≡ rpos1 ? rpos1 ;
      map '.'⌾(rpos1⊸⊑)↩
      Step ← { 𝕊 p: p+↩d ⋄ map 'O'⌾(p⊸⊑)↩ ⋄ p }
      (Step)•_while_(epos⊸≢) rpos1
      rpos1
    }
  }
  rpos0 TryMove´ ⌽moves

  +´ 100‿1× +˝ > ('O'=map) /○⥊ ↕≢map
}

•Show∘Solve∘Load¨ •args
