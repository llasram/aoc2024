#! /usr/bin/env -S bqn -f

_FP ← { F _𝕣 x: {F x↩𝕩}•_while_{x≢𝕩} F x ; 𝕨⊸𝔽 _𝕣 𝕩  }

ToNats ← { ((>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢) 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }
Load ← { > ToNats¨ •FLines 𝕩 }

moves ← ⟨», »˘, «, «˘⟩
Solve ← { 𝕊 bytes:
  spos ← ⟨1, 1⟩ ⋄ epos ← 1+⌈˝bytes ⋄ dim ← 2+epos
  mask0 ← ∧´ moves {𝕎𝕩}¨ <dim⥊1
  visit0 ← 1⌾(spos⊸⊑) dim⥊0

  CanTraverse ← { 𝕊 mask: epos⊑ {𝕩∨ ∨´moves{mask×𝕎𝕩}¨<𝕩}_FP visit0 }
  BinarySearch ← {
    · 𝕊 [b]: b ;
    mask0 R bytes: {
      n ← 2⌊∘÷˜≠bytes
      mask1 ← mask0 {0⌾(𝕨⊸⊑) 𝕩}˝ n↑bytes
      CanTraverse◶⟨
        {𝕤⋄ mask0 R n↑bytes}
        {𝕤⋄ mask1 R n↓bytes}
      ⟩ mask1
    }
  }

  ¯1+ mask0 BinarySearch 1+bytes
}

Display ← { 𝕊 x‿y: •Out x {𝕨∾","∾𝕩}○•Fmt y }

Display∘Solve∘Load¨ •args
