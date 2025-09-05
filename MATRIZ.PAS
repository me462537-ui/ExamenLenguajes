{MEJIA PEREZ JOSE EDUARDO}
program MultiplicarMatrices;

uses crt;  { opcional, solo si quieres limpiar pantalla }

const
  MAX = 10;  { tamaño máximo de las matrices }

var
  A, B, C: array[1..MAX, 1..MAX] of Integer;
  rA, cA, rB, cB: Integer;
  i, j, k, suma: Integer;

begin
  clrscr;

  { Leer dimensiones }
  writeln('Filas de A: ');
  readln(rA);
  writeln('Columnas de A: ');
  readln(cA);
  writeln('Filas de B: ');
  readln(rB);
  writeln('Columnas de B: ');
  readln(cB);

  if cA <> rB then
  begin
    writeln('No se pueden multiplicar: columnas de A (', cA,
            ') debe ser igual a filas de B (', rB, ').');
    readln;
    exit;
  end;

  { Leer matriz A }
  writeln('Introduce la matriz A:');
  for i := 1 to rA do
    for j := 1 to cA do
    begin
      write('A[', i, '][', j, ']: ');
      readln(A[i,j]);
    end;

  { Leer matriz B }
  writeln('Introduce la matriz B:');
  for i := 1 to rB do
    for j := 1 to cB do
    begin
      write('B[', i, '][', j, ']: ');
      readln(B[i,j]);
    end;

  { Inicializar C a cero }
  for i := 1 to rA do
    for j := 1 to cB do
      C[i,j] := 0;

  { Multiplicar matrices }
  for i := 1 to rA do
    for j := 1 to cB do
    begin
      suma := 0;
      for k := 1 to cA do
        suma := suma + A[i,k] * B[k,j];
      C[i,j] := suma;
    end;

  { Imprimir matriz resultado C }
  writeln('Resultado C = A x B:');
  for i := 1 to rA do
  begin
    for j := 1 to cB do
      write(C[i,j]:8);  { ancho 8 para alineación }
    writeln;
  end;

  writeln('Presiona ENTER para salir...');
  readln;
end.
