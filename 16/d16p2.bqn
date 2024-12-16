#! /usr/bin/env -S bqn -f

_FP ← { F _𝕣 x: {F x↩𝕩}•_while_{x≢𝕩} F x ; 𝕨⊸𝔽 _𝕣 𝕩  }

Load ← >∘•FLines

rcost ← 1000× 0‿1‿2‿1
rcosts ← > ⌽⟜rcost¨ -↕≠rcost
mcost ← 1
moves ← ⟨»˘, », «˘, «⟩
Solve ← { 𝕊 map:
  epos ← ⊑ ('E'=map) /○⥊ ↕≢map
  mask ← '#'⊸=◶1‿∞¨˘ map
  Step ← { ⌊˝ rcosts {𝕨 +⎉0‿∞ 𝕩}˘ moves ⊑⊸{𝕩⌊mask×mcost+𝕎𝕩}˘ 𝕩 }

  cost0s ← 1‿∞‿∞‿∞ ×⎉0‿∞ 'S'⊸=◶∞‿0¨˘ map
  costS2E ← Step _FP cost0s
  score ← ⌊´ epos⊸⊑˘ costS2E

  cost0e ← 2⌽ ('E'⊸=◶∞‿1¨⚇1 map) ×⎉2 (score⊸=◶∞‿0¨⎉1 costS2E)
  costE2S ← Step _FP cost0e

  +´ ⥊ ∨˝ costS2E (score=+)˘ ¯2⌽costE2S
}

•Show∘Solve∘Load¨ •args
