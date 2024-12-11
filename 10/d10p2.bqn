#! /usr/bin/env -S bqn -f

Load ← -⟜'0' >∘•FLines
Adjacency ← { ((⊢=⌜1+⊢) ⥊𝕩) ∧ (1= +´∘|∘-⌜˜ ⥊↕≢𝕩) }
Solve ← { +´∘⥊ (Adjacency 𝕩) +˝∘×⎉1‿∞˜⍟9 (9=⥊𝕩) }

•Show∘Solve∘Load¨ •args
