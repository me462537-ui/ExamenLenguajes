{MEJIA PEREZ JOSE EDUARDO}
program GenerarContrasena;

var
  longitud, i, totalChars, index: Integer;
  incluirMayusculas, incluirNumeros, incluirSimbolos: Boolean;
  caracteres: string[200];
  contrasena: string[200];
  resp: Char;

const
  letrasMinusculas = 'abcdefghijklmnopqrstuvwxyz';
  letrasMayusculas = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  numeros = '0123456789';
  simbolos = '!@#$%^&*()-_=+[]{};:,.<>?';

begin
  Randomize;

  { Pedir longitud }
  repeat
    writeln('Longitud de la contraseña (8-16):');
    readln(longitud);
    if (longitud >= 8) and (longitud <= 16) then break;
    writeln('Error: debe estar entre 8 y 16.');
  until False;

  { Preguntar opciones }
  repeat
    writeln('Incluir mayusculas? (s/n):');
    readln(resp);
    if (resp='s') or (resp='S') then incluirMayusculas := True;
    if (resp='n') or (resp='N') then incluirMayusculas := False;
  until (resp='s') or (resp='S') or (resp='n') or (resp='N');

  repeat
    writeln('Incluir numeros? (s/n):');
    readln(resp);
    if (resp='s') or (resp='S') then incluirNumeros := True;
    if (resp='n') or (resp='N') then incluirNumeros := False;
  until (resp='s') or (resp='S') or (resp='n') or (resp='N');

  repeat
    writeln('Incluir simbolos? (s/n):');
    readln(resp);
    if (resp='s') or (resp='S') then incluirSimbolos := True;
    if (resp='n') or (resp='N') then incluirSimbolos := False;
  until (resp='s') or (resp='S') or (resp='n') or (resp='N');

  { Construir conjunto de caracteres }
  caracteres := letrasMinusculas;
  if incluirMayusculas then caracteres := caracteres + letrasMayusculas;
  if incluirNumeros then caracteres := caracteres + numeros;
  if incluirSimbolos then caracteres := caracteres + simbolos;

  totalChars := Length(caracteres);
  contrasena := '';

  { Generar contraseña }
  for i := 1 to longitud do
  begin
    index := Random(totalChars) + 1;  { devuelve 1..totalChars }
    contrasena := contrasena + caracteres[index];  { concatenar en vez de asignar }
  end;

  writeln('Contraseña generada: ', contrasena);
  writeln('Presiona ENTER para salir...');
  readln;
end.
