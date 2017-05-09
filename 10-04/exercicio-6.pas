Program Pzim ;

type
	alunos = array[1..8] of string;
	notas = array[1..8,1..5] of real;
     
Procedure lerAlunos(var v: alunos) ;
var i: integer;
Begin
  for i := 1 to 8 do
  begin
    writeln('Digite o nome do alunos'); readln(v[i, 1]);
  end;
End;

Procedure lerNotas(nt: notas) ;
var i, j: integer;
Begin
	for i := 1 to 8 do
 begin
	for j := 1 to 4 do
 begin
	write('Digite a nota do aluno: '); readln(nt[i,j]);
 end;
 end;
End;

Procedure medaluno(var nt: notas; no: alunos) ;
var i, j: integer;
var soma: integer;
Begin
  for i := 1 to 8 do
  begin
    soma:= 0;
    for j := 1 to 4 do
    begin
      soma:= soma + nt[i,j];
    end;
    
    nt[i,5]:= soma / 4;
    
    writeln('Aluno: ', no[i,1], ' Nota: ', nt[i,5]);
  end;
End;

Function medgeral(var n: notas):real ;
var soma: real;
var i: integer;
Begin
 soma:= 0;
 for i := 1 to 8 do
 begin
   soma:= soma + n[i,5];
 end;
 medgeral:= soma/8;
End;

var 
	aluno: alunos;
	nota: notas;

Begin

lerAlunos(aluno);
lerNotas(nota);
medaluno(nota, aluno);
write('Media geral: ', medgeral(nota));
  
End.