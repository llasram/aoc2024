#! /usr/bin/env -S bqn -f

ToNats ← { ((>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢) 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }
SplitM ← (¬-˜ ⊢× ·+`»⊸>)⊸⊔
Load ← { ∾¨ ⟨⟩⊸≢¨⊸SplitM ToNats¨ •FLines 𝕩 }

Solve ← { 𝕊 ⟨a‿b‿c, program⟩:
  ip ← ¯1 ⋄ output ← ⟨⟩

  Read ← {𝕤⋄ (ip+↩1) ⊑ program}
  LiteralOperand ← Read
  ComboOperand ← {
    𝕊 0: 0; 𝕊 1: 1; 𝕊 2: 2; 𝕊 3: 3;
    𝕊 4: a; 𝕊 5: b; 𝕊 6: c; ! "invalid combo operand"
  }∘Read
  ExecuteInstruction ← {
    𝕊 0: a (a ⌊∘÷ 2⋆ComboOperand)↩ ;
    𝕊 1: b (⊑ ⋈ 32•bit._xor ⋈∘LiteralOperand)↩ ;
    𝕊 2: b (8|ComboOperand)↩ ;
    𝕊 3: ip1 ← (a≠0)◶⟨{𝕤⋄ip}, -⟜1⟩ LiteralOperand@ ⋄ ip↩ip1 ;
    𝕊 4: b (⊑ ⋈ 32•bit._xor ⋈∘c∘Read)↩ ;
    𝕊 5: output ∾⟜(8|ComboOperand)↩ ;
    𝕊 6: b (a ⌊∘÷ 2⋆ComboOperand)↩ ;
    𝕊 7: c (a ⌊∘÷ 2⋆ComboOperand)↩
  }∘Read
  Terminated ← {𝕤⋄ ip ≥ ¯1+≠program}

  (ExecuteInstruction)•_while_(¬Terminated) @

  output
}

Display ← •Out ¯1↓ ""{(•Fmt 𝕨)∾","∾𝕩}´⊢

Display∘Solve∘Load¨ •args
