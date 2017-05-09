Program Matriz_aula_6_exe1 ;
type
mat = array [1..2,1..4] of integer;

procedure entrada (var m:mat);
var
i,j:integer;
begin
  for i:= 1 to 2 do
  begin
    for j:= 1 to 4 do
    begin
    	writeln('Informe os valores dos campos: ',i,'-',j);	
      read(m[i,j]);
    end;
  end;
end;

procedure saida (m:mat);
var
i,j:integer;
begin
  for i:= 1 to 2 do
  begin
    for j:= 1 to 4 do
    begin
    	writeln('Esse são os Valores dos campos: ',m[i,j]);	
    end;
  end;
end;

//programa principal

var	
matriz: mat;

Begin
	writeln('Exercicio 1!!!');
  writeln('');
	entrada(matriz);
  saida(matriz);
End.