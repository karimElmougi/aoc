#! /usr/bin/env BQN

⟨Split⟩ ← •Import "../../utils.bqn"

input ← ' '⊸Split¨ •FLines "input.txt"
# input ← ' '⊸Split¨ ⟨
#     "A Y"
#     "B X"
#     "C Z"
# ⟩
input ↩ > ∾¨ input - <"AX"
[elf, self] ← ⍉input

move_map ← [
    2‿0‿1
    0‿1‿2
    1‿2‿0
]
score_map ← ⌽˘ move_map × 3
Score ← {+´ (𝕩 ⊏ 1‿2‿3) + ⊑⟜score_map˘ ⍉[𝕩, elf]}

# Part 1
•Show Score self

# Part 2
•Show Score  ⊑⟜move_map˘ input
