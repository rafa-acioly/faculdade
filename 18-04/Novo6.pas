Program Pzim ;

Function check(var arq: text) : boolean ;
Begin
	{$I+}
	reset(arq);
	{$I+}
	
	if ( ioresult <> 0 ) then begin
   check:= true;
 end
	else
	 begin
   check:= false;
 end;
End;

Procedure criar(var arq: text) ;
Begin
	
	if ( not check(arq) ) then begin
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


Procedure contar(var arq: text) ;
var
	cont: integer;
	s: string;
Begin
	cont:= 0;
	
	if ( not check(arq) ) then begin
   writeln('Primeiro crie um arquivo, antes de usar esta opção');
 end 
 else 
 	begin
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
	
 if ( not check(arq) ) then begin
   writeln('Crie um arquivo primeiro antes de usar esta opção!');
   readkey;
 end 
 else 
 	begin
   while (not eof(arq)) do
  	Begin
  	  readln(arq, s);
  	  writeln(s);
  	End;
  close( arq );
  writeln('Pressione qualquer tecla para voltar ao MENU');
  readkey;
 end;
End;

Procedure procura(var arq: text) ;
var s, palavra: string;
var res: boolean;
Begin
	res:= false;
	
	write('Digite a palavra que deseja buscar: '); readln(palavra); // palavra do usuario
	
	if ( not check(arq) ) then begin
  	writeln('Antes de usar esta opção, crie um novo arquivo!'); 
 	end 
 else 
 	begin
   while ( not eof(arq) ) do
   Begin
  	readln(arq, s); // a palavra do arquivo
    if ( s = palavra ) then begin
      res:= true;
    end;
   End;
   if ( res ) then begin
     writeln('--- Palavra encontrada: ', s);
   end   else begin
     writeln('--- Palavra não encontrada!!');
   end;
 end;

   close(arq);
   writeln('Pressione qualquer tecla para voltar ao MENU');
   readkey;
End;

Procedure copiar(var arq: text) ;
var novoarquivo: text;
var cp: string;
var cont: integer;
Begin
	cont:= 1;
	
	if ( not check(arq) ) then begin
   writeln('Antes de usar esta opção, criei um arquivo!');
 end 
 else 
 	begin
   // CRIO A COPIA DO ARQUIVO
		assign(novoarquivo, 'copia.txt');
		criar(novoarquivo);
		append(novoarquivo);
		
		while ( not eof(arq) ) do begin
		  // LEIO A LINHA DO ARQUIVO ORIGINAL
    	readln(arq, cp);
    	
    	// ESCREVO NO NOVO ARQUIVO
    	writeln(novoarquivo, cont, ' - ', cp);
    	cont:= cont + 1;
	  end;
	  writeln('Copia do arquivo gerada com sucesso!');
		readkey; 	
 		close(arq);
 		close(novoarquivo);
 end;
	
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
		writeln('6 - Realizar backup');
		writeln('7 - Sair');
		write('Digite sua opção: '); readln(op);
		case ( op ) of 
    1:  criar(ag);
    2:  cadastra(ag);
    3:  exibe(ag);
    4:	procura(ag);
    5:	contar(ag);
    6:	copiar(ag);
    7: resposta:= true;
  end;
 until ( resposta );
  
End.