#! /usr/bin/env -S bqn -f

Load ← >∘•FLines
Solve ← { 𝕊 map:
  ni ← ×´ ⟨nr, nc⟩ ← ≢map
  igrid ← nr‿nc ⥊ ↕ni
  i0 ← ⊑ ⥊⊸⊐⟜'^' map
  rots ← ⟨⍉, ⌽˘, ⌽˘∘⍉, ⊢⟩
  obs ← '#'=map

  MkDestLine ← 0⊸≠◶⊣‿⊢` ¯1⊸»⊸×
  Path ← {
    𝕩 < 0 ? 𝕨𝕊|𝕩 ; 𝕩 < 𝕨 ? 𝕩𝕊𝕨 ;
    nc ≤ 𝕩-𝕨 ? 𝕨 + nc × 0𝕊(nc ⌊∘÷˜ 𝕩-𝕨) ;
    𝕨 + ↕𝕩¬𝕨
  }

  VisitAll ← { 𝕊 obs:
    dests ← {⥊ obs MkDestLine˘⌾𝕏 igrid}¨ rots
    visited ← >4/⋈ni⥊0
    Travel ← { ⟨i, d, ·⟩:
      ⟨i↩i⊑d⊑dests, d↩4|1+d, ((d×ni)+(i))⊑⥊visited⟩
    }

    Step ← { ⟨i, d, ·⟩:
      ⟨i1, ·, ·⟩ ← x1 ← Travel 𝕩
      visited ↩ (1⎉0)⌾(((d×ni)+(i Path i1))⊸⊏∘⥊) visited
      x1
    }
    NotDone ← { ⟨i, ·, v⟩: (i>0) ∧ (¬v) }
    ⟨·, ·, v⟩ ← Step •_while_ NotDone i0‿0‿0

    v ⋈ visited
  }

  options ← (⥊igrid) /˜ (0⎉0)⌾(i0⊸⊏) ∨˝ 1 ⊑ VisitAll obs
  result ← +´ {⊑ VisitAll (1⎉0)⌾(𝕩⊸⊏∘⥊) obs}¨ options
  result
}

•Show∘Solve∘Load¨ •args
