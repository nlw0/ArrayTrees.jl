module ArrayTrees

export ArrayTree, map

import Base.map

struct ArrayTree{L,T,N}
    a::Array{T,N}
    ArrayTree{L}(a::Array{T,N}) where {L,T,N} = new{L,T,N}(a)
end

function Base.map(f, at::ArrayTree{L,T,N}) where {L,T,N}
    ArrayTree{L}(arraytreemap_(f, at.a, L))
end

function arraytreemap_(f, array, L)
    if eltype(array) == L
        map(f, array)
    else
        map(array) do x
            arraytreemap_(f, x, L)
        end
    end
end

end # module ArrayTree
