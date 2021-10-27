# University API

Esse repositório contém o código-fonte do desafio desenvolvido da discplina Resolução de Problemas da UNICAMP.

A estruturação do repositório está dividida da seguinte maneira:
- A pasta `api` contém todo código em [Elixir](https://elixir-lang.org/);
- Os arquivos `.dockerignore`, `docker-compose.yml`, `Dockerfile` e `entrypoint.sh` estão relacionados a conteinerização da aplicação;

## Como executar a aplicação

Antes de executar a aplicação, você precisará ter instalado o [docker-compose](https://docs.docker.com/compose/). Siga a documentação desse link para efetuar sua instalação.

Agora, com o docker-compose instalado você pode simplesmente rodar em seu terminal a diretiva `make`:
```console
make up
```

Caso você não tenha o `make` instalado, pode utilizar diretamente a linha de comando do `docker-compose`:
```console
docker-compose up
```

Quando os dois conteineres estiverem rodando, a API pode ser acessada através do endpoint `localhost:4000/api/universities`.

Esse endpoint aceita todos os métodos HTTP de CRUD. Para exemplicar os contratos da API, abaixo temos uma resposta de uma listagem através de uma requisição `GET`:

![image](https://i.imgur.com/TIKZfjH.png)

Abaixo está um exemplo de criação de uma universidade. Na imagem abaixo está o `body` da requisição:

![image](https://i.imgur.com/l3nUxVi.png)

E agora a resposta da API para a requisição `POST`:

![image](https://i.imgur.com/qORHO0C.png)

Verifique que na nova requisição `GET` de listagem a última universidade criada também está contida na resposta:

![image](https://i.imgur.com/df1V6uV.png)

Para exemplificar a atualização de um valor de uma universidade, abaixo está a atualização do número de alunos da universidade com o ID 2. Primeiramente, o `body` tem o seguinte conteúdo:

![image](https://i.imgur.com/OjudqRU.png)
> Note que a especificação de qual universidade deve ser atualizada está contida no próprio endpoint da API. Nesse caso, estamos adicionando o ID 2 no final do endpoint.

E essa foi a resposta da requisição de atualização:

![image](https://i.imgur.com/rrMt5Pk.png)

Com uma nova requisição de listagem para a verificação da atualização do campo, verifique a imagem abaixo.

![image](https://i.imgur.com/Tiw1c14.png)

O último exemplo de método de CRUD é o `DELETE`. Para isso, iremos deletar a mesma universidade que fizemos a atualização, que é identificada pelo ID 2.

Uma requisição de deleção não contém `body`, a especificação de qual universidade deve ser deletada está no próprio endpoint. Por isso, a requisição foi feita para `localhost:4000/api/universities/2` e a resposta foi:

![image](https://i.imgur.com/dsNfcmo.png)

Com essa universidade deletada, a resposta final da listagem contém apenas 2 universidades:

![image](https://i.imgur.com/WRFr12q.png)
