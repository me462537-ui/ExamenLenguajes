 !MEJIA PEREZ JOSE EDUARDO
program MultiplicarMatrices
  implicit none
  integer :: filasA, columnasA, filasB, columnasB
  integer :: i, j, k
  integer, allocatable :: A(:,:), B(:,:), C(:,:)

  ! Pedir dimensiones
  print *, 'Filas de A:'
  read *, filasA
  print *, 'Columnas de A:'
  read *, columnasA
  print *, 'Filas de B:'
  read *, filasB
  print *, 'Columnas de B:'
  read *, columnasB

  ! Verificar compatibilidad
  if (columnasA /= filasB) then
     print *, 'Error: No se pueden multiplicar. Las columnas de A deben ser iguales a las filas de B.'
     stop
  end if

  ! Reservar memoria según dimensiones
  allocate(A(filasA, columnasA))
  allocate(B(filasB, columnasB))
  allocate(C(filasA, columnasB))
  C = 0

  ! Leer A
  print *, 'Introduce los elementos de la matriz A:'
  do i = 1, filasA
     do j = 1, columnasA
        print *, 'A(', i, ',', j, ') ='
        read *, A(i,j)
     end do
  end do

  ! Leer B
  print *, 'Introduce los elementos de la matriz B:'
  do i = 1, filasB
     do j = 1, columnasB
        print *, 'B(', i, ',', j, ') ='
        read *, B(i,j)
     end do
  end do

  ! Multiplicar A * B = C
  do i = 1, filasA
     do j = 1, columnasB
        do k = 1, columnasA
           C(i,j) = C(i,j) + A(i,k) * B(k,j)
        end do
     end do
  end do

  ! Mostrar resultado
  print *, 'Resultado (C = A * B):'
  do i = 1, filasA
     write(*,'(100(I8))') (C(i,j), j = 1, columnasB)
  end do
  
  print *, "Presiona ENTER para salir..."
read(*,*)


  ! Liberar memoria
  deallocate(A, B, C)
end program MultiplicarMatrices
