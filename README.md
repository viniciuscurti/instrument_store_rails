# InstrumentStore

Este projeto é um simples CRUD de uma loja de instrumentos musicais em Rails.
A feature que precisamos implementar é adicionar uma **verificação na hora de criar instrumentos.**

Ao criar um instrumento, precisamos fazer uma chamada a um web service externo para checar se o instrumento é roubado. Caso seja identificado como roubado através da resposta do web service, precisamos indicar o mesmo no index de instrumentos e no show do instrumento em questão.

Abaixo, um exemplo de uma chamada ao web service:

```bash
curl --header "X-ACCESS-TOKEN: cTdYDb6gKOAa6jXoAgJzhYz9BYDpEKsKZdsv+i" \
"https://calm-beach-16451.herokuapp.com/search?model=Jackson&year=2020"
```

Note que enviamos o model e o year como parâmetros para o path /search, e passamos um token de autenticação através do header X-ACCESS-TOKEN.

Note que as vezes a resposta pode demorar a ser recebida. Que chato, né ?
Tente usar sua criatividade para evitar que isso impacte a usabilidade.

Instruções:

1. Ao concluir a feature, criar um Merge Request para este repositório.
2. Case necessário, atualizar o README com instruções para rodar a aplicação no ambiente local.
3. Não é necessário preocupar-se com deployment.
4. A escrita de testes é **altamente** recomendada.
5. Divirta-se!


Para rodar o ambiente com a nova migracao!

``````bash
rails db:migrate
``````
Criar um novo instrumento que irá realizar a consulta automaticamente e aparecer no campo stolen:

True para que é um instrumento roubado.
False pra que nao é um instrumento roubado.


Para rodar os testes de sistema e unitários:

`````bash
rails test:system #para testar o sistema
rails test:models #para testar o modelo
`````
