#! /usr/bin/env -S bqn -f

Load ← •FLines

dchars ← "^.v"‿"<.>"
_EncDelta ← { rc1 OrderR _𝕣 rc2:
  d ← rc2 - rc1
  moves ← (|d) /¨ dchars ⋈∘⊑˜¨ 1+×d
  'A'∾˜ ∾ rc1 _OrderR_ rc2 moves
}
NeitherSpace ← {' '‿·𝕊·:0; ·𝕊' '‿·:0; 1}
_MakeTransitions ← { OrderR _𝕣 keypad:
  index ⇐ ⥊keypad
  table ⇐ NeitherSpace◶⟨".", (OrderR _EncDelta)○(1⊸⊑)⟩⌜˜ keypad ⋈¨○⥊ ↕≢keypad
}

_OrderNumeric_ ← {
  # Default is u/d before l/r, but we want l > d > u/r
  ·‿0 _𝕣_ 3‿·: ⌽ ;  # Avoid gap
  3‿· _𝕣_ ·‿0: ⊢ ;  # Avoid gap
  ·‿c1 _𝕣_ ·‿c2: c2 < c1 ? ⌽ ;  # left
  r1‿· _𝕣_ r2‿·: r1 < r1 ? ⊢ ;  # down
  _𝕣_: ⊢ # otherwise
}
numeric ← OrderNumeric _MakeTransitions [
  "789"
  "456"
  "123"
  " 0A"
]

_OrderDirectional_ ← {
  # Default is u/d before l/r, but we want l > d > u/r
  ·‿0 _𝕣_ 0‿·: ⌽ ;  # Avoid gap
  0‿· _𝕣_ ·‿0: ⊢ ;  # Avoid gap
  ·‿c1 _𝕣_ ·‿c2: c2 < c1 ? ⌽ ;  # left
  r1‿· _𝕣_ r2‿·: r1 < r1 ? ⊢ ;  # down
  _𝕣_: ⊢ # otherwise
}
directional ← OrderDirectional _MakeTransitions [
  " ^A"
  "<v>"
]

EncodeKeypad ← { t 𝕊 seq:
  ∾ <∘(⊑⟜t.table)˘ 2↕t.index⊐'A'∾seq
}
EncodeStack ← { 𝕊 seq:
  directional EncodeKeypad⍟2 numeric EncodeKeypad seq
}
Complexity ← { 𝕊 code:
  num ← 0 +⟜(10⊸×)´ ⌽ '0'-˜ ¯1↓ code
  len ← ≠ EncodeStack code
  num × len
}
Solve ← +´ Complexity¨

•Show∘Solve∘Load¨ •args
