@time "Load module" using TicTacToes
using Test

macro alloc(expr)
    argnames = [gensym() for a in expr.args]
    quote
        function g($(argnames...))
            @allocated $(Expr(expr.head, argnames...))
        end
        $(Expr(:call, :g, (esc(a) for a in expr.args)...))
    end
end

@testset "TicTacToes.jl" begin
    g = TicTacToe()
    @test_throws "Position" play!(g, -1)
    @test 0            == @alloc play!(g, 1)
    @test g.x          == 0x004
    @test 0            == @alloc ai!(g)
    @test (0, 1, 2, 3) == Int.(instances(GameState))
end
