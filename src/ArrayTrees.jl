module ArrayTrees

export ArrayTree, map

import Base.map

struct ArrayTree{L,T,N}
    a::Array{T,N}
    ArrayTree{L}(a::Array{T,N}) where {L,T,N} = new{L,T,N}(a)
end

function Base.map(f, at::ArrayTree{L,T,N}) where {L,T,N}
    ArrayTree{L}(arraytreemap_(f, at.a, Val(L)))
end

function arraytreemap_(f, array::Array{L,N}, ::Val{L}) where {L,N}
    map(f, array)
end
function arraytreemap_(f, array::Array{T,N}, ::Val{L}) where {L,T,N}
    map(array) do x
        arraytreemap_(f, x, Val(L))
    end
end

end # module ArrayTree
