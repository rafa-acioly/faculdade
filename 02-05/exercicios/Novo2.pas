Program Pzim ;

type
produto = record
  codigo: string;
  descricao: string;
  preco: real;
end;
arquivo = file of produto;

Function arquivoExiste(arq: arquivo) : boolean ;
Begin
  
  {$I-}
  reset(arq);
  {$I+}
  
  if ( ioresult <> 0 ) then
  fileExist:= True
  else
  fileExist:= False;
  
End;

Function buscar(var arq: arquivo; codigo) : integer ;
var prod: produto;
var encontrado: integer;
Begin
  encontrado:= -1;
  reset(arq);
  
  while ( not eof(arq) ) do begin
    read(arq, prod);
    if ( prod.codigo = codigo ) then begin
      encontrado:= Filepos(arq) - 1;
    end;
  end;
  
  buscar:= encontrado;
End;

Procedure criar(var arq: arquivo) ;
Begin
  {$I-}
  reset(arq);
  {$I+}
  
  if ( ioresult <> 0 ) then begin
    write('Arquivo não existe! criando...');
    rewrite(arq);
    readkey;
  end
  else
  begin
    writeln('Arquivo já existe, você deseja mante-lo ou apagalo? (M - manter / A - apagar)');
    readln(opcao);
    while ( (opcao <> 'M') and (opcao <> 'A') ) do begin
      write('Opcao não é valida, digite novamente (M - manter, A - apagar)');
      readln(opcao);
    end;
    if ( opcao = 'A' ) then begin
      rewrite(arq);
      write('Pronto, arquivo apagado e criado novamente!');
    end;
    readkey;
  end;
End;

Procedure cadastra(var arq: arquivo) ;
var prod: produto;
Begin
  if ( arquivoExiste(arq) ) then begin
    reset(arq);
    seek(arq, Filesize(arq));
    write('Digite o nome do código: ') readln(prod.codigo);
    write('Digite a descricao do produto: '); readln(prod.descricao);
    write('Digite o preço do produto: '); readln(prod.preco);
    write(arq, prod);
    writeln('Dados salvos com sucesso!');
    writeln('Pressione qualquer tecla para continuar');
    readkey;
  end
  else begin
    write('Arquivo não existe!');
    readkey;
  end;
  close(arq);
End;

Procedure listar(var arq: arquivo) ;
var prod: produto;
Begin
  if ( arquivoExiste(arq) ) then begin
    reset(arq);
    seek(arq, Filesize(arq));
    while ( not eof(arq) ) do begin
      read(arq, prod);
      writeln('-----------------------------------');
      writeln('Código do produto: ', prod.codigo);
      writeln('Descrição do produto: ', prod.descricao);
      writeln('Preço do produto: ', prod.preco);
      writeln('-----------------------------------');
    end;
  end
  else begin
    writeln('O arquivo não existe!');
    readkey;
  end;
  writeln('Pressione qualquer tecla para continuar');
  readkey;
End;

Procedure procurar(var arq: arquivo) ;
var prod: produto;
var codigo, encontrado: integer;
Begin
	writeln('Digite o código: '); readln(codigo);  
	encontrado:= buscar(arq, codigo);
	
 if ( arquivoExiste(arq) and encontrado ) then begin
 		reset(arq);
		prod:= seek(arq, encontrado);
		writeln('-- Arquivo encontrado --');
		writeln('Código: ', prod.codigo);
		writeln('Descrição: ', prod.descricao);
		writeln('Preço: ', prod.preco);
 end 
 else begin
   writeln('Código não encontrado!');
   readkey;
 end;
 writeln('Pressione qualquer tecla para continuar');
End;

Procedure alterar(var arq: arquivo) ;
var prod, procura: produto;
var codigo: string;
Begin
  if ( arquivoExiste(arq) ) then begin
    write('Digite o codigo do produto que deseja alterar: ');
    readln(codigo);
    procura:= buscar(arq, codigo);
    if ( procura ) then begin
      reset(arq);
     	prod:= seek(arq, procura);
			writeln('----------------------------'); 
     	writeln('Codigo: ', prod.codigo);
     	writeln('Descrição: ', prod.descricao);
     	writeln('Preço: ', prod.preco);
     	writeln('----------------------------');
     	write('Digite o novo código: '); readln(prod.codigo);
     	write('Digite a nova descrição: '); readln(prod.descricao);
     	write('Digite o novo preço: '); readln(prod.preco);
     	
     	seek(arq, procura);
     	write(arq, prod);
     	writeln('Dados atualizados com sucesso!');   
			seek(arq, Filesize(arq));
    end
    else begin
      writeln('O código não foi encontrado!');
      readkey;
    end;
  end
  else begin
    writeln('Arquivo não existe!');
    readkey;
  end;
  write('Pressione qualquer tecla para continuar');
End;

Procedure excluir(var arq: arquivo) ;
var codigo, encontrado: integer;
var prod: produto;
Begin
  write('Digite o código do produto: '); readln(codigo);
  encontrado:= buscar(arq, codigo);
  if ( arquivoExiste(arq) ) then begin
  	encontrado:= buscar(arq, codigo);
    if ( encontrado ) then
    	prod:= seek(arq, encontrado);
	    writeln('-- Produto encontrado! --');
  	  writeln('Código: ', prod.codigo);
    	writeln('Descrição: ', prod.descricao);
	    writeln('Preço: ', prod.preco);
    else
      writeln('Código não encontrado!');
  end  
	else begin
    writeln('Arquivo não existe!');
    readkey;
  end;
End;



Begin
  
  repeat
    clrscr;
    writeln('Menu de opções');
    writeln;
    writeln('1 - Criar arquivo');
    writeln('2 - Inserir');
    writeln('3 - Consultar por código');
    writeln('4 - Listagem');
    writeln('5 - Alterar por código');
    writeln('6 - Excluir por código');
    writeln('7 - Sair');
    write('Digite sua opção: '); readln(op);
    case ( op ) of
      1:  criar(arq);
      2:  cadastra(arq);
      3:  ler(arq);
      4:	lerTodos(arq);
      5:	apagar(arq);
      6:	atualizarCadastro(arq);
      7: 	active:= False;
    end;
  until ( not active );
  
End.