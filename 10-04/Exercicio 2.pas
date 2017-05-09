Program Matriz_aula_6_exe2 ;
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

procedure saida (m:mat; nl, nc:integer);
var
i,j:integer;
begin
  for i:= 1 to nl do
  begin
    for j:= 1 to nc do
    begin
      writeln('Esse são os Valores dos campos: ',m[i,j]);
    end;
  end;
end;

function somatoria (m:mat; nl, nc:integer): integer;
var
soma: integer;
i,j:integer;
begin
  soma:= 0;
  for i := 1 to nl do
  begin
    for j:= 1 to nc do
    begin
      soma:= soma + m[i,j];
    end;
  end;
  somatoria:= soma;
end;


//programa principal

var
nl, nc: integer;
matriz: mat;

Begin
  writeln('Exercicio 2!!!');
  writeln;
  writeln('Informe a quantidade de Linhas da Matriz');
  read(nl);
  valida(nl,20);
  writeln('');
  writeln('Informe a quantidade de Colunas da Matriz');
  read(nc);
  valida(nc,20);
  writeln('');
  entrada(matriz, nl, nc);
  saida(matriz, nl, nc);
  writeln('A soma total da Matriz é: ',somatoria(matriz, nl, nc));
  
End.