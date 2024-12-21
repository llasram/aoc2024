#! /usr/bin/env -S bqn -f

Load ← •FLines

dchars ← "^.v"‿"<.>"
MakeOrder ← { 𝕊 ra‿ca:
  _Order_ ← {
    # Default is u/d before l/r, but we want l > d > u/r
    ·‿c1 _𝕣_ r2‿·: (c1=ca)∧(r2=ra) ? ⌽ ;  # Avoid gap
    r1‿· _𝕣_ ·‿c2: (r1=ra)∧(c2=ca) ? ⊢ ;  # Avoid gap
    ·‿c1 _𝕣_ ·‿c2: c2 < c1 ? ⌽ ;  # left
    r1‿· _𝕣_ r2‿·: r1 < r1 ? ⊢ ;  # down
    _𝕣_: ⊢ # otherwise
  }
  order
}
_EncDelta ← { rc1 Order _𝕣 rc2:
  d ← rc2 - rc1
  moves ← (|d) /¨ dchars ⋈∘⊑˜¨ 1+×d
  'A'∾˜ ∾ rc1 _Order_ rc2 moves
}
NeitherSpace ← {' '‿·𝕊·:0; ·𝕊' '‿·:0; 1}
MakeTransitions ← { 𝕊 keypad:
  coords ← ↕≢keypad
  order ← MakeOrder ⊑ (' '=keypad) /○⥊ coords

  index ⇐ ⥊keypad
  table ⇐ NeitherSpace◶⟨".", (Order _EncDelta)○(1⊸⊑)⟩⌜˜ keypad ⋈¨○⥊ coords
}

numeric ← MakeTransitions [
  "789"
  "456"
  "123"
  " 0A"
]
directional ← MakeTransitions [
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
