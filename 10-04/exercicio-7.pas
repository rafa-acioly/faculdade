Program Pzim ;

type
	mat = array[1..20, 1..20] of integer;
	
Procedure valida(var n:integer; max:integer) ;
Begin
  while ( (n < 1) or (n > max) ) do begin
		writeln('Digite o numero: '); readln(n);
  end;
End;

Procedure entrada(var m:mat; n:integer) ;
var i,j:integer;
Begin
	for i := 1 to n do
 begin
	for j := 1 to n do
 begin
 	writeln('Digite um numero: ');
	readln(m[i,j]);
 end;
 end;
End;

Function somaCol1(m:mat; n:integer) : real ;
var i:integer;
var s:real;
Begin
	s:= 0;
	for i := 1 to n do
	begin
 		s:= s + m[i,1];
	end;
	somaCol1:= s;
End;


Function produtoLin1(m:mat; n:integer) : real ;
var p: real;
var i: integer;
Begin
  p:= 1;
  for i := 1 to n do
  begin
    p:= p * m[1,i];
  end;
  produtoLin1:= p;
End;

Function somaDiagPrinc(m:mat; n:integer) : real ;
var s: real;
var i:integer;
Begin
  s:= 0;
  for i := 1 to n do
  begin
    s:= s + m[i,i];
  end;
  somaDiagPrinc:= s;
End;

Function somaDiagSec(m:mat; n:integer) : real ;
var s: real;
var i: integer;
Begin
  s:= 0;
  for i := 1 to n do
  begin
    s:= s + m[i, (n+1)-i];
  end;
  somaDiagSec:= s;
End;

Function somaTot(m:mat; n:integer) : real ;
var s: real;
var i,j: integer;
Begin
  s:= 0;
  for i := 1 to n do
  begin
    for j := 1 to n do
    begin
      s:= s + m[i,j];
    end;
  end;
  somaTot:= s;
End;

var
	n: integer;
	matriz: mat;

Begin

valida(n, 20);
entrada(matriz, n);
writeln('Soma coluna: ', somaCol1(matriz, n));
writeln('Soma lin: ', produtoLin1(matriz, n));
writeln('Soma diagonal principal: ', somaDiagPrinc(matriz, n));
writeln('soma diagonal secundaria: ', somaDiagSec(matriz, n));
writeln('soma total: ', somaTot(matriz, n));
  
End.