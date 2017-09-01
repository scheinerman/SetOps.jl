module SetOps


import Base.(+), Base.(-), Base.(*)
export powerset


"""
For sets `A` and `B`, `A-B` is the set of all elements of `A`
that are not in `B`.
"""
(-){T}(A::Set{T}, B::Set)::Set{T} = Set{T}(setdiff(A,B))



"""
For sets `A` and `B`, `A+B` is the union of `A` and `B`.
"""
(+){T}(A::Set{T}, B::Set)::Set{T} = Set{T}(union(A,B))



"""
For sets `A` and `B`, `A*B` is the Cartesian product, i.e., the
set of all ordered pairs `(a,b)` with `a` chosen from `A` and
`b` chosen from `B`.
"""
(*){S,T}(A::Set{S}, B::Set{T})=Set{Tuple{S,T}}((a,b) for a in A for b in B)


"""
`powerset(A)` is the set of all subsets of the set `A`.
"""
function powerset{T}(A::Set{T})::Set{Set{T}}
    if length(A) == 0
        return Set([Set{T}()])
    end

    a = first(A)
    AA = deepcopy(A)
    delete!(AA,a)

    P1 = powerset(AA)
    P2 = Set( union(X,Set([a])) for X in P1 )

    return union(P1,P2)
end

end
