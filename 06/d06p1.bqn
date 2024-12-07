#! /usr/bin/env -S bqn -f

Load ← >∘•FLines
Solve ← { 𝕊 map:
  ⟨·, nc⟩ ← ≢map
  igrid ← (⊢⥊↕∘(×´))∘≢ map
  obs ← '#'=map
  rots ← ⟨⍉, ⌽˘, ⌽˘∘⍉, ⊢⟩
  MkDestLine ← 0⊸≠◶⊣‿⊢` ¯1⊸»⊸×
  dests ← {⥊ obs MkDestLine˘⌾𝕏 igrid}¨ rots
  Travel ← { ⟨i, d⟩: ⟨i⊑d⊑dests, 4|1+d⟩ }
  Path ← {
    𝕩 < 0 ? 𝕨𝕊|𝕩 ; 𝕩 < 𝕨 ? 𝕩𝕊𝕨 ;
    nc ≤ 𝕩-𝕨 ? 𝕨 + nc × 0𝕊(nc ⌊∘÷˜ 𝕩-𝕨) ;
    𝕨 + ↕𝕩¬𝕨
  }

  visited ← ×´∘≢⊸⥊⟜0 map
  Step ← { 𝕊 ⟨i, ·⟩:
    ⟨i1, ·⟩ ← x1 ← Travel 𝕩
    visited ↩ (1⎉0)⌾((i Path i1)⊸⊏) visited
    x1
  }

  Step •_while_ (0⊸<∘⊑) (⊑ ⥊⊸⊐⟜'^' map)‿0

  +´ visited
}

•Show∘Solve∘Load¨ •args
