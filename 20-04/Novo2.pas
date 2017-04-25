Program Pzim ;

var
	alunos: array[1..8] of string;
	notas: array[1..8,1..5] of real;
     
Procedure lerAlunos(var v: alunos) ;
Begin
  for i := 1 to 8 do
  begin
    writeln('Digite o nome do alunos'); readln(v[i, 1]);
  end;
End;

Procedure medaluno(nt: vnota; no: vnome) ;
Begin
  for i := 1 to 8 do
  begin
    soma:= 0;
    for j := 1 to 4 do
    begin
      soma:= soma + nt[i,j];
    end;
    
    nt[i,5]:= soma / 4;
    
    writeln('Aluno: ', no[i], ' Nota: ', nt[i,5]);
  end;
End;

Function medgeral(var n: notas):real ;
var soma: real;
Begin
 soma:= 0;
 for i := 1 to 8 do
 begin
   soma:= soma + n[i,5];
 end;
 medgeral:= soma;
End;

Begin
  
End.