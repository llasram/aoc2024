#! /usr/bin/env -S bqn -f

# m - map format, rle blocks
# b - blocks, individual
# f - file
# o - occupied
# a - available

Load ← -⟜'0' ¯1⊸↓∘•FBytes
Solve ← { 𝕊 map:
  momask ← (≠map)⥊1‿0
  omap ← momask/map
  ototal ← +´ omap
  bomask ← ototal↑map/momask
  bsel ← (⊒⊸×∘- - ⊢)⟜¬ bomask
  bfids ← bsel ⊏ /omap
  +´ bfids × ↕ototal
}

•Show∘Solve∘Load¨ •args
