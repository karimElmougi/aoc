#! /usr/bin/env BQN
⟨ToNum, SplitF⟩ ← •Import "../../utils.bqn"
input ← ToNum¨¨ ⟨⟩SplitF •FLines "input.txt"

calories ← ∨+´¨ input
•Show ⊑calories
•Show +´3↑calories