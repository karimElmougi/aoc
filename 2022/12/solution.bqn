#! /usr/bin/env BQN

input ← •FLines "input.txt"
# input ← ⟨
#     "Sabqponm"
#     "abcryxxl"
#     "accszExk"
#     "acctuvwj"
#     "abdefghi"
# ⟩
input >↩

height ← ((('z'-'a')⊸× =⟜'E')+(-⟜'a' × (≠⟜'S' ∧ ≠⟜'E'))) input
src ← ⊑ (=⟜'S' /○((×´≢)⊸⥊) ↕∘≢) input
dst ← ⊑ (=⟜'E' /○((×´≢)⊸⥊) ↕∘≢) input

up  ←   1 ≥ -⟜((⥊⟜¯∞ 1⊸⊑∘≢)⊸») height
down ←  1 ≥ -⟜((⥊⟜¯∞ 1⊸⊑∘≢)⊸«) height
left ←  1 ≥ -⟜((⥊⟜¯∞ ⊑∘≢)⊸(»˘)) height
right ← 1 ≥ -⟜((⥊⟜¯∞ ⊑∘≢)⊸(«˘)) height

Children ← { y‿x ← i ← 𝕩 ⋄ (i⊸⊑¨ up‿down‿left‿right) / ⟨y-1, x⟩‿⟨y+1, x⟩‿⟨y, x-1⟩‿⟨y, x+1⟩ }

PathLengthFrom ← {
    g ← 𝕩
    ⊑{c‿v: (c + 1)‿(⍷ ∾ Children¨ v)}•_while_{c‿v: ¬ v ∨´∘∊˜ g} 0‿⟨𝕨⟩
}

•Show dst PathLengthFrom ⟨src⟩

zeroes ← (=⟜0 /○((×´≢)⊸⥊) ↕∘≢) height
•Show dst PathLengthFrom zeroes
