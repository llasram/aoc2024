#! /usr/bin/env -S bqn -f

ToNats ← { ((>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢) 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }
Load ← { ∾ ToNats¨ •FLines 𝕩 }

⟨Xor48⟩ ← {
  intbase ← 2⋆52
  suffix ← ¯1 ↑ 64‿16•bit._cast ⟨intbase⟩
  ToBits ← (3 ↑ 64‿16•bit._cast∘⋈) intbase⊸+
  FromBits ← (intbase -˜ ⊑∘(16‿64•bit._cast)) ∾⟜suffix
  Xor48 ⇐ FromBits (16•bit._xor)○ToBits
}


Mix ← Xor48
Prune ← 16777216⊸|
_PM ← { 𝔽 _𝕣 𝕩: Prune 𝕩 Mix 𝔽 𝕩 }
NextSecret ← { 𝕊 n: ×⟜2048 _PM ⌊∘÷⟜32 _PM ×⟜64 _PM n }

Solve ← { 𝕊 initials:
  +´ NextSecret⍟2000¨ initials
}

•Show∘Solve∘Load¨ •args
