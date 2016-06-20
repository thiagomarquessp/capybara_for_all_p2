# Mão na massa. Agora vamos colocar em prática o Faker \o/

Primeiro (e de novo) vamos criar um projeto novo no com o comando:

```ruby
cucumber --init
```

Agora vamos criar a mesma estrutura de pastas que criamos na Parte I:

```ruby
cucumber
cucumber/features
cucumber/features/specifications
cucumber/features/step_definitions
cucumber/features/support
cucumber/features/support/env.rb
```

Agora vamos criar o arquivo register.feature dentro da pasta specifications da seguinte forma:

```ruby
Feature: Register

Scenario: Register on Wal Mart

  Given I access the Walmart site
  When I click on Register
  And fill in the fields
  And click Cadastar
  Then my registration will be successfully made
```
Agora .. vamos navegar até a pasta cucumber do nosso projeto e executar o próprio comando cucumber para que ele pegar meu arquivo de feature e estruturar para eu definir os steps. Relembrando, o resultado vai ficar assim:

```ruby
Given(/^I access the Walmart site$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click on Register$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

And(/^fill in the fields$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

And(/^click Cadastar$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^my registration will be successfully made$/) do
  pending # Write code here that turns the phrase above into concrete actions
```

Agora vamos criar o nosso arquivo "register.rb" dentro da pasta features/step_definitions e colar o conteúdo acima dentro dele.

E o código nesse caso vai ficar assim:

```ruby
# encoding: utf-8
Given(/^I access the Walmart site$/) do
  visit "https://www.walmart.com.br/"
end

When(/^I click on Register$/) do
  find(:css, '#topbar-signup-link').click
end

And(/^fill in the fields$/) do
  within_frame 'iframeLogin' do
    @password = Faker::Base.numerify('Capybara####').to_s
    @name = Faker::Name.name
    fill_in 'notifymeClientName', with: @name
    fill_in 'email', with: Faker::Internet.email('capybaraforall')
    fill_in 'cpfcnpj', with: Faker::CPF.numeric
    fill_in 'phone', with: Faker::Base.numerify('112419####').to_s
    fill_in 'password', with: @password
    fill_in 'signupClientPwdCheck', with: @password
    find(:css, '#signupButtonSend').click
  end
end

And(/^click Cadastar$/) do
  within_frame 'iframeLogin' do
    find(:css, '#signupButtonSend').click
  end
end

Then(/^my registration will be successfully made$/) do
  find(:css, '.profile-img').click
  page.has_css?('.sh-value.ng-binding', :text => @name, :visible => true)
end
```
Antes de alguém se perguntar "Que porra é essa de @password" eu respondo... Como os dados são aleatórios, se eu colocar em dois lugares o mesmo Faker, eles vão gerar valores diferentes, então no caso do password, que eu tenho que colocar a mesma informação tanto no password como na confirmação do password, os valores tem que ser iguais e ai eu peguei, defini uma variável (@password) e armazenei o Faker dentro dela, e toda vez que eu colocar o @password em algum lugar, ele vai me jogar o conteúdo de dentro dele (no caso um nome). O mesmo se aplica para a variável @name que eu armazenei um Faker dentro dela para conseguir ver se o usuário que eu realmente cadastrei foi cadastrado com sucesso. Alguns não gostam dessa prática, mas para quem ta começando, fazer isso é uma forma de prestar atenção em tudo que é desenvolvido =). Um outro tópico (capybaraforall_diversos) eu vou falar um pouco de boas práticas, macetes, etc.

Quando executar o teste, o resultado será esse:

```ruby
Feature: Register

  Scenario: Register on Wal Mart                   # features/specifications/register.feature:3
    Given I access the Walmart site                # features/step_definitions/register.rb:2
    When I click on Register                       # features/step_definitions/register.rb:6
    And fill in the fields                         # features/step_definitions/register.rb:10
    And click Cadastar                             # features/step_definitions/register.rb:23
    Then my registration will be successfully made # features/step_definitions/register.rb:29

1 scenario (1 passed)
5 steps (5 passed)
0m22.022s
```
Executado em 22 segundos e toda vez que você executar esse teste, serão gerados dados aleatórios e você nunca vai repetir dados no seus teste.

Obs.: No caso do Walmart, quando você executa várias vezes o mesmo teste, ele coloca captcha. No próximo episódio vou tentar outro site pra brincarmos =). Não compensa eu falar de captcha agora se não conseguimos andar com as próprias pernas.

O princípio é esse galera. Usar dados aleatórios, usar os comandos básicos, salvar a cada sucesso, tentar e tentar e tentar até conseguir.

O repositório está ai para consulta. Mas tentem aplicar essas técnicas iniciais em algum outro site.

No próximo bloco (rsrs) vamos falar um pouco sobre como utilizar Page Objects e ai as coisas vão começar a ficar legais. Não vai sair do dia pra noite esse porque quero achar a melhor forma de explicar esse conceito de uma maneira tranquilinha sem gerar bloqueios.

Qualquer dúvida meu email é thiagomarquessp@gmail.com e para críticas também.
