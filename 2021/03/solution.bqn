#! /usr/bin/env BQN
⟨ToNum, BinToNum⟩ ← •Import "../../utils.bqn"
# input ← •FLines "input.txt"
input ← ⟨
    "00100"
    "11110"
    "10110"
    "10111"
    "10101"
    "01111"
    "00111"
    "11100"
    "10000"
    "11001"
    "00010"
    "01010"
⟩

input ⍉∘>∘(-⟜'0'¨)↩
MostCommon ← {(⊑⍒⊒𝕩) ⊑ 𝕩}
gamma ← MostCommon˘ input
epsilon ← ¬gamma

•Show BinToNum gamma × BinToNum epsilon

•Show input
•Show ⍉input
•Show gamma
index ← ×˝ (gamma = input)
•Show index
•Show +˝ index × ⍉input