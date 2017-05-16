Program BemPagos;

type
	funcionario = record
	  nome: string[30];
	  cargo: string[50];
	  salario: real;
	  status: char;
	end;
	arquivo = file of funcionario;


Procedure criar(var arq:arquivo) ;
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
  	writeln('Arquivo já existe, continuando...');  
  	readkey;
  end;
End;


Function fileExist(arq: arquivo) : boolean ;
Begin

  {$I-}
  reset(arq);
  {$I+}
  
  if ( ioresult <> 0 ) then
  	fileExist:= True
  else
  	fileExist:= False;
  
End;

Function valid(funcio: funcionario) : boolean ;
Begin

	if ( funcio.status <> '*' ) then
   valid:= true
 else
   valid:= false;
   
End;

Procedure cadastra(var arq: arquivo);
var func: funcionario;
Begin
  if ( fileExist(arq) ) then begin
  	reset(arq);
    seek(arq, Filesize(arq));
    write('Digite o nome do funcionario: ');
    readln(func.nome);
    write('Digite o cargo do funcionario: ');
    readln(func.cargo);
    write('Digite o salario do funcionario: ');
    readln(func.salario:7:2);
    write(arq, func);
    close(arq);
    writeln('Dados salvos com sucesso...');
    writeln('Pressione qualquer tecla para voltar ao menu');
    readkey;
  end
  else
  begin
    write('Arquivo não existe!');
    readkey;
  end;
  close(arq);
End;

Procedure ler(var arq: arquivo);
var funcio: funcionario;
Begin
  if ( fileExist(arq) ) then 
	begin
  	reset(arq);
    while ( not eof(arq) ) do 
		begin
      read(arq, funcio);
      
      if ( ( valid(funcio) ) and (funcio.salario >= 950*20) ) then begin
      	writeln('-----------------------------------');
        writeln('Nome do funcionario: ', funcio.nome);
        writeln('Cargo: ', funcio.cargo);
        writeln('Salario: ', funcio.salario:7:2);
        writeln('-----------------------------------');
      end;
      
    end;
  end
  else
  begin
    writeln('Arquivo não existe!');
    readkey;
  end;
  close(arq);
  writeln('Pressione qualquer tecla para voltar ao menu');
  readkey;
End;

Procedure apagar(var arq: arquivo);
var
escolha, confirmacao: string;
funcio: funcionario;
find: boolean;
Begin
	find:= False;
  if ( fileExist(arq) ) then
  begin
    writeln('Digite o nome do funcionario que deseja apagar: ');
    readln(escolha); // Armazena a escolha do usuario
    reset(arq);
    while ( not eof(arq) ) do
    begin
      read(arq, funcio);
      if ( valid(funcio) and (escolha = funcio.nome) ) then
      begin
        writeln('Funcionario encontrado: ');
        writeln('Nome: ', funcio.nome);
        writeln('Cargo: ', funcio.cargo);
        writeln('Salario: ', funcio.salario:7:2);
        writeln('--------------------------');
        
        writeln('Deseja realmente apagar este funcionario? S/N');
        readln(confirmacao);
        
        while ( (confirmacao <> 'S') and (confirmacao <> 'N') ) do
        begin
          writeln('Digite uma opção válida!');
          writeln('Deseja realmente apagar este funcionario? S/N');
          readln(confirmacao);
        end;
        
        if ( confirmacao = 'S' ) then
        begin
          funcio.status:= '*';
          writeln('Funcionario excluido com sucesso!');
        end;
        
        seek(arq, Filepos(arq)-1);
        write(arq, funcio);
        
        seek(arq, Filesize(arq));
      end;
    end;
  end
  else
  begin
    writeln('Arquivo não existe!');
    writeln('Pressione qualquer tecla para continuar');
    readkey;
  end;
  close(arq);
  writeln('Pressione qualquer tecla para continuar');
  readkey;
End;

