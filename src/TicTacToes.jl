module TicTacToes
import Base: show
export TicTacToe, play!, ai!, GameState, RUN, DRAW, X, O

mutable struct MidSqWeyl x::UInt64; w::UInt64; s::UInt64 end
const rng = MidSqWeyl(0x123456789ABCD, time_ns(), 0xB5AD4ECEDA1CE2A9)
function random(r::MidSqWeyl)
    r.x *= r.x; r.w += r.s; r.x += r.w; r.x = (r.x >> 32) | (r.x << 32)
    Int(r.x % 9 + 1)
end

"Enum of RUN (ongoing game), X/O - X or O has won, DRAW - the game is drawn."
@enum GameState RUN X O DRAW
"""
    TicTacToe(x::UInt16, y::UInt16, who::Bool, n::Int, state::GameState)
Represent the Xs and Os, turn information and the progress of the game.
"""
mutable struct TicTacToe
    x::UInt16
    o::UInt16
    who::Bool
    n::Int
    state::GameState
end
TicTacToe() = TicTacToe(0x0000, 0x0000, true, 0, RUN)

function haswon(b::UInt16) # 0b00000_xoxoxoxox_00 for each player
    b&0x001C == 0x001C || b&0x00E0 == 0x00E0 || # 000000111 000111000 r1, r2
    b&0x0700 == 0x0700 || b&0x0124 == 0x0124 || # 111000000 001001001 r3, c1
    b&0x0248 == 0x0248 || b&0x0490 == 0x0490 || # 010010010 100100100 c2, c3
    b&0x0444 == 0x0444 || b&0x0150 == 0x0150    # 100010001 001010100 diags
end

(⋆)(v::UInt16, pos::Int) = v & (0x0002 << pos)
(⋆)(pos::Int)            =      0x0002 << pos
"place an X or O at a position."
function play!(g::TicTacToe, pos::Int)
    0 < pos < 10            || error("Position must be between 1 and 9.")
    g.x⋆pos == g.o⋆pos == 0 || error("Position already occupied.")
    if g.who
        g.x |= ⋆pos
        if haswon(g.x) g.state = X end
    else
        g.o |= ⋆pos
        if haswon(g.o) g.state = O end
    end
    g.n += 1
    g.who ⊻= true
    if g.n == 9 g.state = DRAW end
    g
end

function reason(g::TicTacToe, me, us)
    for w in (0x001C, 0x00E0, 0x0700, 0x0124, 0x0248, 0x0490, 0x0444, 0x0150)
        if count_ones(me & w) == 2
            # find a win pattern that is empty
            m = findfirst(pos -> w⋆pos ≠ 0 && (~us)⋆pos ≠ 0, 1:9)
            if !isnothing(m)
                play!(g, m)
                return true
            end
        end
    end
    false
end

"Plays a somewhat good move on a [`TicTacToe`](@ref) object."
function ai!(g::TicTacToe)
    g.n == 0 && return play!(g, random(rng))
    g.state == RUN || return g
    i, you = iseven(g.n) ? (g.x, g.o) : (g.o, g.x)
    us = i | you
    reason(g, i, us)   && return g  # try win
    reason(g, you, us) && return g  # try not lose
    for pos in ((i + us) % 9 + 1 for i in 1:9) # "random" choice
        if (~us)⋆pos ≠ 0 
            play!(g, pos) 
            return g
        end
    end
end

function show(io::IO, g::TicTacToe)
    if g.state == RUN
        for pos in 1:9
            write(io, g.x⋆pos ≠ 0 ? 'X' : g.o⋆pos ≠ 0 ? 'O' : '-')
            if pos % 3 == 0 write(io, '\n') end
        end
    elseif g.state == DRAW
        write(io, "Draw!")
    else
        write(io, "$(Symbol(g.state)) has won!")
    end
end
end
