#! /usr/bin/env -S bqn -f

AntiDiags ← (+⌜´ ↕¨∘≢)⊸⊔
Diags ← (+⌜´ ⌽⌾⊑∘(↕¨)∘≢)⊸⊔
_EachOrder ← {F _𝕣 𝕩:
  ∾´ ⥊ ⊢‿⌽ {F∘𝕎¨ 𝕩}⌜ ⟨<˘𝕩, <˘⍉𝕩, Diags 𝕩, AntiDiags 𝕩⟩
}
CountXmasLine ← +´ "XMAS"⊸⍷
Solve ← +´ CountXmasLine _EachOrder

•Show¨ Solve∘>∘•file.Lines¨ •args
