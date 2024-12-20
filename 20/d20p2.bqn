#! /usr/bin/env -S bqn -f

_FP ← { ⊑ ((𝔽⋈⊢)⊑)•_while_(≢´) (𝔽𝕩)‿𝕩 ; 𝕨⊸𝔽 _𝕣 𝕩 }

Load ← >∘•FLines


moves ← ⟨«, »˘, », «˘⟩
ExpandFringe ← (∨´ <⊸({𝕏𝕨}¨)⟜moves)⊸∧
CostFillStep ← { 𝕊 ⟨fringe, cost, mask, n⟩:
  mask ≠↩ fringe
  fringe ExpandFringe↩ mask
  cost ⌈↩ n×fringe
  ⟨fringe, cost, mask, n+1⟩
}
CostFill ← { mask 𝕊 start:
  # Costs are offset by +1 so that "0" is inaccessible
  1⊑ (CostFillStep)•_while_(∨´∘⥊⊑) ⟨start, start, mask, 2⟩
}

CheatSavings ← { base‿e2cost‿s2cost 𝕊 cdist:
  cpad ← 2×cdist
  cwin ← 1+cpad

  ⟨Pad⟩ ← { Pad ⇐ F˘ (F← »⍟cdist (cpad+≠)↑⊢) }
  mdol ← +´¨ | cdist-˜ ↕cwin‿cwin
  cmask ← cdist≥ mdol
  CheatSavings ← ⊑⊸{
    0 𝕊 ·: 0 ;
    s2cost 𝕊 e2cost: {
      total ← ¯2+e2cost+mdol+s2cost
      +´ ⥊ cmask∧(e2cost>0)∧(base-100)≥total
    }
  }
  +´ ⥊ s2cost CheatSavings⎉0‿2 cwin‿cwin↕ Pad e2cost
}

Solve ← { cdists 𝕊 map:
  mask0 ← '#'≠map
  epos ← ⊑ ('E'⊸= /○⥊ ↕∘≢) map

  e2cost ← mask0 CostFill 'E'=map
  s2cost ← mask0 CostFill 'S'=map
  base ← ¯1+epos⊑s2cost

  ⟨base, e2cost, s2cost⟩⊸CheatSavings¨ cdists
}

{•Show¨ 2‿20 Solve Load 𝕩}¨ •args
