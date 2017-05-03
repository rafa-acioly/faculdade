Program BemPagos;

type
	funcionario = record
		nome: string[30];
		cargo: string[50];
		salario: real;
		status: char;
	end;

arquivo = file of funcionario;
	
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
		begin
    valid:= True;
  	end  
	else 
		begin
    	valid:= False;
  	end;
End;

Procedure cadastra(arq: arquivo);
var func: funcionario;
Begin
	if ( fileExist(arq) ) then begin
   	seek(arq, Filesize(arq));
		write('Digite o nome do funcionario: ');
	 	readln(func.nome);
 		write('Digite o cargo do funcionario: ');
 		readln(func.cargo);
 		write('Digite o salario do funcionario: ');
 		readln(func.salario);
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
End;

Procedure ler(arq: arquivo);
var funcio: funcionario;
Begin
	if ( fileExist(arq) ) then begin
   while ( not eof(arq) ) do begin
     read(arq, funcio);
     if ( (valid(funcio)) and (funcio.salario >= 800*20) ) then begin
       writeln('Nome do funcionario: ', funcio.nome);
	     writeln('Cargo: ', funcio.cargo);
  	   writeln('Salario: ', funcio.salario);
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

Procedure apagar(arq: arquivo);
var 
	escolha, confirmacao: string;
	funcio: funcionario;
Begin
  if ( fileExist(arq) ) then 
		begin
    	writeln('Digite o nome do funcionario que deseja apagar: ');
    	readln(escolha);
    	while ( not eof(arq) ) do 
				begin
        	read(arq, funcio);
        	if ( valid(funcio) and (escolha = funcio.nome) ) then 
						begin
            	writeln('Funcionario encontrado: ');
							writeln('Nome: ', funcio.nome);
							writeln('Cargo: ', funcio.cargo);
							writeln('Salario: ', funcio.salario);
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
              	funcio.status:= '*'
		          end;
		          
		          write(arq, funcio);
		          seek(arq, Filesize(arq));
         		end;
         		
         	writeln('Pressiona qualquer tecla para voltar ao menu');
     		end;
  	end  
	else 
		begin
    //comandos
  	end;
End;

Begin
  
End.