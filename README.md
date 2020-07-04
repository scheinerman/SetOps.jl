# SetOps

[![Build Status](https://travis-ci.org/scheinerman/SetOps.jl.svg?branch=master)](https://travis-ci.org/scheinerman/SetOps.jl)

[![Coverage Status](https://coveralls.io/repos/scheinerman/SetOps.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/scheinerman/SetOps.jl?branch=master)

[![codecov.io](http://codecov.io/github/scheinerman/SetOps.jl/coverage.svg?branch=master)](http://codecov.io/github/scheinerman/SetOps.jl?branch=master)


This module provides easily typed operation
(infix) symbols for common set operations.

## Operations

Here, `A` and `B` are objects of type `Set`.

* **Union**: Either `A|B` or `A+B`.
* **Intersection**: `A&B`.
* **Set difference**: `A-B`.
* **Symmetric difference**: `A$B`.
* **Cartesian product**: Either `A*B` or `A×B`.

We also provide `powerset(A)` which yields the
set of all subsets of `A`.

## Examples

The nice output seen here is thanks to the use of the `ShowSet`
module.
```
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

julia> powerset(Set(1:3))
{{2},{3},{},{2,3},{1,2,3},{1},{1,3},{1,2}}
```

## Mixed types

Operations on sets of two different types work nicely. Here
are some examples.

```
julia> A = Set(1:3); typeof(A)
Set{Int64}

julia> B = Set([3.0, 4.5]); typeof(B)
Set{Float64}

julia> A|B
{1,2,3.0,4.5}

julia> A-B
{1,2}

julia> typeof(A&B)
Set{Int64}

julia> typeof(A|B)
Set{Real}
```



## Limitation

These functions do *not* work for sets of type `BitSet`
(but work fine for sets of type `Set{Int}`).
