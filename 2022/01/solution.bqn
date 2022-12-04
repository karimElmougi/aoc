#! /usr/bin/env BQN
⟨ToNum, Partition⟩ ← •Import "../../utils.bqn"

input ← ToNum¨¨ (×≠¨)⊸Partition •FLines "input.txt"

calories ← ∨+´¨ input
•Show ⊑calories
•Show +´3↑calories