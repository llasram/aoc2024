#! /usr/bin/env -S bqn -f

Load ← > •file.Lines
IsMas ← "MAS"⊸≡ ∨ "SAM"⊸≡
IsDmas ← IsMas 0‿0⊸⍉
IsXmas ← IsDmas ∧ IsDmas∘⌽
Solve ← +´∘⥊ (IsXmas⎉2 3‿3⊸↕)

•Show∘Solve∘Load¨ •args
