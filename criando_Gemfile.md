# Criando nosso Gemfile.

O Gemfile é um gerenciador de dependências das gems e é acessado pela gem bundler e basicamente pega as gems que estão no Gemfile e instala junto com suas dependências e quando em algum momento eu precise de uma gem cuja dependência já tenha sido instalada, ela não precisa instalar de novo.

Outra vantagem do Gemfile é colocar lá as versões de cada gem que eu quero trabalhar.

Gemfile não tem extensão (.txt, .md, .xpto).

Vamos criar o nosso arquivo na raiz do nosso projeto com o nome Gemfile (exatamente desse jeito) e vamos colocar o seu conteúdo da seguinte maneira:

```ruby
source "https://rubygems.org"

gem "cucumber"
gem "capybara"
gem "selenium-webdriver"
gem "faker"
```
Agora vamos instalar a gem bundler:

```ruby
gem install bundler
```
Agora na raiz do projeto vamos rodar o comando de instalar:

```ruby
bundle install
```
E será esse o resultado:

```ruby
Fetching gem metadata from https://rubygems.org/
Fetching version metadata from https://rubygems.org/
Resolving dependencies...
Using addressable 2.4.0
Using builder 3.2.2
Using mime-types-data 3.2016.0521
Using mini_portile2 2.1.0
Using pkg-config 1.1.7
Using rack 1.6.4
Using ffi 1.9.10
Using gherkin 4.0.0
Using cucumber-wire 0.0.1
Using diff-lcs 1.2.5
Using multi_json 1.12.1
Using multi_test 0.1.2
Using i18n 0.7.0
Using rubyzip 1.2.0
Using websocket 1.2.3
Using bundler 1.12.5
Using mime-types 3.1
Using nokogiri 1.6.8
Using rack-test 0.6.3
Using childprocess 0.5.9
Using cucumber-core 1.5.0
Using faker 1.6.3
Using xpath 2.0.0
Using selenium-webdriver 2.53.3
Using cucumber 2.4.0
Using capybara 2.7.1
Bundle complete! 4 Gemfile dependencies, 26 gems now installed.
Use bundle show [gemname] to see where a bundled gem is installed.
```
Então observem que além das 4 gems, ele instalou todas as dependências de cada uma delas, ou seja, se precisarmos de qualquer uma gem fora dessas que colocamos no Gemfile, basta eu falar que quero usá-la.
