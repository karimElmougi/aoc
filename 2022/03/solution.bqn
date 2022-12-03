#! /usr/bin/env BQN

⟨Split, To, Chunk⟩ ← •Import "../../utils.bqn"

input ← •FLines "input.txt"
# input ← ⟨
#     "vJrwpWtwJgWrhcsFMMfFFhFp"
#     "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL"
#     "PmmdzqPrVvPwwTWBwg"
#     "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn"
#     "ttgJtRGJQctTZtZT"
#     "CrZsJsPPZsGzwwsLwLmpwMDw"
# ⟩

chars ← ('a' To 'z')∾('A' To 'Z')

HalfLen ← ÷⟜2≠
PocketCommon ← ∧´ (chars⊸∊¨ Chunk˜⟜HalfLen)
Priority ← +´ (+`=˜chars)⊸×

•Show +´ Priority∘PocketCommon¨ input

groups ← (∧´ chars⊸∊¨)¨ 3 Chunk input
•Show +´ Priority¨ groups