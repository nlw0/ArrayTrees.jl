# ArrayTrees.jl

`ArrayTrees` is a type that allows array-of-arrays to be "mapped on" just like regular multidimensional arrays.

Suppose you have the following program

```
julia> myfun(x) = x ^ 2 + 100.0;

julia> myarray = [11.0 12.0 13.0; 21.0 22.0 23.0]
2×3 Matrix{Float64}:
 11.0  12.0  13.0
 21.0  22.0  23.0

julia> map(myfun, myarray)
2×3 Matrix{Float64}:
 221.0  244.0  269.0
 541.0  584.0  629.0
```

If your data is in a non-regular format, represented as an array tree, or an array-of-arrays, there's no simple way to `map` a function to the values. `ArrayTrees` allows you to do that.

```
julia> using ArrayTrees

julia> myarray = [[11.0, 12.0, 13.0],[ 21.0 22.0]]
2-element Vector{Array{Float64}}:
 [11.0, 12.0, 13.0]
 [21.0 22.0]

julia> mylol = ArrayTree{Float64}(myarray);

julia> mylolmap = map(myfun, mylol);

julia> mylolmap.a
2-element Vector{Array{Float64}}:
 [221.0, 244.0, 269.0]
 [541.0 584.0]
```
