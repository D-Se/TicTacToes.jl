@time "Load module" using TicTacToes
using Test

macro alloc(expr)
    argnames = [gensym() for a in expr.args]
    quote
        g($(argnames...)) = @allocated $(Expr(expr.head, argnames...))
        $(Expr(:call, :g, (esc(a) for a in expr.args)...))
    end
end

@testset "TicTacToes.jl" begin
    g = TicTacToe()
    g2 = TicTacToe(0x0044, 0x0090, true, 5, RUN)
    @test_throws "Position" play!(g, -1)
    @test 0            == @alloc play!(g, 1)
    @test "X--\n---\n---\n" == repr(g)
    @test "Draw!"      == repr(TicTacToe(0x0000, 0x0000, true, 0, DRAW))
    @test g.x          == 0x004
    @test 0            == @alloc ai!(g)
    @test (0, 1, 2, 3) == Int.(instances(GameState))
    ai!(g2)
    @test "X has won!" == repr(g2)
end
