#! /usr/bin/env -S bqn -f

ToNats ← { ((>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢) 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }
SplitM ← (¬-˜ ⊢× ·+`»⊸>)⊸⊔

Load ← {""⊸≢¨⊸SplitM ToNats¨ •FLines 𝕩}
Solve ← {⟨rules, updates⟩:
  rules ↩ ∧ > rules
  IsCorrect ← ∧´∘∊⟜rules 2⊸↕
  MiddlePage ← ⌊∘÷⟜2∘≠⊸⊑
  +´ IsCorrect◶0‿MiddlePage¨ updates
}

•Show∘Solve∘Load¨ •args
