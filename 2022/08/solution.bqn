#! /usr/bin/env BQN

input ← •FLines "input.txt"
# input ← ⟨
#     "30373"
#     "25512"
#     "65332"
#     "33549"
#     "35390"
# ⟩

input ↩ > -⟜'0' input

•Show +´ +˝ ∨´ {(∊∘(⌈`)˘⌾((⍉∘⌽⊣)⍟𝕩)) input}¨ ↕4

ViewingDistance ← {row ← 𝕩 ⋄ { e‿rest ← ((𝕩⊑⊢)⋈(𝕩 + 1)⊸↓) row ⋄ ≠((⊑∘(1⊸+∘/∾≠) ≥⟜e)⊸↑ rest) }¨ ↕ ≠ row}
•Show ⌈´ ⌈˝ ×´ {(ViewingDistance˘⌾((⍉∘⌽⊣)⍟𝕩)) input}¨ ↕4

