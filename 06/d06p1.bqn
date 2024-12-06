#! /usr/bin/env -S bqn -f

Load ← >∘•FLines
Solve ← { 𝕊 map:
  ⟨dN, dE, dS, dW⟩ ← ↕4
  IndicesOf ← ⊑ (¯1⊸+∘= ⊔○⥊ ↕∘≢∘⊣)
  obs ← map IndicesOf '#'
  guard ← > ⊑ map IndicesOf '^'
}

# •Show∘Solve∘Load¨ •args

Solve Load "example"
