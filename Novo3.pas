Program Pzim ;
var
	arq: text;
	vari: string;
Begin
	 assign(arq, 'arquivo.txt');
	
   while ( not eof( arq ) )  do
	 begin                   
			readln(arq, vari);
			writeln(vari);
   end;
End.