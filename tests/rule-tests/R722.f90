!! R722 expr
!    is [ expr defined-binary-op ] level-5-expr
CHARACTER(LEN=10) :: H
LOGICAL :: a
INTEGER :: i
TYPE(set) :: s

s = (1 .intersect. 2) .UNION. (3 - 4)
a = 1 + 2 == 2 * 4
s = .inverse. (1 + 2)
a = ((1+2) .EQ. 3) .AND. ((3*4) .EQ. 12)
a = "E" // "G" == H (1:10)
i = 1 + 2 * 3
i = (1 + 2) * 3

end
