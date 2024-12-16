#! /usr/bin/env -S bqn -f

deque ← •Import "deque.bqn"

SplitM ← (¬-˜ ⊢× ·+`»⊸>)⊸⊔

Load ← {{a‿b: (>a)‿(∾b)} ""⊸≢¨⊸SplitM •FLines 𝕩}
moveopts ← "^>v<"
deltas ← ⟨¯1‿0, right←0‿1, 1‿0, left←0‿¯1⟩
DoubleSquare ← {
  𝕊 '#': "##" ;
  𝕊 'O': "[]" ;
  𝕊 '.': ".." ;
  𝕊 '@': "@."
}
Solve ← { 𝕊 map‿moves:
  map (∾ DoubleSquare¨)˘↩
  rpos0 ← ⊑ ('@'=map) /○⥊ ↕≢map
  map '.'⌾(rpos0⊸⊑)↩
  moves (⊏⟜deltas moveopts⊸⊐)↩

  TryMove ← { d 𝕊 rpos:
    rpos1 ← d+rpos
    visited ← ⟨rpos1⟩•HashMap⟨1⟩
    tocheck ← deque.Deque ⟨rpos1⟩
    tomove ← deque.Deque ⟨⟩

    Consider ← {
      𝕊 p: visited.Has p ? @ ;
      𝕊 p: p visited.Set 1 ⋄ tocheck.PushBack p ⋄ @
    }
    CheckSquare ← {
      · 𝕊 '.': 1 ;
      · 𝕊 '#': rpos1 ↩ rpos
               tomove ↩ deque.Deque ⟨⟩
               0 ;
      p 𝕊 '[': tomove.PushFront p
               Consider d+p
               Consider right+d+p
               1 ;
      p 𝕊 ']': tomove.PushFront left+p
               Consider left+d+p
               Consider d+p
               1
    }
    Step ← {𝕤
      tocheck.IsEmpty@ ? 0 ;
      p CheckSquare (p ← tocheck.PopFront@) ⊑ map
    }
    MoveBox ← { 𝕊 p:
      map '.'⌾((p)⊸⊑)↩
      map '.'⌾((right+p)⊸⊑)↩
      map '['⌾((d+p)⊸⊑)↩
      map ']'⌾((right+d+p)⊸⊑)↩
    }

    (Step)•_while_(⊢) 1
    MoveBox¨ tomove.Contents@
    rpos1
  }
  rpos0 TryMove´ ⌽moves

  +´ 100‿1× +˝ > ('['=map) /○⥊ ↕≢map
}

•Show∘Solve∘Load¨ •args
