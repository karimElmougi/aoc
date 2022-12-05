#! /usr/bin/env BQN

⟨Partition, ToNum⟩ ← •Import "../../utils.bqn"

input ← •FLines "input.txt"
# input ← ⟨
#     "    [D]    "
#     "[N] [C]    "
#     "[Z] [M] [P]"
#     " 1   2   3 "
#     ""
#     "move 1 from 2 to 1"
#     "move 3 from 1 to 3"
#     "move 2 from 2 to 1"
#     "move 1 from 1 to 2"
# ⟩

⟨stacks, instructions⟩ ← (×≠¨)⊸Partition input
stacks ↩ @∾ ' '⊸≠⊸/¨ <˘ ¯1↓˘ {1+4×↕4÷˜1+≠𝕩}⊸⊏ (⍉> stacks)
instructions ↩ (ToNum¨ (≥⟜'0'∧≤⟜'9')⊸Partition)¨ instructions

_to_stack ← {Fn _𝕣:
    {𝕊 stack:
        Push ⇐ {stack ↩ 𝕩∾stack }
        Pop ⇐ {𝕤 ⋄ head ← 𝕩↑stack ⋄ stack ↩ 𝕩↓stack ⋄ Fn head} 
        Data ⇐ {𝕤 ⋄ stack }
    }
}
Push ← {𝕨.Push 𝕩}
Pop ← {𝕨.Pop 𝕩}
Data ← {𝕩.Data@}

Apply ← { 
    st ← 𝕩
    ins ← 𝕨
    { n‿from‿to ← 𝕩 ⋄ (to⊸⊑ Push Pop⟜n∘(from⊸⊑)) st }¨ ins 
    ⊑∘Data¨ st
}

•Show instructions Apply ⌽_to_stack¨ stacks
•Show instructions Apply ⊢_to_stack¨ stacks
