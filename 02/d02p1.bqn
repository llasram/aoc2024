#! /usr/bin/env -S bqn -f

Split ← (¬-˜⊢×·+`»⊸>)∘≠⊔⊢
input ← (•ParseFloat¨ ' '⊸Split)¨ ∾´ •file.Lines¨ •args

IsSafe ← (∧´∘(⊢>«) ∨ ∧´∘(⊢>»)) ∧ ∧´∘((1⊸≤ ∧ ≤⟜3) (1⊸↓ |∘- ¯1⊸↓))

result ← +´ IsSafe¨ input

•Show result
