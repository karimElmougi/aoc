#! /usr/bin/env BQN
⟨ToNum, Split⟩ ← •Import "../../utils.bqn"
input ← ' '⊸Split¨ •FLines "input.txt"
# input ← ' '⊸Split¨ ⟨
#     "A Y"
#     "B X"
#     "C Z"
# ⟩
input ↩ > ∾¨ input - <"AX"

move_map ← [2‿0‿1, 0‿1‿2, 1‿2‿0]
Score ← {+´ (𝕩 ⊏ 1‿2‿3) + ⊑⟜(⌽˘ move_map × 3)˘ ⍉[𝕩, 0⊏⍉input]}

# Part 1
•Show Score 1⊏⍉input

# Part 2
•Show Score  ⊑⟜move_map˘ input
