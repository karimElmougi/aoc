#! /usr/bin/env BQN

input ← •FChars "input.txt"
# input ← "mjqjpqmgbljsphdztnvjfqwrcgsmlb"

•Show¨ { 𝕩 + ⊑/ ⍷⊸≡˘ (𝕩↕input) }¨ 4‿14
