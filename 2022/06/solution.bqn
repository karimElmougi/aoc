#! /usr/bin/env BQN

⟨Split⟩ ← •Import "../../utils.bqn"

input ← •FChars "input.txt"
# input ← "mjqjpqmgbljsphdztnvjfqwrcgsmlb"

•Show¨ { 𝕩 + ⊑ /⟜(↕∘≠) ⍷⊸≡˘ (𝕩↕input) }¨ 4‿14
