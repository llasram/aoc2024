#! /usr/bin/env -S bqn -f

ToNats ← { ((>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢) 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }

Load ← ToNats •FChars
NDigits ← ⌊1+10⋆⁼⊢
Blink ← {
  𝕊 0: ⟨1⟩ ;
  𝕊 n: d ← NDigits n ⋄ {
    ¬2|d ? (10⋆d⌊∘÷2) (⌊∘÷˜⋈|) n ;
    ⟨2024 × n⟩
  }
}

SolveGeneric ← { t 𝕊 stones:
  memo ← ⟨⟩ •HashMap ⟨⟩
  StoneCount ← {
    𝕊 1‿0: 1 ;
    𝕊 1‿n: 2 - 2| NDigits n ;
    𝕊 𝕩: memo.Has 𝕩 ? memo.Get 𝕩 ;
    𝕊 i‿n: 𝕩 memo.Set c ← +´ (i-1) 𝕊∘⋈¨ Blink n ⋄ c
  }
  +´ t StoneCount∘⋈¨ stones
}

Solve ← 75⊸SolveGeneric

•Show∘Solve∘Load¨ •args
