Program Pzim ;

var
	a: text; // Defina a variavel "a" como tipo arquivo

Begin
   assign(a, 'exemplo.txt'); // Atribui o arquivo a uma variavel
   reset(a); // Coloca o ponteiro na primeira linha
   append(a); // COloca o ponteiro na ultima linha
   
   writeln(a, 'texto para gravar ou variavel'); // Escreve no arquivo
   readln(a, variavel_que_armazenara_a_leitura); // Lê a linha do arquivo
   
   close(a); // Fecha o arquivo
   
   while not eof(a) do
   	Begin
   		readln(a, variavel_string);
   		writeln(variavel_string);
   	End;
   	
   	// Diretivas de compilação
   	{$I-}
   	   reset(a); // Oculta os erros gerador por este trecho e armazena o código do erro em "ioresult"
   	{$I+}
   	
   	writeln(ioresult); // Exibe o codigo do erro ou 0 se não houve erro
   	
   	if ioresult <> 0 then
   		Begin
   			writeln('Arquivo não encontrado! criando novo...');
   			rewrite(a);
   		End;
   		
   		writeln('Arquivo aberto com sucesso!');s
End.