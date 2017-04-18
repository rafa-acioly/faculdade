Program Pzim ;

Type
	agenda = record
		nome: string[10];
		telefone: string[14];
	end;
	
Procedure criar(var arq: text) ;
Begin
	{$I-}
	reset(arq);
	{$I+}
	
	if ( ioresult = 0 ) then begin
	  rewrite( arq );
 end else begin
    writeln('O arquivo ja existe!!');
 end;
	
	close( arq );
	writeln('Pressione qualquer tecla para voltar ao MENU');
	readkey;
End;

Procedure cadastra(var arq: text) ;
	var
		amigo: agenda;
Begin
	clrscr;
	append(arq);
	write('Nome: '); readln(amigo.nome);
	write('Telefone: '); readln(amigo.telefone);
	writeln(arq, amigo.nome);
	writeln(arq, amigo.telefone);
	close( arq );
	writeln('Pressione qualquer tecla para voltar ao MENU');
	readkey;
End;
	
Procedure exibe(var arq: text);
var
	amigo: agenda;
Begin
	clrscr;
	reset( arq );
	while ( not eof( arq ) ) do begin
		readln(arq, amigo.nome);
		readln(arq, amigo.telefone);
		
		writeln('Nome: ', amigo.nome);
		writeln('Telefone: ', amigo.telefone);
 end;
End;

var
	ag: text;
	i: integer;
	resp: boolean;
	op: integer;

Begin
	
	assign(ag, 'a8.txt');
	resp:= false;
	
	repeat
		clrscr;
		writeln('Menu de opções');
		writeln;
		writeln('1 - criar arquivo');
		writeln('2 - cadastrar');
		writeln('3 - exibir');
		writeln('4 - sair');
		write('Digite sua opção: '); readln(op);
		case ( op ) of 
    1:  criar(ag);
    2:  cadastra(ag);
    3:  exibe(ag);
    4: resp:= true;
  end;
 until ( resp );
	readkey;	  
End.