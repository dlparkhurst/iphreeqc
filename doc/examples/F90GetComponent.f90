PROGRAM example
  USE IPhreeqc
  INTEGER(KIND=4) :: id
  INTEGER(KIND=4) :: i
  CHARACTER(LEN=40) :: comp
  
  id = CreateIPhreeqc()
  IF (id.LT.0) THEN
     STOP
  END IF
  
  IF (LoadDatabase(id, "phreeqc.dat").NE.0) THEN
     CALL OutputErrorString(id)
     STOP
  END IF
  
  IF (RunFile(id, "ex2").NE.0) THEN
     CALL OutputErrorString(id)
     STOP
  END IF
  
  DO i=1,GetComponentCount(id)
     CALL GetComponent(id, i, comp)
     WRITE(*,*) "comp ", i, " = ", comp
  END DO
  
  IF (DestroyIPhreeqc(id).NE.IPQ_OK) THEN
     CALL OutputErrorString(id)
     STOP
  END IF
END PROGRAM example
