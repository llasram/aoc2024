#! /usr/bin/env -S bqn -f

MP ← +˝∘×⎉1‿∞

Load ← -⟜'0' >∘•FLines
Adjacency ← { ((⊣=1+⊢)○(⊑⟜𝕩) ∧ (1=+´∘|∘-))⌜˜ ⥊↕≢𝕩 }
Solve ← { +´ 0< ⥊MP⍟(9-1)˜ Adjacency 𝕩 }

•Show∘Solve∘Load¨ •args
