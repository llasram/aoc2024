#! /usr/bin/env -S bqn -f

ToNats ← { ((>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢) 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }
SplitM ← (¬-˜ ⊢× ·+`»⊸>)⊸⊔
Load ← { ∾¨ ⟨⟩⊸≢¨⊸SplitM ToNats¨ •FLines 𝕩 }

⟨Xor48⟩ ← {
  intbase ← 2⋆52
  suffix ← ¯1 ↑ 64‿16•bit._cast ⟨intbase⟩
  ToBits ← (3 ↑ 64‿16•bit._cast∘⋈) intbase⊸+
  FromBits ← (intbase -˜ ⊑∘(16‿64•bit._cast)) ∾⟜suffix
  Xor48 ⇐ FromBits (16•bit._xor)○ToBits
}

RunProgram ← { 𝕊 ⟨a‿b‿c, program⟩:
  ip ← ¯1 ⋄ output ← ⟨⟩

  Read ← {𝕤⋄ (ip+↩1) ⊑ program}
  LiteralOperand ← Read
  ComboOperand ← {
    𝕊 0: 0; 𝕊 1: 1; 𝕊 2: 2; 𝕊 3: 3;
    𝕊 4: a; 𝕊 5: b; 𝕊 6: c; ! "invalid combo operand"
  }∘Read
  ExecuteInstruction ← {
    𝕊 0: a (a ⌊∘÷ 2⋆ComboOperand)↩ ;
    𝕊 1: b LiteralOperand⊸Xor48↩ ;
    𝕊 2: b (8|ComboOperand)↩ ;
    𝕊 3: ip1 ← (a≠0)◶⟨{𝕤⋄ip}, -⟜1⟩ LiteralOperand@ ⋄ ip↩ip1 ;
    𝕊 4: b (c∘Read)⊸Xor48↩ ;
    𝕊 5: output ∾⟜(8|ComboOperand)↩ ;
    𝕊 6: b (a ⌊∘÷ 2⋆ComboOperand)↩ ;
    𝕊 7: c (a ⌊∘÷ 2⋆ComboOperand)↩
  }∘Read
  Terminated ← {𝕤⋄ ip ≥ ¯1+≠program}

  (ExecuteInstruction)•_while_(¬Terminated) @

  output
}

Octalize ← 0 +⟜(8⊸×)´ ⌽
Solve ← { 𝕊 ⟨·‿b‿c, program⟩:
  RP ← { 𝕊 ao: RunProgram ⟨(Octalize ao)‿b‿c, program⟩ }
  SuffixMatch ← ⊢ ≡ (-∘≠)⊸↑⟜program
  TryExtend ← { 𝕊 ao: SuffixMatch∘RP¨⊸/ ao⊸∾¨ ↕8 }
  Step ← { 𝕊 aos: ∾ TryExtend¨ aos }
  ⌊´ Octalize¨ (program≡RP)¨⊸/ Step⍟(≠program) ⟨⟨⟩⟩
}

•Show∘Solve∘Load¨ •args
