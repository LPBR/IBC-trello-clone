# IBC-Teste
Teste IBC, uma lista de tarefas com funcionalidades semelhantes ao Trello. Funcionalidades para criação de quadros, etapas e tarefas. As etapas e tarefas podem ser reordenadas ao arrastar e soltar.

## O teste:

Criar uma app de TODO LIST simples (trello). Deverá ser entregue rodando na AWS (Free Tier) juntamente com todo o código no Github.

#### Características :
  - Boards ilimitados
  - Tasks ilimitadas
  - Etapas (Steps) ilimitadas
 
#### Tecnologias Obrigatorias:
  - Ruby On Rails
  - Bootstrap
  - rspec, faker, factory_bot_rails
  - RDS Aurora
  - Elastic Beanstalk
  
## Instruções
  As intruções a seguir orientam como configurar e executar esta aplicação em seu próprio ambiente para teste. Para mais instruções sobre como publicar o APP leia a seção Deployment.
 
#### Pré-requisitos

* Ruby 2.6.5
* Bundler
* sqlite3
* mysql2

#### Instalando

Clone o repositório para seu ambiente
```
$ git clone https://github.com/LPBR/ibc-teste.git
```

Acesse o diretório ibc-teste e execute o bundler para instalar as dependências do projeto
```
$ cd ibc-teste
$ bundle install
```

Agora basta inciar o servidor de desenvolvimento e acessar através do navegador.
O endereço padrão definido é: http://localhost:3000
```
$ rails s
```

#### Executando os testes
  Testes foram escritos para os models, controllers e rotas. Com o comando abaixo é possível executálas.
```
$ rails spec
```

#### Deployment
  Para correta execução em um ambiente de produção as seguintes variáveis de ambiente devem ser definidas:
  > < substituir > - O conteúdo entre < > deve ser substituído de acordo com seu ambiente.
  *  RAILS_ENV=production
  *  RACK_ENV=production
  *  SECRE_KEY_BASE = < chave gerada pelo comando rails secret >
  *  RDS_DB_NAME = < nome da base de dados mysql >
  *  RDS_HOSTNAME = < endereço do host de banco de dados >
  *  RDS_USERNAME = < usuário do banco de dados >
  *  RDS_PASSWORD = < senha do banco de dados >
  *  RDS_PORT = < porta do banco de dados >
