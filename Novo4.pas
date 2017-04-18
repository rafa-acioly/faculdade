Program Pzim ;

var
	arq: text;
	vari: string;

Begin

assign(arq, 'arquivo.txt' ) ;

// Desativa a exibição de erro
{$I-}

// Coloca o ponteiro na primeira linha do arquivo
reset(arq);

// Reativa a exibição de erro
{$I+}


if ( ioresult = 0 ) then begin
	writeln('Arquivo aberto com sucesso!');	
end
else begin
	writeln('Arquivo não encontrado!, criando novo...');
	rewrite( arq );
end;

close(arq);
  
End.