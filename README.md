# SetOps

The purpose of this module is to provide easily typed operation
(infix) symbols for common set operations.

## Operations

Here, `A` and `B` are objects of type `Set`.

* **Union**: Either `A|B` or `A+B`.
* **Intersection**: `A&B`.
* **Set difference**: `A-B`.
* **Symmetric difference**: `A$B`.
* **Cartesian product**: `A*B`.

We also provide `powerset(A)` which yields the
set of all subsets of `A`.

## Examples

The nice output seen here is thanks to the use of the `ShowSet`
module.
```julia
julia> A = Set(1:5)
{1,2,3,4,5}

julia> B = Set(3:6)
{3,4,5,6}

julia> A|B
{1,2,3,4,5,6}

julia> A&B
{3,4,5}

julia> A-B
{1,2}

julia> B-A
{6}

julia> A$B
{1,2,6}

julia> A*B
{(1,3),(1,4),(1,5),(1,6),(2,3),(2,4),(2,5),(2,6),(3,3),(3,4),(3,5),(3,6),(4,3),(4,4),(4,5),(4,6),(5,3),(5,4),(5,5),(5,6)}

julia> powerset(B)
{{3,4},{},{4,5},{3,5},{3,5,6},{4,5,6},{6},{3,4,6},{3},{4},{5},{3,4,5},{3,4,5,6},{5,6},{4,6},{3,6}}
```


## Note

These functions do *not* work for sets of type `IntSet`
(but are find for sets of type `Set{Int}`). At the moment,
I don't have the interest to code all the cases where
one or both of `A` or `B` is an `IntSet`, but welcome
that contribution.
