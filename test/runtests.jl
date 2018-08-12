using Test
using SetOps

A = Set(1:5)
B = Set(3:6)

@test A+B == Set(1:6)
@test A|B == A+B
@test A&B == Set(3:5)
@test B-A == Set(6)
@test A$B == Set([1,2,6])
@test length(A*B) == length(A)*length(B)
@test length(powerset(B)) == 16
