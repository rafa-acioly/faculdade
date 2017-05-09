Program Matriz_aula_6_exe4 ;
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

procedure calculo (ma, mb:mat; var mc:mat; nl, nc:integer);
var
i,j:integer;
begin
  for i := 1 to nl do
  begin
    for j:= 1 to nc do
    begin
      mc[i,j]:= ma[i,j] * mb[i,j];
      writeln('A matriz resultante C é: ',mc[i,j]);
    end;
  end;
end;


//programa principal

var
nl, nc: integer;
matrizA, matrizB, matrizC: mat;

Begin
  writeln('Exercicio 4!!!');
  writeln('');
  writeln('Informe a quantidade de Linhas da Matriz');
  read(nl);
  valida(nl,20);
  writeln('');
  writeln('Informe a quantidade de Colunas da Matriz');
  read(nc);
  valida(nc,20);
  writeln('');
  writeln('Matriz A');
  entrada(matrizA, nl, nc);
  writeln('');
  writeln('Matriz B');
  entrada(matrizB, nl, nc);
  writeln('');
  calculo(matrizA,matrizB,matrizC, nl, nc);
  
End.