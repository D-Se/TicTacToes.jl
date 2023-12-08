var documenterSearchIndex = {"docs":
[{"location":"references/#References","page":"References","title":"References","text":"","category":"section"},{"location":"references/","page":"References","title":"References","text":"hi there!","category":"page"},{"location":"references/","page":"References","title":"References","text":"Modules = [TicTacToes]\nOrder   = [:module, :type, :macro, :function, :constant]","category":"page"},{"location":"references/#TicTacToes.GameState","page":"References","title":"TicTacToes.GameState","text":"Enum of RUN (ongoing game), X/O - X or O has won, DRAW - the game is drawn.\n\n\n\n\n\n","category":"type"},{"location":"references/#TicTacToes.TicTacToe","page":"References","title":"TicTacToes.TicTacToe","text":"TicTacToe(x::UInt16, y::UInt16, who::Bool, n::Int, state::GameState)\n\nRepresent the Xs and Os, turn information and the progress of the game.\n\n\n\n\n\n","category":"type"},{"location":"references/#TicTacToes.ai!-Tuple{TicTacToe}","page":"References","title":"TicTacToes.ai!","text":"Plays a somewhat good move on a TicTacToe object.\n\n\n\n\n\n","category":"method"},{"location":"references/#TicTacToes.play!-Tuple{TicTacToe, Int64}","page":"References","title":"TicTacToes.play!","text":"place an X or O at a position.\n\n\n\n\n\n","category":"method"},{"location":"references/#Index","page":"References","title":"Index","text":"","category":"section"},{"location":"references/","page":"References","title":"References","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = TicTacToes","category":"page"},{"location":"#How-to-play","page":"Home","title":"How to play","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"tip: Tip\nPositions on the board are numbered 1-9.1  2  3\n4  5  6\n7  8  9","category":"page"},{"location":"#Human-v-Human","page":"Home","title":"Human v Human","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Run play! with a position (Int) you want to place your glyph at.","category":"page"},{"location":"","page":"Home","title":"Home","text":"game = TicTacToe()      # start a fresh game\nplay!(game, 1)          # place \"X\" on position 1\nplay!(game, 5)          # place \"O\" on position 5","category":"page"},{"location":"#Human-v-PC","page":"Home","title":"Human v PC","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Test your skills against ai!, who was requested to keep the (solved) game fun.","category":"page"},{"location":"","page":"Home","title":"Home","text":"game = TicTacToe()\nai!(game)","category":"page"},{"location":"#PC-v-PC","page":"Home","title":"PC v PC","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"function self_play()\n    g = TicTacToe()\n    while Int(g.state) == 0\n        ai!(g)\n    end\n    g.state\nend\n\nres = [self_play() for _ in 1:10_000_000]","category":"page"},{"location":"#Programmer-vs-PC","page":"Home","title":"Programmer vs PC","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Some open challenges in order in increasing difficulty:","category":"page"},{"location":"","page":"Home","title":"Home","text":"Can you write an agent that beats ai!?\nCan you verify if ai! moves randomly?\nCan you rewrite ai! so that is faster?\nCan you extend TicTacToe to an n*n board?","category":"page"}]
}