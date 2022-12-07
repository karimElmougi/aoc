#! /usr/bin/env BQN

⟨Partition, Split, ToNum⟩ ← •Import "../../utils.bqn"

input ← •FLines "input.txt"
# input ← ⟨
#     "$ cd /"
#     "$ ls"
#     "dir a"
#     "14848514 b.txt"
#     "8504156 c.dat"
#     "dir d"
#     "$ cd a"
#     "$ ls"
#     "dir e"
#     "29116 f"
#     "2557 g"
#     "62596 h.lst"
#     "$ cd e"
#     "$ ls"
#     "584 i"
#     "$ cd .."
#     "$ cd .."
#     "$ cd d"
#     "$ ls"
#     "4060174 j"
#     "8033020 d.log"
#     "5626152 d.ext"
#     "7214296 k"
# ⟩

Parent ← ("/"⊸≡ ◶  (¯1⊸↓)‿⊢) ∘ •file.Parent
JoinPath ← ⊑∘("."‿".."⊸⊐∘⋈)∘⊢◶⊣‿(Parent∘⊣)‿•file.At
StartsWith ← ∨´∘⍷˜

cd_mask ← StartsWith⟜"$ cd"¨ input
ls_mask ← StartsWith⟜"$ ls"¨ input

ls_results ← (¬∘StartsWith⟜"dir"¨)⊸/¨ (¬ ls_mask ∨ cd_mask) Partition input

sizes ← ToNum∘(0⊸⊑)∘(' '⊸Split)¨ ∾´ ls_results
names ← 1⊸⊑∘(' '⊸Split)¨ ∾´ ls_results

directories ← ⍷ (JoinPath` 5↓¨ cd_mask / input)
files ← names •file.At˜¨ (/≠¨ ls_results) ⊏ directories

DirSize ← { +´ /⟜sizes (StartsWith⟜𝕩)¨ files}
dir_sizes ← DirSize¨ directories

•Show +´ (≤⟜100000)⊸/ dir_sizes

free_space ← 70000000 - ⊑dir_sizes
to_free ← 30000000 - free_space
•Show ⊑ to_free⊸≤⊸/ ∧dir_sizes
