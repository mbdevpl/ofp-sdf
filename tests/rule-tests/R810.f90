!! R810 case-construct
!    is critical-stmt
!          block
!       end-critical-stmt
!
! from NOTE 8.5
   CRITICAL 
      GLOBAL_COUNTER[1] = GLOBAL_COUNTER[1] + 1 
   END CRITICAL 
end
