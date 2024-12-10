#! /usr/bin/env -S bqn -f

Load ← -⟜'0' >∘•FLines
Adjacency ← { > ((⊣=1+⊢)○(⊑⟜𝕩) ∧ (1=+´∘|∘-))⌜˜ ⥊↕≢𝕩 }
Solve ← { +´∘⥊ +˝∘×⎉1‿∞⍟(9-1)˜ Adjacency 𝕩 }

•Show∘Solve∘Load¨ •args
