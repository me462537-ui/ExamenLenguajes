!MEJIA PEREZ JOSE EDUARDO
program GenerarContrasena
  implicit none
  integer :: longitud, i, index, totalChars
  logical :: incluirMayusculas, incluirNumeros, incluirSimbolos
  character(len=200) :: caracteres
  character(len=200) :: contrasena
  real :: r

  ! Conjuntos de caracteres
  character(len=*), parameter :: letrasMinusculas = "abcdefghijklmnopqrstuvwxyz"
  character(len=*), parameter :: letrasMayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  character(len=*), parameter :: numeros = "0123456789"
  character(len=*), parameter :: simbolos = "!@#$%^&*()-_=+[]{};:,.<>?"

  ! Inicializar semilla
  call random_seed()

  ! Pedir longitud
  do
     print *, "Longitud de la contraseña (8-16):"
     read *, longitud
     if (longitud >= 8 .and. longitud <= 16) exit
     print *, "Error: debe estar entre 8 y 16."
  end do

  ! Preguntar opciones
  print *, "Incluir mayusculas? (s/n):"
  incluirMayusculas = leerSN()
  print *, "Incluir numeros? (s/n):"
  incluirNumeros = leerSN()
  print *, "Incluir simbolos? (s/n):"
  incluirSimbolos = leerSN()

  ! Construir conjunto de caracteres
  caracteres = letrasMinusculas
  if (incluirMayusculas) caracteres = trim(caracteres)//letrasMayusculas
  if (incluirNumeros)    caracteres = trim(caracteres)//numeros
  if (incluirSimbolos)   caracteres = trim(caracteres)//simbolos

  totalChars = len_trim(caracteres)
  contrasena = ""

  ! Generar contraseña
  do i = 1, longitud
     call random_number(r)
     index = int(r * totalChars) + 1
     contrasena(i:i) = caracteres(index:index)
  end do

  print *, "Contraseña generada: ", contrasena(1:longitud)
  
  print *, "Presiona ENTER para salir..."
read *, contrasena  ! solo para pausar la ejecución


contains

  logical function leerSN()
    character(len=1) :: resp
    do
       read *, resp
       if (resp == 's' .or. resp == 'S') then
          leerSN = .true.
          return
       else if (resp == 'n' .or. resp == 'N') then
          leerSN = .false.
          return
       else
          print *, "Responde s/n"
       end if
    end do
  end function leerSN



end program GenerarContrasena

