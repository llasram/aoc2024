#! /usr/bin/env -S bqn -f

ToNats ← { ((>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢) 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }

Load ← ToNats¨ •FLines
Solve ← +´ (⊑ (⊣×⊑∘∊) (+∾×)´∘(⌽ 1⊸↓))¨

•Show∘Solve∘Load¨ •args
