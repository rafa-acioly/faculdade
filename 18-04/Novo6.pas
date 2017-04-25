Program Pzim ;

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
	s: string;
Begin
	clrscr;
	append(arq);
	write('Nome: '); readln(s);
	writeln(arq, s);
	close(arq);
	writeln('---Palavra salva com sucesso!---');
	writeln('Pressione qualquer tecla para voltar ao MENU');
	readkey;
End;


Procedure contar(arq: text) ;
var
	cont: integer;
	s: string;
Begin
	cont:= 0;
	{$I-}
	reset(arq);
	{$I+}
	
	if ( ioresult = 0 ) then begin
		while ( not eof(arq) ) do begin
			readln(arq, s);
   		cont:= cont + 1;
	 end;
	 writeln('Quantida de palavras cadastradas: ', cont);
 end;
 
 close( arq );
 writeln('Pressione qualquer tecla para voltar ao MENU');
 readkey;
End;

Procedure exibe(arq: text) ;
var s: string;
Begin
	reset(arq);
  while (not eof(arq)) do
  	Begin
  	  readln(arq, s);
  	  writeln(s);
  	End;
  close( arq );
  writeln('Pressione qualquer tecla para voltar ao MENU');
  readkey;
End;

Procedure procura(arq: text) ;
var s, palavra: string;
var res: boolean;
Begin
	res:= false;
	reset(arq);
	
	write('Digite a palavra que deseja buscar: '); readln(palavra);
	
	while ( not eof(arq) ) do
   Begin
  	readln(arq, s);
    if ( s = palavra ) then begin
      res:= true;
    end;
   End;
   
   
   if ( res ) then begin
     writeln('--- Palavra encontrada: ', s);
   end   else begin
     writeln('--- Palavra não encontrada!!');
   end;
  		
   
   close(arq);
   writeln('Pressione qualquer tecla para voltar ao MENU');
   readkey;
End;

var
	ag: text;
	resposta: boolean;
	palavra: string;
	op: integer;

Begin

	assign(ag, 'dados.txt' ) ;
	resposta:= false;

 repeat
		clrscr;
		writeln('Menu de opções');
		writeln;
		writeln('1 - Criar arquivo');
		writeln('2 - Cadastrar nova');
		writeln('3 - Exibir todas as palavras');
		writeln('4 - Procurar palavra');
		writeln('5 - Contar palavras cadastradas');
		writeln('6 - Sair');
		write('Digite sua opção: '); readln(op);
		case ( op ) of 
    1:  criar(ag);
    2:  cadastra(ag);
    3:  exibe(ag);
    4:	procura(ag);
    5:	contar(ag);
    6: resposta:= true;
  end;
 until ( resposta );
  
End.