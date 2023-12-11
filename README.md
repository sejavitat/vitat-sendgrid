# Vitat::Sendgrid

A gem facilita o envio de emails com template via Sendgrid.


## Instalação

Instale no seu projeto Rails adicionando uma dessas linhas no Gemfile:

Puxado direto da main:

```
gem 'vitat-sendgrid', git: 'https://github.com/sejavitat/vitat-sendgrid-ruby', branch: 'main'
```

Apontando para uma tag de versão:<br>
**Recomendado**

```
gem 'vitat-sendgrid', git: 'https://github.com/sejavitat/vitat-sendgrid-ruby', tag: 'v1.0.0'
```


## Uso

1. Adicione um initializer com a configuração:

```
Vitat::Sendgrid.configure do |config|
  config.api_key = ENV['SENDGRID_API_KEY']
  config.from_mail = 'seu-email-aqui@mail.com'
  config.from_name = 'Nome de quem está enviando'
end
```

3. Envie emails seguindo o exemplo abaixo:

```
sendgrid_client = Vitat::Sendgrid::Client.new

sendgrid_client.send_template_email(
  'user@gmail.com', # Quem vai receber o email
  'd-93531b6be4874ee1b59a4a9eda41580b', # ID do template do email
  {
    data: {
      name: 'Julia',
    }, # Parâmetros opcionais do template, pode ser nulo
    categories: ['DEV'] # Categorias opcionais, pode ser nulo
  }
)
```


## Desenvolvimento

Faça o build e instale localmente:

    $ bundle build vitat-sendgrid.gemspec
    $ gem install vitat-sendgrid-<version>.gem

Acesse o console interativo de Ruby:

    $ bundle exec irb

    require 'vitat/sendgrid'


## Contribuindo

Contribuições são bem-vindas! Abra seu PR ou issue em: https://github.com/sejavitat/vitat-sendgrid-ruby.

1. Faça suas alterações no código localmente e comite suas mudanças com mensagens descritivas.
2. Atualize a versão da gem em `lib/vitat/sendgrid/version.rb` seguindo o padrão de versionamento semântico (major.minor.patch).
    
    Exemplo: para uma pequena correção, incremente a parte 'patch'; para novas funcionalidades, a 'minor'; e para mudanças incompatíveis com versões anteriores, a 'major'.
    
    Mensagem sugerida para o commit: "Bump version to x.y.z", substituindo x.y.z pela nova versão.

3. Abra PR das suas alterações a faça merge na `main`.
4. Após atualizar a versão, crie uma tag no Git correspondente à nova versão.

    ```
    git tag -a vx.y.z -m "Release version x.y.z"
    ```

5. Faça push da tag para o repositório no GitHub.
    
    ```
    git push origin vx.y.z
    ```

    Substitua x.y.z pela versão atual.
