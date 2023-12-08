using TicTacToes
using Documenter

DocMeta.setdocmeta!(TicTacToes, :DocTestSetup, :(using TicTacToes); recursive=true)

makedocs(;
    modules=[TicTacToes],
    authors="Donald Seinen",
    repo="https://github.com/D-Se/TicTacToes.jl/blob/{commit}{path}#{line}",
    sitename="TicTacToes.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://D-Se.github.io/TicTacToes.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/D-Se/TicTacToes.jl",
    devbranch="main",
)
