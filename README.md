# Programa de Recuperação dos Registros Históricos da Família Real de Cumbúquia
Este projeto é um programa CLI (Interface de Linha de Comando) em Elixir que auxilia na reconstrução da lista histórica dos monarcas da Família Real de Cumbúquia. O programa permite que os usuários insiram os nomes dos monarcas e os numera de forma correta utilizando algarismos romanos.

## Funcionalidades
- Recepção amigável ao usuário com instruções claras.
- Coleta interativa dos nomes dos monarcas.
- Contagem e numeração dos monarcas utilizando algarismos romanos.
- Exibição da lista final com os nomes e suas respectivas numerações.

## Como usar
### Compilar o programa:
- Certifique-se de ter Elixir instalado em seu sistema.
- Compile o programa com o comando elixirc desafio_cli.ex.
### Executar o programa:
- Inicie a aplicação com o comando elixir -e "DesafioCli.main([])".
- Inserir os nomes:
        Siga as instruções na tela para inserir os nomes dos monarcas.
        Pressione ENTER em uma linha vazia para finalizar a inserção dos nomes e ver a lista completa com as numerações.

# Estrutura do Código
## Módulo DesafioCli
### Funções Públicas
- main/1: Ponto de entrada do programa. Recebe os argumentos da linha de comando e inicia a execução.
- welcome_text/0: Exibe a mensagem de boas-vindas e as instruções para o usuário.
- start_program/0: Inicia o processo de coleta dos nomes dos monarcas.
- collect_names/1: Coleta os nomes dos monarcas inseridos pelo usuário.
### Funções Privadas
- count_names/1: Conta as ocorrências de cada nome e cria a lista final com os nomes numerados.
- reverse/1: Reverte a lista utilizando uma função auxiliar recursiva.
- reverse_aux/2: Função auxiliar recursiva para reverter a lista.
- show_list/1: Exibe a lista final de nomes numerados.
- arabic_to_roman/1 e arabic_to_roman/2: Converte números arábicos para algarismos romanos.

# Exemplo de Uso

```
$ elixir -e "DesafioCli.main([])" $
```


## Interação do Usuário
```
Bem-vindo ao Programa de Recuperação dos Registros Históricos da Família Real de Cumbúquia!

O reino de Cumbúquia perdeu seus registros históricos e com isso a numeração correta dos reis e rainhas foi esquecida.
Para resolver esse problema e restaurar a ordem cronológica da realeza, desenvolvemos este programa especial.
Este programa permitirá que você insira os nomes dos monarcas, e a partir daí, reconstruiremos a lista histórica da família real.

INSTRUÇÕES:
Você deve inserir um nome por linha e, quando não quiser mais inserir nenhum nome, basta pressionar ENTER que o programa será encerrado.

Vamos?

==========================================

Digite os nomes dos reis e rainhas (pressione Enter caso queira encerrar): 
> João
> Maria
> João
> 
Lista de nomes: 
JOÃO I
MARIA I
JOÃO II
```

# Tecnologias Utilizadas
- Elixir: Linguagem de programação funcional, concorrente e de propósito geral que roda na máquina virtual Erlang (BEAM).

# Desafios enfrentados e reflexões
Durante o desenvolvimento deste projeto tive algumas dificuldades significativas, algumas que consegui solucionar e outras que ainda estão pendentes.

## Desafios encontrados
### 1. A linguagem em si
- **Desafio**: Como nunca tinha entrado em contato anteriormente com Elixir, tive uma grande dificuldade inicial para compreender como deveria ser a estruturação do código e a própria sintaxe.
- **Solução**: estudei a documentação oficial da linguagem e busquei vídeos, principalmente da Alura, quando não entendia a documentação.

### 2. Contagem dos nomes
- **Desafio**: Estruturar o código para contar os nomes foi difícil inicialmente porque, por eu estar acostumada com Java, tive dificuldade de pensar em outras saídas que não envolvessem um *for*, por exemplo. Demorei um pouco até entender como isso poderia ser aplicado em Elixir e principalmente como a linguagem funciona nesse sentido.
- **Solução**: Escolhi usar a função Enum.reduce como uma forma de percorrer toda a lista que havia sido criada com as entradas de nomes feitas pelo usuário e "reduz" cada um dos elementos a um só valor, o que possibilitou realizar a contagem de cada um dos nomes coletados.

### 3. Transformação de algarismos arábicos em romanos
- **Dificuldade**: Aqui a dificuldade foi não só com relação à sintaxe, mas também com relação à lógica.
- **Solução**: Decidi criar funções separadas para abranger a maior parte dos casos possíveis, contando os algarismos romanos de 1 até mil. Após a compreensão da lógica, a implementação da sintaxe foi relativamente fácil.

## Reflexões
### 1. Melhor organização do código
- Por não estar familiarizada com a linguagem, gastei muito tempo entendendo a sintaxe e por isso preferi escrever o código de uma maneira que funcionasse para só depois trabalhar em melhorá-lo.
- Um dos pontos que quero melhorar e que já vejo que precisa de ajustes é a organização das funções em si e como montei as chamadas dentro do *main*: posso estar errada, mas acredito que chamar funções dentro de funções pode gerar problemas futuros para o código, então quero entender como separar melhor cada parte do código de maneira que a independência das funções esteja garantida.

### 2. Testes
- Pelo mesmo motivo anterior, por ter passado um bom tempo compreendendo a sintaxe e a lógica da linguagem, não tive tempo de completar os testes. Acredito que parte da minha dificuldade foi por ainda não ter compreendido tão bem o funcionamento da linguagem, então sei que é um ponto a ser desenvolvido.

