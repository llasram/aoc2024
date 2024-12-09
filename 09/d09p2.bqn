#! /usr/bin/env -S bqn -f

# m - map format, rle blocks
# b - blocks, individual
# f - file
# o - occupied
# a - available

Load ← -⟜'0' ¯1⊸↓∘•FBytes
Solve ← { 𝕊 map:
  momask ← ¬2|↕≠map
  mbid ← +` »map
  asize ← (¬momask) × map
  fsize ← momask / map
  ChecksumMove ← { fi 𝕊 cs:
     sz ← fi ⊑ fsize
     asize ↩ sz⌾((2×fi)⊸⊑) asize
     ai ← ⊑∘⊐⟜⟨1⟩ asize≥ sz
     fb ← ai⊑mbid
     asize ↩ (-⟜sz)⌾(ai⊸⊑) asize
     mbid ↩ (+⟜sz)⌾(ai⊸⊑) mbid
     cs+ fi× +´ fb+ ↕sz
  }

  0 ChecksumMove´ ↕≠fsize
}

•Show∘Solve∘Load¨ •args
