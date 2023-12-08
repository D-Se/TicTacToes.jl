```@meta
CurrentModule = TicTacToes
```

# How to play

!!! tip

    Positions on the board are numbered 1-9.
    ```
    1  2  3
    4  5  6
    7  8  9
    ```

## Human v Human
Run `play!` with a position (`Int`) you want to place your glyph at.
```
game = TicTacToe()      # start a fresh game
play!(game, 1)          # place "X" on position 1
play!(game, 5)          # place "O" on position 5
```

## Human v PC
Test your skills against `ai!`, who was requested to keep the (solved) game fun.
```
game = TicTacToe()
ai!(game)
```

## PC v PC
```
function self_play()
    g = TicTacToe()
    while Int(g.state) == 0
        ai!(g)
    end
    g.state
end

res = [self_play() for _ in 1:10_000_000]
```

## Programmer vs PC
Some open challenges in order in increasing difficulty:
1. Can you write an agent that beats `ai!`?
2. Can you verify if `ai!` moves randomly?
3. Can you rewrite `ai!` so that is *faster*?
4. Can you extend `TicTacToe` to an ``n*n`` board?
