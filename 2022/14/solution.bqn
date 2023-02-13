#! /usr/bin/env BQN

⟨Split, ToNum⟩ ← •Import "../../utils.bqn"

# input ← •FLines "input.txt"

input ← ⟨
    "498,4 -> 498,6 -> 496,6"
    "503,4 -> 502,4 -> 502,9 -> 494,9"
⟩

•Show input ↩ >¨ ToNum¨¨¨ ","⊸Split¨¨ " -> "⊸Split¨ input 
•Show m‿· ← ⌊˝˘ ⍉ ∾ input
•Show input -⟜(m≍0)˘¨ ↩
•Show h‿w ← s ← ⌈˝˘ ⍉∾ input
•Show ((⥊⟜0 w ⋈˜ h-1) ∾ (w ⥊ 0) »˜ ⥊⟜1) 4
•Show « ((⥊⟜0 w ⋈˜ h-1) ∾ (w ⥊ 0) »˜ ⥊⟜1) 4
•Show 3‿2 {x‿y ← 𝕨 ⋄ (-x)⊸⌽˘ (-y) ⌽ ((⥊⟜0 w ⋈˜ h-1) ∾˜ (w ⥊ 0) »˜ ⥊⟜1) 𝕩 } 4
# •Show 2↕ 1⊑input
# •Show =˝˘ 2↕ 1⊑input
# •Show -˝˘ 2↕ 1⊑input
# •Show (⊑input)
# •Show -⟜(m≍0)˘ (⊑input)
# •Show ⌈˝¨ input

# •Show input - ⟨≍⟜0 400 , [400, 0]⟩
# •Show min ← ⌊˝⎉1 ¨ input
# •Show input ↩ {y‿x ← 𝕩 ⋄ (y-min)‿x}¨¨ input
# •Show shape ← ⌊´ ∾ ⊑¨¨ input