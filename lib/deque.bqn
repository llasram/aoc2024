MakeDeque ← { 𝕊 sa‿sz‿fi‿bi:
  Inspect ⇐ {𝕤⋄ sa‿sz‿fi‿bi}

  Count ⇐ {𝕤⋄ sz}
  Capacity ⇐ {𝕤⋄ ≠sa}
  IsEmpty ⇐ {𝕤⋄ sz=0}
  Contents ⇐ {𝕤⋄ sz=0 ? ⟨⟩ ; fi≤bi ? sz↑fi↓sa ; (fi↓sa)∾((bi+1)↑sa)}
  Clone ⇐ {𝕤⋄ MakeDeque sa‿sz‿fi‿bi}
  PeekFront ⇐ {𝕤⋄ "deque empty" ! sz>0 ⋄ fi⊑sa}
  PeekBack ⇐ {𝕤⋄ "deque empty" ! sz>0 ⋄ bi⊑sa}

  Reserve ⇐ {
    𝕊 n: n≤≠sa ? ≠sa ;
    𝕊 n: {
      sa ↩ n↑Contents@
      bi ↩ sz-1
      fi ↩ 0
    }
    n
  }
  Grow ← {𝕤⋄ Reserve 1⌈ 2⌊∘÷˜ 1+ 3× ≠sa }
  ShrinkToFit ⇐ {𝕤⋄ sa ↩ Contents@ ⋄ fi ↩ 0 ⋄ bi ↩ sz ⋄ @}

  PushBack ⇐ {
    { sz≥≠sa ? Grow@ ; @ }
    bi ((≠sa)|1+⊢)↩
    sa 𝕩˙⌾(bi⊸⊑)↩
    sz +↩ 1
    𝕩
  }
  PopBack ⇐ {𝕤
    "deque empty" ! sz>0
    x ← bi⊑sa
    sa 0⌾(bi⊸⊑)↩
    bi ((≠sa)|¯1+⊢)↩
    sz -↩ 1
    x
  }

  PushFront ⇐ {
    { sz≥≠sa ? Grow@ ; @ }
    fi ((≠sa)|¯1+⊢)↩
    sa 𝕩˙⌾(fi⊸⊑)↩
    sz +↩ 1
    𝕩
  }
  PopFront ⇐ {𝕤
    "deque empty" ! sz>0
    x ← fi⊑sa
    sa 0⌾(fi⊸⊑)↩
    fi ((≠sa)|1+⊢)↩
    sz -↩ 1
    x
  }
}

Deque ⇐ { 𝕊 contents:
  sa ← { contents≡@ ? ⟨⟩ ; contents }
  MakeDeque ⟨sa, sz←≠sa, 0, sz-1⟩
}

(•args≡⟨"test"⟩)◶⟨@, {𝕩.RunAll𝕩}⟩ {
  carrs ← ⟨"c8arr", "c16arr", "c32arr"⟩
  IsString ← ⊑ <∘•internal.Type ∊ carrs˙
  E ← {
    IsString 𝕩 ? 𝕩 ;
    ∾ { IsString 𝕩 ? 𝕩 ; •Fmt 𝕩 }¨ 𝕩
  }

  TestPushBackPopBack ⇐ {𝕤
    d ← Deque@ ⋄ d.PushBack¨ a←3‿1‿3‿3‿7 ⋄ g←d.PopBack¨ ↕≠a
    ⟨"d.PopBack¨ ↕≠w ⇒ ", g, ", want ", w⟩ ! g ≡ w←⌽a
  }

  TestPushBackPopFront ⇐ {𝕤
    d ← Deque@ ⋄ d.PushBack¨ a←3‿1‿3‿3‿7 ⋄ g←d.PopFront¨ ↕≠a
    ⟨"d.PopBack¨ ↕≠w ⇒ ", g, ", want ", w⟩ ! g ≡ w←a
  }

  TestPushFrontPopBack ⇐ {𝕤
    d ← Deque@ ⋄ d.PushFront¨ a←3‿1‿3‿3‿7 ⋄ g←d.PopBack¨ ↕≠a
    ⟨"d.PopBack¨ ↕≠w ⇒ ", g, ", want ", w⟩ ! g ≡ w←a
  }

  TestPushFrontPopFront ⇐ {𝕤
    d ← Deque@ ⋄ d.PushFront¨ a←3‿1‿3‿3‿7 ⋄ g←d.PopFront¨ ↕≠a
    ⟨"d.PopBack¨ ↕≠w ⇒ ", g, ", want ", w⟩ ! g ≡ w←⌽a
  }

  RunTest ← { name 𝕊 f:
    •Out name ∾ ": " ∾ ("passed"∘F)⎊("failed -- "∾E∘•CurrentError)@
  }

  RunAll ⇐ { 𝕊 tests:
    (⊢ RunTest tests⊸•ns.Get)¨ ("test"≡4↑⊢)¨⊸/ •ns.Keys tests
  }
}
