# Trabalhando com dados aleatórios utilizando as gems Faker e CPF Faker.

Uma vez que as gems já estão instaladas, basta agora saber como trabalhar com elas. Eu vou passar aqui os dados genéricos que são bastante utilizados, porém, podemos acessar o github da própria gem para poder ver outras coisoas.

O ruby tem o console dele (irb) que serve para podermos "testar" qualquer coisa antes de sair por aí implementando.

Vamos agora chamar o Faker para a jogada lá no nosso arquivo support/env.rb e vao ficar da seguinte maneira nosso arquivo env:

```ruby
require "capybara/cucumber"
require "selenium-webdriver"
require "faker"
require "cpf_faker"

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 60
```

Então nesse arquivo definimos:

```ruby
require "capybara/cucumber" -- Para usar Gherkin e usar os comandos do Framework Capybara.
require "selenium-webdriver" -- Para usar o driver que no caso é o próprio Selenium Webdriver.
require "faker" -- Para conseguir usar dados genéricos.
require "cpf_faker" -- Para usar dados de cpf genéricos.
```

```ruby
Capybara.default_driver = :selenium -- Deixando claro que o driver que será rodado por baixo será o Selenium (em outro tópico eu lido com outras maneiras de trabalhar o driver, por exemplo, rodar em headles com webkit).
Capybara.default_max_wait_time = 60 -- Tempo antes de dar Time Out.
```
Beleza ... abaixo vou colocar alguns comandos do Faker que mais fazem sentido:

```ruby
Faker::Name.name = Para nomes aleatórios;
"Jhon Dee"

Faker::Lorem.paragraph(2) = Para escrever Lorem e entre ( ) colocar quantos parágrafos.
"Minima aliquam voluptas commodi quos. Praesentium aut debitis tempora. Eos labore accusantium ducimus. Voluptatem labore omnis vitae voluptas."

Faker::Company.name = Para nomes de empresa aleatórios.
 "Reichert-Halvorson inc."

Faker::Base.numerify('112419####') = Eu utilizo para Senhas aleatórias, "# é utilizado para números aleatórios.". Mas no caso, pra qualquer base numérica.

Faker::Number.number(10)  = Para números aleatórios e entre ( ) quantos números vc quer trabalhar.

Faker::Internet.email = Para emails aleatórios.
"marcos_zulauf@ortiz.org"

Faker::Internet.email('capybaraforall') = Para gerar email com prefixo específico entre ( ).
"capybaraforall@schuster.info"

Faker::CPF.numeric = Para gerar CPFs aleatórios.
"38012932970"

Faker::Date.forward(23) = Para gerar datas aleatórias. Entre ( ) nesse caso é para definir quantos dias a frente você quer definir e o faker vai gerar a data aleatória dentro desse período.
"2016-06-23"

Faker::Internet.url = Definir urls aleatórias.
"http://thiel.com/chauncey_simonis"

Faker::Internet.url('capybaraforall.com') = Para urls aleatórias com o prefixo definido entre ( ).
"http://capybaraforall.com/clotilde.swift"

Off Topic Faker:

Faker::StarWars.character
"Anakin Skywalker"

Faker::StarWars.droid
"C-3PO"

Faker::Beer.name
"Hercules Double IPA"

Faker::ChuckNorris.fact
"Chuck Norris can solve the Towers of Hanoi in one move."
```

O github da gem é: https://github.com/stympy/faker para mais itens =).

# Agora como vamos utilizar???

Exemplo:

```ruby
fill_in 'name', :with Faker::Name.name
find(:css, '#name').set(Faker::Name.name)
```
[E então, vamos para a prática no final do nosso material.](https://github.com/thiagomarquessp/capybara_for_all_p2/blob/master/mao_na_massa_faker.md)