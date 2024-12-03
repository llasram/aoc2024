#! /usr/bin/env -S bqn -f

Split ← (¬-˜⊢×·+`»⊸>)∘≠⊔⊢
input ← > (•ParseFloat¨ ' '⊸Split)¨ ∾´ •file.Lines¨ •args

⟨ xs, ys ⟩ ← ⥊ ⋈˘ ⍉ input
ys_d ← ⍷ ∧ ys
ys_c ← 0 ∾˜ /⁼ ys_d ⊐ ys
result ← +´ (⊢×ys_d⊸⊐⊸⊏⟜ys_c) xs

•Show result
