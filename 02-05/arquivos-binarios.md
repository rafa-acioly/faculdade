### Arquivos bin�rios

Tipo de arquivo que permite armazenar uma estrutura de dados e recuper�-lo na mesma forma 

e tipos de dados que foi gravado.
Permite o acesso direto aos registros.


| C�digo  |    Produto   | Valor |
|----------|:-------------:|------:|
| 001       |  caneta        | 2.58  |
| 002       |  lapis           | 0.90  |
| 003       |  regua         | 3.50  |


### No Pascal

- Declarar uma variavel do tipo arquivo

```
var
  arq: file of <type>; // real, integer, string e etc
```

- Associar a variavel do tipo arquivo ao nome do arquivo no disco.

```
assign(arq, <nome_do_arquivo>.dat); // extens�o .dat
```

- Abrir o arquivo

```
rewrite(arq);
reset(arq);
// append() n�o � usado em arquivos bin�rios
```

- Gravas/Armazenar dados no arquivo

```
write(arq, <variavel_ou_string>);
// writeln() n�o � usado em arquivos bin�rios
```

- Ler/Recuperar dados do arquivo

```
read(arq, <variavel_que_armazena_o_retorno>);
// readln() n�o � usado em arquivos bin�rios
```

- Fechar o arquivo

```
close(arq);
```


### Fun��es especificas para uso em arquivos bin�rios

- Recupera a posi��o atual do ponteiro de leitura/grava��o

```
x:= Filepos(arq); // retorna um numero inteiro
```

- Retorna a quantidade de registros do arquivo

```
x:= Filesize(arq); // retorna um numero inteiro
```

- Posiciona o ponteiro de leitura/grava��o em uma linha espec�fica

```
seek(arq, <posicao>);
// Exemplo: seek(arq, 3);
```

- Posicionar o ponteiro de leitura/grava��o no final do arquivo

```
seek(arq, Filesize(arq));
```

- Voltar o ponteiro de leitura/grava��o para o registro anterior

```
seek(arq, Filepos(arq) - 1);
```