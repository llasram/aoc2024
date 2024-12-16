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
  cost0 ← 1‿∞‿∞‿∞ ×⎉0‿∞ 'S'⊸=◶∞‿0¨˘ map
  Step ← { ⌊˝ rcosts {𝕨 +⎉0‿∞ 𝕩}˘ moves {𝕩⌊mask×1+(⊑𝕨){𝕎𝕩}𝕩}˘ 𝕩 }
  ⌊´ epos⊸⊑˘ Step _FP cost0
}

•Show∘Solve∘Load¨ •args
