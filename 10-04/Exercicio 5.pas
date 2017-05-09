Program Matriz_aula_5_exe5 ;
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

function somapar (m:mat; nl, nc:integer): integer;
var
soma: integer;
i,j:integer;
begin
  soma:= 0;
  for i := 1 to nl do
  begin
    if i mod 2 = 0 then
    begin
      for j:= 1 to nc do
      begin
        soma:= soma + m[i,j];
      end;
    end;
  end;
  somapar:= soma;
end;

function somaimpar (m:mat; nl, nc:integer): integer;
var
soma: integer;
i,j:integer;
begin
  soma:= 0;
  for j := 1 to nc do
  begin
    if j mod 2 <> 0 then
    begin
      for i:= 1 to nl do
      begin
        soma:= soma + m[i,j];
      end;
    end;
  end;
  somaimpar:= soma;
end;

//programa principal

var
nl, nc: integer;
matriz: mat;

Begin
	writeln('Calculando a Soma de todas a linhas pares e a Soma de todas colunas impares!!!');
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
  writeln('A soma total das Linhas Pares é: ',somapar(matriz, nl, nc));
  writeln('A soma total das Colunas Impares é: ',somaimpar(matriz, nl, nc));
  
End.