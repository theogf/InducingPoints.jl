"""
    StdDPP(X::AbstractMatrix, kernel::Kernel; obsdim::Int = 1)
    StdDPP(X::AbstractVector, kernel::Kernel)

Standard DPP (Determinantal Point Process) sampling given `kernel`.
The size of the returned `Z` is not fixed
"""
struct StdDPP{K<:Kernel} <: OffIPSA
    kernel::K
    function StdDPP(kernel::K) where {K<:Kernel}
        new{K}(kernel)
    end
end

function inducingpoints(rng::AbstractRNG, alg::StdDPP, X::AbstractVector; kwargs...)
    dpp = DPP(kernel, X)
    samp = rand(rng, dpp)
    while isempty(samp) # Sample from the DPP until there is a non-empty set
        samp = rand(rng, dpp)
    end
    return X[samp]
end