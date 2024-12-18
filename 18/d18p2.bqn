#! /usr/bin/env -S bqn -f

_FP ← { F _𝕣 x: {F x↩𝕩}•_while_{x≢𝕩} F x ; 𝕨⊸𝔽 _𝕣 𝕩  }

ToNats ← { ((>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢) 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }
Load ← { > ToNats¨ •FLines 𝕩 }

moves ← ⟨», »˘, «, «˘⟩
Solve ← { 𝕊 bytes:
  spos ← ⟨1, 1⟩ ⋄ epos ← 1+⌈˝bytes ⋄ dim ← 2+epos
  mask ← {⊑◶∞‿0}⎉0 ∧´ moves {𝕎𝕩}¨ <dim⥊1
  cost0 ← 0⌾(spos⊸⊑) dim⥊∞
  Step ← { 𝕊 cost: cost⌊ ⌊´ moves {mask+𝕎𝕩}¨ <1+cost }
  MetaStep ← {
    · 𝕊 ·‿1: 𝕩 ;
    b 𝕊 ·‿0: mask ∞⌾((1+b)⊸⊑)↩ ⋄ {
      ∞ ≡ epos ⊑ Step _FP cost0 ? b‿1 ;
      b‿0
    }
  }
  ⊑ ⟨0‿0, 0⟩ MetaStep˝ ⌽bytes
}

Display ← { 𝕊 x‿y: •Out x {𝕨∾","∾𝕩}○•Fmt y }

Display∘Solve∘Load¨ •args