Procedure atualizarCadastro(var arq: arquivo) ;
var funcio: funcionario;
var escolha: string;
var find: boolean;
Begin
	find:= False;
  if ( fileExist(arq) ) then begin
  	write('Digite o numero funcionario que deseja atualizar: ');
  	readln(escolha);
  	reset(arq);
    while ( not eof(arq) ) do begin
      read(arq, funcio);
      if ( escolha = funcio.nome ) then begin
      	find:= True;
        writeln('Funcionario encontrado, digite os novos dados:');
        write('Digite o novo nome: '); readln(funcio.nome);
        write('Digite o novo salario: '); readln(funcio.salario);
        write('Digite o novo cargo: '); readln(funcio.cargo);
				
				seek(arq, Filepos(arq)-1);
				write(arq, funcio);
				
				writeln('Dados atualizados com sucesso!');   
				
				seek(arq, Filesize(arq));
      end;
    end;
    if ( not find ) then begin
      writeln('Nenhum funcionario encontrado com o nome de ', escolha);
    end;
  end
  else
  begin
  	writeln('Arquivo não existe!');
    writeln('Pressione qualquer tecla para continuar');
    readkey;  
  end;
  
  close(arq);
  writeln('Pressione qualquer tecla para continuar');
  readkey;
End;

Procedure lerTodos(var arq: arquivo) ;
var funcio: funcionario;
Begin
	if ( fileExist(arq) ) then 
	begin
  	reset(arq);
    while ( not eof(arq) ) do 
		begin
      read(arq, funcio);
      writeln('-----------------------------------');
      writeln('Nome do funcionario: ', funcio.nome);
      writeln('Cargo: ', funcio.cargo);
      writeln('Salario: ', funcio.salario:7:2);
      writeln('-----------------------------------');      
    end;
  end
  else
  begin
    writeln('Arquivo não existe!');
    readkey;
  end;
  close(arq);
  writeln('Pressione qualquer tecla para voltar ao menu');
  readkey;  
End;

Procedure find(var arq: arquivo) ;
var nome: string;
var finded: boolean;
var funcio: funcionario;
Begin
	finded:= false;
	write('Digite o nome do funcionario que deseja procurar: ');
	readln(nome);
	if ( fileExist(arq) ) then 
	begin
  	reset(arq);
    while ( not eof(arq) ) do 
		begin
      read(arq, funcio);
      if ( funcio.nome = nome ) then 
			begin
				finded:= true;
        writeln('-----------------------------------');
	      writeln('Nome do funcionario: ', funcio.nome);
  	    writeln('Cargo: ', funcio.cargo);
    	  writeln('Salario: ', funcio.salario:7:2);
      	writeln('-----------------------------------');
      end;
    end;
  end
  else
  begin
    writeln('Arquivo não existe!');
    readkey;
  end;
  close(arq);
  if ( not finded ) then begin
    write('Funcionario com o nome, ', nome, ' não encontrado');
  end;
  writeln('Pressione qualquer tecla para voltar ao menu');
  readkey;
End;

var arq: arquivo;
var active: boolean;
var op: integer;

Begin

active:= True;
assign(arq, 'funcionarios.dat');

repeat
		clrscr;
		writeln('Menu de opções');
		writeln;
		writeln('1 - Criar arquivo');
		writeln('2 - Cadastrar novo funcionario');
		writeln('3 - Listar funcionarios com maiores salarios');
		writeln('4 - Listar todos os funcionarios');
		writeln('5 - Excluir funcionario');
		writeln('6 - Atualizar dados do funcionario');
		writeln('7 - Encontrar funcionario por nome');
		writeln('8 - Sair');
		write('Digite sua opção: '); readln(op);
	case ( op ) of 
    1:  criar(arq);
    2:  cadastra(arq);
    3:  ler(arq);
    4:	lerTodos(arq);
    5:	apagar(arq);
    6:	atualizarCadastro(arq);
    7:	find(arq);
    8: 	active:= False;
  end;
 until ( not active );
  
End.