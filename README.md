# Matrioshka

Organizing redistributable Rails applications can be a pain. Typical way to solve the issue is to write a lot of generators to duplicate entries like migrations, seeds and other stuff from the host application. Modern Rails Engines system however has the ability to proxy all that for you. So most of ready Rails applications can become a gem within few simple steps. 

Matrioshka is a set of ready generators that will do the job on your behalf.

## Host Application (Gem)

Inject the following to your host application Gemfile:

```ruby
gem 'matrioshka'
```

Run Matrioshka install generator

```bash
rails g matrioshka:install
```

It will generate all the required additions and patches. For a typical application they will just work. However you probably should edit `$application.gemspec` to set proper meta information for your future gem.

## Client Application (Consumer)

As soon as your gem ready to rumble we can procceed to the consumer. Let's make it work within a new rails application:

```bash
rails new marakash
```

Add your application gem to the new Gemfile:

```ruby
gem '$application'
```

Run `bundle install` and then 

```bash
rake $application:link
```

Ta-dam. You are done here. Time to party hard.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
