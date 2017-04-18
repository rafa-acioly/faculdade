Program Pzim ;

var
	arq: text;
Begin

assign(arq, 'arquivo.txt');
rewrite(arq);
writeln('Arquivo exemplo foi criado...');
close(arq);
  
End.