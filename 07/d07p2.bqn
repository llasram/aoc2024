#! /usr/bin/env -S bqn -f

ToNats ← { ((>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢) 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }

Load ← ToNats¨ •FLines
Cat ← {𝕨+𝕩×10⋆1+⌊10⋆⁼𝕨}
Solve ← +´ (⊑ (⊣×⊑∘∊) (+∾×∾Cat)´∘(⌽ 1⊸↓))¨

•Show∘Solve∘Load¨ •args
