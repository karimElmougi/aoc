#! /usr/bin/env BQN
⟨ToNum, Split⟩ ← •Import "../../utils.bqn"
input ← •FLines "input.txt"
# input ← ⟨
#     "forward 5"
#     "down 5"
#     "forward 8"
#     "up 3"
#     "down 8"
#     "forward 2"
# ⟩

actions ← ⊑¨ input
values ← (ToNum 1⊑ ' '⊸Split)¨ input

# Parth 1
{
    horizontal ← +´ values × actions='f'
    depth ← +´ values × (actions='d')-actions='u'
    •Show horizontal × depth
}

# Parth 2
{
    aim ← +` values × (actions='d')-actions='u'
    forward ← actions='f'
    horizontal ← +´ values × forward
    depth ← +´ values × forward × aim
    •Show horizontal × depth
}