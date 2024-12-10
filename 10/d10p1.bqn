#! /usr/bin/env -S bqn -f

Load ← -⟜'0' >∘•FLines
Adjacency ← { ((⊢=⌜1+⊢) ⥊𝕩) ∧ (1= +´∘|∘-⌜˜ ⥊↕≢𝕩) }
Solve ← { +´∘⥊ adj ∨˝∘∧⎉1‿∞˜⍟(9-1) (9=⥊𝕩)/ adj←Adjacency 𝕩 }

•Show∘Solve∘Load¨ •args
