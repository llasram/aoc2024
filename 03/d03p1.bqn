#! /usr/bin/env -S bqn -f

Split ← (¬-˜⊢×·+`»⊸>)∘≠⊔⊢

re ← "mul\([0-9]{1,3},[0-9]{1,3}\)"
cmd ← "/usr/bin/grep"‿"-Eo"‿re ∾ •args
⟨r, input, err⟩ ← •SH cmd
input ↩ (@+10) Split input
keep ← "," ∾ '0' + ↕10
Solve1 ← ×´ •ParseFloat¨∘(· ','⊸Split ∊⟜keep/⊢)

result ← +´ Solve1¨ input

•Show result
