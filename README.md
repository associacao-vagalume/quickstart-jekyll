# Quickstart Jekyll

Vamos usar esse projeto para testar o fluxo de criação de páginas
utilizando o Jekyll.

## Dependências

Para facilidade de instalação, criamos script `jekyll` que utiliza docker para
executar a ferramenta.

Para utilizá-lo, é necessário instalar o [Docker][docker-store].

Veja documentação do [Jekyll][jekyll-quickstart] para mais informações sobre o
que a ferramenta faz.

## Como executar

Entre no diretório `site` e execute o comando abaixo:

    docker-compose -f ../docker-compose.yml up -d site

Esse comando deve iniciar o servidor do jekyll.

Para parar o site, execute o comando abaixo:

    docker-compose -f ../docker-compose.yml down

[docker-store]: https://store.docker.com/search?offering=community&type=edition
[jekyll-quickstart]: https://jekyllrb.com/docs/quickstart/
