Program Pzim ;

Type
	mat = array[1..20,1..20] of integer;

Procedure valida(var n:integer; max:integer) ;
Begin
	repeat
		writeln('Digite um numero valido (1 a 20): '); readln(n);
  until ( n <= max );
End;

Procedure entrada(var m:mat; nl, nc:integer) ;
var i, j: integer;
Begin
 for i := 1 to nl do
 begin
 for j := 1 to nc do
	 begin
	 		writeln('Digite o valor: '); readln(m[i,j]);	
	 end;
 end;
End;

Function somapar(m: mat; nl:integer):real ;
var soma: integer;
Begin
 soma:= 0;
 for i := 1 to nl do
 begin
 	if ( i mod 2 = 0 ) then begin
    for j := 1 to nc do
    begin
      soma:= soma + m[i,j];
    end;
  end;	
 end;
 somapar:= soma;
End;

var
	m: mat;
	nl, nc: integer;
Begin

writeln('Digite o numero de linhas: '); readln(nl);
valida(nl, 20);
writeln('Digiteo numero de colunas: '); readln(nc);
valida(nc, 20);

entrada(m, nl, nc);
somapar(m, nl);

  
End.