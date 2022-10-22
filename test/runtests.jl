using Test

using ArrayTrees

myfun(x) = x ^ 2 + 100

myarray = [rand(3), rand(1), rand(2)]
aa1 = ArrayTree{Float64}(myarray)
ma1 = map(myfun, aa1)
@test ma1.a == [[myfun(x) for x in y] for y in myarray]

aa11 = ArrayTree{Vector{Float64}}(myarray)
ma11 = map(aa11) do v sum(x->x^2+100, v) end
@test ma11.a == [sum(myfun,y) for y in myarray]

myarray2 = [rand(3,3), rand(1,1), rand(2,3)]
aa2 = ArrayTree{Float64}(myarray2)
ma2 = map(aa2) do x x^2+100 end
@test ma2.a == [[myfun(x) for x in y] for y in myarray2]

myarray3 = rand(2,3,4)
aa3 = ArrayTree{Float64}(myarray3)
ma3 = map(aa3) do x x^2+100 end
@test ma3.a == myfun.(myarray3)
