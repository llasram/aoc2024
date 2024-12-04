#! /usr/bin/env -S bqn -f

Split ← (¬-˜⊢×·+`»⊸>)∘≠⊔⊢

re ← "mul\([0-9]{1,3},[0-9]{1,3}\)|do(n't)?\(\)"
cmd ← "/usr/bin/grep"‿"-Eo"‿re ∾ •args
⟨r, input, err⟩ ← •SH cmd
input ↩ (@+10) Split input

Solve ← {𝕊 input:
  keep ← "," ∾ '0' + ↕10
  doing ← 1
  Mul ← ×´ •ParseFloat¨∘(· ','⊸Split ∊⟜keep/⊢)
  Solve1 ← {
    "do()": doing↩1 ⋄ 0 ;
    "don't()": doing↩0 ⋄ 0 ;
    𝕩: doing ? Mul 𝕩 ;
    0
  }
  +´ Solve1¨ input
}

result ← Solve input

•Show result
