#! /usr/bin/env -S bqn -f

ToNats ← { ((>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢) 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }

Load ← ToNats •FChars
NDigits ← ⌊1+10⋆⁼⊢
Blink ← {
  𝕊 0: ⟨1⟩ ;
  𝕊 n: d ← 1+⌊10⋆⁼ n ⋄ {
    ¬2|d ? (10⋆d⌊∘÷2) (⌊∘÷˜⋈|) n ;
    ⟨2024 × n⟩
  }
}

SolveGeneric ← { t 𝕊 stones:
  total ← 0
  stack ← t ⋈ ¨stones
  StepItem ← {
    𝕊 1‿0: total +↩ 1 ⋄ @ ;
    𝕊 1‿n: total +↩ 2 - 2| NDigits n ⋄ @ ;
    𝕊 i‿n: stack ∾↩ (i-1) ⋈¨ Blink n ⋄ @
  }
  Step ← { 𝕊: tos ← ¯1⊑stack ⋄ stack ¯1⊸↓↩ ⋄ StepItem tos ⋄ @ }
  NotDone ← { 𝕊: 0≠≠stack }
  Step •_while_ NotDone @
  total
}

Solve ← 75⊸SolveGeneric

•Show∘Solve∘Load¨ •args
