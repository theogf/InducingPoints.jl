@testset "k-Means" begin
    seed!(42)
    N = 20
    nDim = 3
    M = 10

    X = rand(N, nDim)
    Z = KmeansIP(X, M, obsdim = 1)
    @test repr(Z) == "k-Means Selection of Inducing Points (k : $(M))"
    @test length(Z) == M
    Z = KmeansIP(X, M, obsdim = 1, weights = rand(N))
    @test length(Z) == M
    @test length(first(Z)) == nDim

    X = rand(nDim, N)
    Z = KmeansIP(X, M, obsdim = 2)
    @test length(Z) == M
    Z = KmeansIP(X, M, obsdim = 2, weights = rand(N))
    @test length(Z) == M
    @test length(first(Z)) == nDim
end
