Program Pzim ;

var
	arq: text;
	vari: string;

Begin

assign(arq, 'arquivo.txt' ) ;

// Desativa a exibi��o de erro
{$I-}

// Coloca o ponteiro na primeira linha do arquivo
reset(arq);

// Reativa a exibi��o de erro
{$I+}


if ( ioresult = 0 ) then begin
	writeln('Arquivo aberto com sucesso!');	
end
else begin
	writeln('Arquivo n�o encontrado!, criando novo...');
	rewrite( arq );
end;

close(arq);
  
End.