# TicTacToes

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://D-Se.github.io/TicTacToes.jl/stable/)
[![Build Status](https://github.com/D-Se/TicTacToes.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/D-Se/TicTacToes.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/D-Se/TicTacToes.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/D-Se/TicTacToes.jl)

`TicTacToes` is an overengineered Tic-Tac-Toe engine written in Julia. The game is a popular choice for coding exercises in interviews for entry-level programming positions. This repo is meant as a toy project to introduce programming and Julia concepts. It is small (<100 SLOC), yet blazing fast.

## Usage

Positions on the board are numbered 1-9.
```
1  2  3
4  5  6
7  8  9
```

### Human v Human
```
add https://github.com/D-Se/TicTacToes.git
using TicTacToes
game = TicTacToe()
play!(game, 1)
```
### Human v PC
```
using TicTacToes
game = TicTacToe()
ai!(game)           # play strength of a child
```

## Challenges
1. Can you write an agent that beats `ai!`?
2. Can you verify if `ai!` moves randomly?
3. Can you rewrite `ai!` so that is faster?
4. Can you extend TicTacToe to an `n∗n` board?
