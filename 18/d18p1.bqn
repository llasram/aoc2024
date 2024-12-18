#! /usr/bin/env -S bqn -f

_FP ← { F _𝕣 x: {F x↩𝕩}•_while_{x≢𝕩} F x ; 𝕨⊸𝔽 _𝕣 𝕩  }

ToNats ← { ((>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢) 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }
Load ← { > (1024⌊≠)⊸↑ ToNats¨ •FLines 𝕩 }

moves ← ⟨», »˘, «, «˘⟩
Solve ← { 𝕊 bytes:
  spos ← ⟨1, 1⟩ ⋄ epos ← 1+⌈˝bytes ⋄ dim ← 2+epos
  map ← (∧´ moves {𝕎𝕩}¨ <dim⥊1) {0⌾(𝕨⊸⊑) 𝕩}˝ 1+bytes
  mask ← {⊑◶∞‿0}⎉0 map
  cost0 ← 0⌾(spos⊸⊑) dim⥊∞
  Step ← { 𝕊 cost: cost⌊ ⌊´ moves {mask+𝕎𝕩}¨ <1+cost }
  epos ⊑ Step _FP cost0
}

•Show∘Solve∘Load¨ •args
