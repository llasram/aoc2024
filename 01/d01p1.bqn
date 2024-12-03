#! /usr/bin/env -S bqn -f

Split ← (¬-˜⊢×·+`»⊸>)∘≠⊔⊢
input ← > (•ParseFloat¨ ' '⊸Split)¨ ∾´ •file.Lines¨ •args

result ← +´ |∘-´˘ ∧˘⌾⍉ input

•Show result
