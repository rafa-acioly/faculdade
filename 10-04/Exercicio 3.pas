Program Matriz_aula_6_exe3 ;
type
mat = array [1..20,1..20] of integer;

procedure valida (var n:integer; max: integer);
begin
  while (n < 1) or (n > max) do
  begin
    writeln('Numero invalido');
    read(n);
  end;
end;

procedure entrada (var m:mat; nl, nc:integer);
var
i,j:integer;
begin
  for i:= 1 to nl do
  begin
    for j:= 1 to nc do
    begin
      writeln('Informe os valores dos campos: ',i,'-',j);
      read(m[i,j]);
    end;
  end;
end;

procedure calcmatB (m:mat; var m2:mat; nl, nc:integer);
var
k: integer;
i,j:integer;
begin
  writeln('Informe o Valor K: ');
  read(k);
  for i := 1 to nl do
  begin
    for j:= 1 to nc do
    begin
      m2[i,j]:= k * m[i,j];
      writeln('A matriz resultante B é: ',m2[i,j]);
		end;
  end;
end;


//programa principal

var
nl, nc: integer;
matriz, matrizB: mat;

Begin
writeln('Exercicio 3!!!');
writeln('');
writeln('Informe a quantidade de Linhas da Matriz');
read(nl);
valida(nl,20);
writeln('');
writeln('Informe a quantidade de Colunas da Matriz');
read(nc);
valida(nc,20);
writeln('');
entrada(matriz, nl, nc);
calcmatB(matriz,matrizB, nl, nc);

End.