#! /usr/bin/env BQN

⟨Split, ToNum⟩ ← •Import "../../utils.bqn"

input ← •FLines "input.txt"

input (('a'⊸=∘⊑) ◶ (0˙)‿(ToNum (1⊸⊑)∘(' '⊸Split)))¨ ↩

x ← 1 + +˝ > (+` 1 + 0⊸≠)⊸({ (⥊⟜0 𝕨) » 240 ⥊ 𝕩 }¨) input

•Show +´ (⊑⟜x¨∘-⟜1)⊸× 20+40×↕6
•Show ['.','#'] ⊏˜ (↕40) (≤⟜1 |∘-)˘○(6‿40⊸⥊) x