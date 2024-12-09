#! /usr/bin/env -S bqn -f

# m - map format, rle blocks
# b - blocks, individual
# f - file
# o - occupied
# a - available

Load ← -⟜'0' ¯1⊸↓∘•FBytes
Solve ← { 𝕊 map:
  momask ← ¬2|↕≠map
  ototal ← +´ momask× map
  obfids ← (⊢/↕∘≠) (momask / map)
  bomask ← ototal↑map/momask
  bsel ← (¯1 (⊢×+`) bomask) - (0 (⊢×+`) ¬bomask)
  bfids ← bsel ⊏ obfids
  +´ bfids × ↕ototal
}

•Show∘Solve∘Load¨ •args
