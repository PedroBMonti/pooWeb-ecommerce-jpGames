

## Autor

**João Pedro Bohrer Monti**

Curso: Sistemas para Internet
Disciplina: POO Web 1
Universidade Federal de Santa Maria - UFSM

---
# JpGames

Projeto desenvolvido para a disciplina de **POO Web 1**.

O **JpGames** é uma loja virtual de jogos digitais. O sistema permite que usuários visualizem jogos, filtrem por categoria, vejam detalhes dos produtos, adicionem jogos ao carrinho, finalizem compras e acessem sua biblioteca de jogos comprados.

Também existe uma área administrativa, onde o administrador pode gerenciar jogos e categorias.

---

## Links da entrega

### Repositório GitHub

https://github.com/PedroBMonti/pooWeb-ecommerce-jpGames

### Vídeo de apresentação

https://drive.google.com/file/d/1XthtAtGPhXi59DjdC5j2IK3tFmu9ZsYC/view?usp=sharing

---

## Tecnologias utilizadas

* Java
* Spring MVC
* Maven
* JSP
* JDBC
* PostgreSQL
* HTML
* CSS
* WildFly

---

## Funcionalidades do sistema

### Área do cliente

* Visualização dos jogos disponíveis
* Filtro de jogos por categoria
* Tela de detalhes do jogo
* Cadastro de usuário
* Login e logout
* Carrinho de compras
* Finalização de compra
* Biblioteca de jogos comprados
* Alteração de avatar do usuário

### Área administrativa

* Cadastro de jogos
* Edição de jogos
* Exclusão de jogos
* Cadastro de categorias
* Edição de categorias
* Exclusão de categorias

---

## Estrutura do projeto

O projeto segue o padrão **MVC**, separando as responsabilidades em camadas.

```text
src/main/java
├── controller
├── dao
├── model
├── service
└── util
```

### Model

Contém as classes principais do sistema, como:

* `Jogo`
* `Categoria`
* `Usuario`

### DAO

Contém as classes responsáveis pelo acesso ao banco de dados, como:

* `JogoDAO`
* `CategoriaDAO`
* `UsuarioDAO`
* `BibliotecaDAO`

### Service

Contém classes responsáveis por centralizar regras de negócio do sistema.

Foram criadas as classes:

* `CarrinhoService`
* `UsuarioService`

O `CarrinhoService` centraliza regras como:

* adicionar jogo ao carrinho;
* remover jogo do carrinho;
* calcular o total da compra;
* verificar se o usuário está logado;
* verificar se o carrinho está vazio;
* finalizar a compra;
* impedir compra duplicada;
* adicionar jogos comprados na biblioteca do usuário.

O `UsuarioService` centraliza a regra de cadastro público de usuários, definindo novos usuários com perfil `cliente`.

### Controller

Contém os controllers do Spring MVC, responsáveis por receber as requisições e direcionar o fluxo do sistema.

Exemplos:

* `JogoController`
* `CategoriaController`
* `LoginController`
* `CarrinhoController`
* `UsuarioController`

### Views

As telas do sistema foram feitas com **JSP**, utilizando HTML e CSS.

---

## Fluxo da aplicação

O fluxo principal da aplicação segue a estrutura:

```text
JSP/View → Controller → Service → DAO → Banco de Dados
```

Os controllers recebem as requisições e chamam os services.
Os services concentram as regras de negócio e utilizam os DAOs para acessar o banco de dados.

---

## Banco de dados

O banco de dados utilizado é o **PostgreSQL**.

As principais tabelas do sistema são:

* `usuario`
* `categoria`
* `jogo`
* `biblioteca`

### Relações principais

* Uma categoria pode possuir vários jogos.
* Um usuário pode possuir vários jogos em sua biblioteca.
* A tabela `biblioteca` relaciona usuários e jogos comprados.

O backup atualizado do banco de dados está disponível no arquivo:

```text
backup_jpgames.sql
```

---

## Validações e regras implementadas

O sistema possui validações básicas nos formulários, como:

* Campos obrigatórios
* Validação de e-mail
* Tamanho mínimo de senha
* Limite de caracteres em campos de texto

Também foi implementada uma regra para evitar compra duplicada. Antes de finalizar uma compra, o sistema verifica se o jogo já está na biblioteca do usuário. Caso já esteja, a compra não é finalizada novamente.

Essa regra fica centralizada no `CarrinhoService`.

---

## Segurança e sessão

O sistema possui controle de sessão para usuários logados.

Funcionalidades como finalizar compra e acessar a conta dependem de login.

A área administrativa possui verificação de perfil, permitindo acesso apenas ao usuário administrador.

As operações com banco de dados utilizam `PreparedStatement`, ajudando a evitar SQL Injection básico.

---

## Como executar o projeto

### 1. Clonar o repositório

```bash
git clone https://github.com/PedroBMonti/pooWeb-ecommerce-jpGames.git
```

### 2. Importar o banco de dados

Crie um banco no PostgreSQL com o nome:

```text
jpgames
```

Depois importe o arquivo SQL disponibilizado no projeto:

```text
backup_jpgames.sql
```

### 3. Configurar a conexão com o banco

Verifique a classe de conexão do projeto e ajuste usuário e senha conforme o seu PostgreSQL local.

Exemplo de configuração esperada:

```text
Banco: jpgames
Porta: 5432
Usuário: postgres
Senha: sua_senha
```

### 4. Rodar o projeto

O projeto foi desenvolvido para rodar em servidor Java Web, como o **WildFly**.

Após configurar o servidor, faça o deploy da aplicação e acesse pelo navegador:

```text
http://localhost:8080/jpGames
```

---

## Usuários de teste

### Administrador

```text
Email: admin@jpgames.com
Senha: 1234
```

### Cliente 1

```text
Email: pedro.teste@gmail.com
Senha: 1234
```

### Cliente 2

```text
Email: ale.machado@ufsm.com
Senha: 12345
```

### Cliente 3

```text
Email: duda.teste@ufsm.com
Senha: du1234
```

---

## Demonstração do sistema

O vídeo de apresentação do sistema está disponível no link abaixo:

https://drive.google.com/file/d/1XthtAtGPhXi59DjdC5j2IK3tFmu9ZsYC/view?usp=sharing
