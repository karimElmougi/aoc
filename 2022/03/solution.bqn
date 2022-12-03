#! /usr/bin/env BQN

⟨Split⟩ ← •Import "../../utils.bqn"

input ← •FLines "input.txt"
# input ← ⟨
#     "vJrwpWtwJgWrhcsFMMfFFhFp"
#     "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL"
#     "PmmdzqPrVvPwwTWBwg"
#     "wMqvLMZHhHMvwLHjbvcjnnSBnvTQCommon"
#     "ttgJtRGJQctTZtZT"
#     "CrZsJsPPZsGzwwsLwLmpwMDw"
# ⟩

Common ← {⍷ (𝕨 ∊ 𝕩) / 𝕨}
•Show +´ ⊑∘(Common´)¨ {<˘2‿∘⥊𝕩}¨ {m←𝕩≥'a' ⋄ 1+(26×¬m)+𝕩-m⊏"Aa"}¨ input
•Show +´ ⊑∘(Common´)¨ <˘∘‿3⥊ {m←𝕩≥'a' ⋄ 1+(26×¬m)+𝕩-m⊏"Aa"}¨ input