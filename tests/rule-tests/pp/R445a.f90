MODULE myjunk
TYPE POINT
  REAL :: X, Y
CONTAINS
PROCEDURE, PASS :: LENGTH => POINT_LENGTH
END TYPE POINT

CONTAINS

REAL FUNCTION POINT_LENGTH(A,B)
CLASS(POINT), INTENT(IN) :: A, B
POINT_LENGTH = SQRT((A%X-B%X)**2+(A%Y-B%Y)**2)
END FUNCTION POINT_LENGTH
END MODULE
