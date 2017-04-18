Program Pzim ;

var
	arq: text;
	mensagem: string;
Begin

assign(arq, 'arquivo.txt');
writeln('Digite um text qualquer: ');
readln(mensagem);
append(arq);
writeln(arq, mensagem);
writeln('O texto digitado foi gravado com sucesso...');
close(arq);
  
End.