#! /usr/bin/env BQN
⟨ToNum, Split, ln⟩ ← •Import "../../utils.bqn"
input ← •FLines "input.txt"

input ToNum¨↩
•Show +´ (0 « input) > input

window_sums ← +´˘(3 ↕ input)
•Show +´ (0 « window_sums) > window_sums