#! /usr/bin/env -S bqn -f

ToNats ← { ((>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢) 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }

Load ← ToNats •FChars
Blink ← {
  𝕊 0: ⟨1⟩ ;
  𝕊 n: d ← 1+⌊10⋆⁼ n ⋄ {
    ¬2|d ? (10⋆d⌊∘÷2) (⌊∘÷˜⋈|) n ;
    ⟨2024 × n⟩
  }
}
Solve ← ≠ ∾∘(Blink¨)⍟25

•Show∘Solve∘Load¨ •args
