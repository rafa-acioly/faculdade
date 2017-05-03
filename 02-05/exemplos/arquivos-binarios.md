### Arquivos binários

Tipo de arquivo que permite armazenar uma estrutura de dados e recuperá-lo na mesma forma 

e tipos de dados que foi gravado.
Permite o acesso direto aos registros.


| Código  |    Produto   | Valor |
|----------|:-------------:|------:|
| 001       |  caneta        | 2.58  |
| 002       |  lapis           | 0.90  |
| 003       |  regua         | 3.50  |


### No Pascal

- Declarar uma variavel do tipo arquivo

```pas
var
  arq: file of <type>; // real, integer, string e etc
```

- Associar a variavel do tipo arquivo ao nome do arquivo no disco.

```pas
assign(arq, <nome_do_arquivo>.dat); // extensão .dat
```

- Abrir o arquivo

```pas
rewrite(arq);
reset(arq);
// append() não é usado em arquivos binários
```

- Gravas/Armazenar dados no arquivo

```pas
write(arq, <variavel_ou_string>);
// writeln() não é usado em arquivos binários
```

- Ler/Recuperar dados do arquivo

```pas
read(arq, <variavel_que_armazena_o_retorno>);
// readln() não é usado em arquivos binários
```

- Fechar o arquivo

```pas
close(arq);
```


### Funções especificas para uso em arquivos binários

- Recupera a posição atual do ponteiro de leitura/gravação

```pas
x:= Filepos(arq); // retorna um numero inteiro
```

- Retorna a quantidade de registros do arquivo

```pas
x:= Filesize(arq); // retorna um numero inteiro
```

- Posiciona o ponteiro de leitura/gravação em uma linha específica

```pas
seek(arq, <posicao>);
// Exemplo: seek(arq, 3);
```

- Posicionar o ponteiro de leitura/gravação no final do arquivo

```pas
seek(arq, Filesize(arq));
```

- Voltar o ponteiro de leitura/gravação para o registro anterior

```pas
seek(arq, Filepos(arq) - 1);
```
