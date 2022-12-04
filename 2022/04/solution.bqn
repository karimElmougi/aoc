#! /usr/bin/env BQN

⟨Split, ToNum, To⟩ ← •Import "../../utils.bqn"

input ← •FLines "input.txt"
# input ← ⟨
#     "2-4,6-8"
#     "2-3,4-5"
#     "5-7,7-9"
#     "2-8,3-7"
#     "6-6,4-6"
#     "2-6,4-8"
# ⟩

input ↩ To´¨¨ ToNum¨¨¨ '-'⊸Split¨¨ ','⊸Split¨ input
overlap_lengths ← +´¨ ∊´¨ input
•Show +´ ∨´¨ overlap_lengths =¨ ≠¨¨input
•Show +´ overlap_lengths>0