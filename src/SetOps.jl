module SetOps

import Base: (+), (-), (*), (|), (&)
export powerset, ($)

"""
For sets `A` and `B`, `A-B` is the set of all elements of `A`
that are not in `B`.
"""
(-)(A::Set, B::Set)::Set = setdiff(A,B)

"""
For sets `A` and `B`, `A+B` is the union of `A` and `B`.
"""
(+)(A::Set, B::Set)::Set= union(A,B)

"""
For sets `A` and `B`, `A|B` is the union of `A` and `B`.
"""
(|)(A::Set, B::Set)::Set = union(A,B)

"""
For sets `A` and `B`, `A&B` is the intersection of `A` and `B`.
"""
(&)(A::Set, B::Set)::Set = intersect(A,B)

"""
For sets `A` and `B`, `A\$B` is the symmetric difference of `A` and `B`.
"""
($)(A::Set, B::Set)::Set = symdiff(A,B)

"""
For sets `A` and `B`, `A*B` [also `A×B`] is the Cartesian product, i.e., the
set of all ordered pairs `(a,b)` with `a` chosen from `A` and
`b` chosen from `B`.
"""
(*)(A::Set{S}, B::Set{T}) where {S,T}=Set{Tuple{S,T}}((a,b) for a in A for b in B)
(×)(A::Set,B::Set) = A*B


"""
`powerset(A)` is the set of all subsets of the set `A`.
"""
function powerset(A::Set{T})::Set{Set{T}} where T
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
