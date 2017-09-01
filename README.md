# SetOps


The basic set operations of union and intersection work
fine in Julia. This module simply makes some set operations
more convenient.

## Operations

Here, `A` and `B` are objects of type `Set`.

* `A+B` is the union (everything in `A`
  or `B` or both).
* `A-B` is the set difference (everything in `A` that
  is not in `B`).
* `A*B` is the Cartesian product (the set of all ordered
  pairs `(a,b)` with `a` in `A` and `b` in `B`).
* `powerset(A)` is the set of all subsets of `A`.


## Notes

Julia already has functions such as `union`, `intersect`,
`symdiff`, and so on. The functions `+` and `-` are for
convenience while `*` and `powerset` are new.

These functions do *not* work for sets of type `IntSet`
(but are find for sets of type `Set{Int}`). At the moment,
I don't have the interest to code all the cases where
one or both of `A` or `B` is an `IntSet`, but welcome
that contribution.
