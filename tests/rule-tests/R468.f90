!! R468 array-constructor
!    is (/ ac-spec /)
!    or lbracket ac-spec rbracket
!
! NOTE 4.68
!
dimension X(3), Y(3,2)
X = (/ 3.2, 4.01, 6.5 /)
Y = RESHAPE (SOURCE = [ 2.0, [4.5, 4.5 ], X ], SHAPE = [ 3, 2 ])
end
