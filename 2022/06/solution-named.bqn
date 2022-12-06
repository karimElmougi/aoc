#! /usr/bin/env BQN

⟨Split⟩ ← •Import "../../utils.bqn"

# input ← •FChars "input.txt"
input ← "mjqjpqmgbljsphdztnvjfqwrcgsmlb"

_with_ ← ⟜
_of_ ← ∘

Windows ← ⊣↕⊢
Indices ← ↕⊢

_for_cell ← ˘
Eq ← ⊣≡⊢
Distinct ← ⍷⊢
Length ← ≠⊢
Mask ← ⊣/⊢
First ← ⊑⊢

•Show {𝕩 + First Mask _with_(Indices _of_ Length) Eq _with_ Distinct _for_cell (𝕩 Windows input) }¨ 4‿14
