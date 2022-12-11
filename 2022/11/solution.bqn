#! /usr/bin/env BQN

⟨Split, ToNum, Partition⟩ ← •Import "../../utils.bqn"

input ← •FLines "input.txt"
# input ← ⟨
#     "Monkey 0:"
#     "  Starting items: 79, 98"
#     "  Operation: new = old * 19"
#     "  Test: divisible by 23"
#     "    If true: throw to monkey 2"
#     "    If false: throw to monkey 3"
#     ""
#     "Monkey 1:"
#     "  Starting items: 54, 65, 75, 74"
#     "  Operation: new = old + 6"
#     "  Test: divisible by 19"
#     "    If true: throw to monkey 2"
#     "    If false: throw to monkey 0"
#     ""
#     "Monkey 2:"
#     "  Starting items: 79, 60, 97"
#     "  Operation: new = old * old"
#     "  Test: divisible by 13"
#     "    If true: throw to monkey 1"
#     "    If false: throw to monkey 3"
#     ""
#     "Monkey 3:"
#     "  Starting items: 74"
#     "  Operation: new = old + 3"
#     "  Test: divisible by 17"
#     "    If true: throw to monkey 0"
#     "    If false: throw to monkey 1"
# ⟩

ParseOp ← (⊑ '+'‿'*'⊸⊐)⊑+‿× {𝔽}
ToFn ← { op‿arg ← ' '⊸Split 𝕩 ⋄ (𝕩 ≡ "* old") ⊑ ((ParseOp op)⟜(ToNum arg))‿(⋆⟜2) }
Parse ← ((ToNum¨)∘(", "⊸Split)∘(18⊸↓))‿(ToFn 23⊸↓)‿(ToNum 21⊸↓)‿(ToNum 29⊸↓)‿(ToNum 30⊸↓) {𝕎 𝕩}¨ 1⊸↓

input ↩ Parse¨ ((0⊸≠)∘≠¨)⊸Partition input

_Run ← {Fn _𝕣 rounds:
    monkeys ← ⟨⟩
    monkeys ↩ {𝕊 items‿op‿div‿true‿false:
        Op ↩ op {𝔽}
        inspect ⇐ 0

        Push ⇐ {items ↩ items∾𝕩}
        Run ⇐ {𝕤
            { 
                worry ← Fn Op 𝕩
                is_divisible ← (0⊸= div⊸|) worry
                monkey ← { is_divisible ? true ; false} ⊑ monkeys
                monkey.Push worry 
            }¨ items
            inspect ↩ inspect + ≠items
            items ↩ ⟨⟩
        }
    }¨ input
    {𝕊 𝕩: {{𝕩.Run@}¨ monkeys}}¨ ↕rounds
    monkeys
}

max_worry ← ×´ (2⊸⊑⊢)¨ input
•Show¨ { ×´ 2⊸↑ ∨ {𝕩.inspect}¨ 𝕩 }¨ ((⌊ ÷⟜3)_Run 20)‿((max_worry⊸|)_Run 10000)