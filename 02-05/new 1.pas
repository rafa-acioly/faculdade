program Ex2;

type
	amigo = record
		nome: string[30];
		tel: string[20];
	end;
arquivo = file of amigo;

Procedure cadastra(var a:arquivo);
var ag: amigo;
Begin
	reset(a);
	seek(a, Filesize(a));
	write('Digite o nome: ');
	readln(ag.nome);
	write('Digite o telefone: ');
	readln(ag.tel);
	write(a, ag);
	close(a);
	writeln('Pressione qualquer tecla para voltar ao menu');
	readkey;
end;

Procedure exibe(var a:arquivo);
var ag: amigo;
Begin
	reset(a);
	while not eof(a) do
	begin
		read(a, ag);
		writeln('Nome: ', ag.nome);
		writeln('Telefone: ', ag.tel);
	end;
	close(a);
	writeln('Pressione qualquer tecla para voltar ao menu');
	readkey;
end;

Procedure altera(var a: arquivo);
var
	ag: amigo;
	escolha: string[30];
	x: integer;
Begin
	x:= 0;
	writeln('Digite o nome a ser pesquisado: ');
	readln(escolha);
	reset(a);
	while not eof(a) do
	begin
		read(a, ag);
		if (escolha = ag.nome) then
		begin
			writeln('--- Dados atuais ---');
			writeln('Nome: ', ag.nome);
			writeln('Telefone: ', ag.tel);
			writeln;
			x:= Filepos(a);
			seek(a, x-1);
			write('Digite o nome: ');
			readln(ag.nome);
			write('Digite o telefone: ');
			readln(ag.tel);
			write(a, ag);
			seek(a, Filesize(a));
		end
	end;
	close(a);
	if x = 0 then
		write('Nome não consta na agenda');
	writeln('Pressione qualquer tecla para voltar ao menu');
	readkey;
end;

var
	arq: arquivo;
	ag: amigo;
	op: integer;
begin

assign(arq, 'a1.dat');
{$I-}
reset(arq);
{$I+}
if ioresult <> 0 then
	rewrite(arq);
close(arq);

repeat
	clrscr;
	writeln('--------- Menu -------');
	writeln('1 - Inserir novo amigo');
	writeln('2 - Listar amigos');
	writeln('3 - Alterar dados de um amigo');
	writeln('4 - Sair');
	writeln('----------------------');
	write('Digite sua opção: ');
	readln(op);
	clrscr;
	case op of
	1: cadastra(arq);
	2: exibe(arq);
	3: altera(arq);
	4: writeln('Finalizando o sistema');
	end;
until op = 4;
readkey;
end.