#! /usr/bin/env -S bqn -f

Split ← (¬-˜⊢×·+`»⊸>)∘≠⊔⊢
input ← (•ParseFloat¨ ' '⊸Split)¨ ∾´ •file.Lines¨ •args

IsSafe ← (∧´∘(⊢>«) ∨ ∧´∘(⊢>»)) ∧ ∧´∘((1⊸≤ ∧ ≤⟜3) (1⊸↓ |∘- ¯1⊸↓))

IsSafeDamp ← {𝕊 levs:
  idxs ← ↕≠levs
  ∨´ {IsSafe levs /˜ ¬ 𝕩 ⍷ idxs}¨ @ ∾ idxs
}

result ← +´ IsSafeDamp¨ input

•Show result
