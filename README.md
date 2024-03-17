# Nova de novo - Management

![image](https://github.com/joaoGabriel55/nova-de-novo-rails-app/assets/23138717/ee0a13dc-a7e7-47e6-8297-7fdec02efce1)
![image](https://github.com/joaoGabriel55/nova-de-novo-rails-app/assets/23138717/0120520c-a55a-4206-bb22-b3510e06c73b)

## TODO

- CRUD Service Order
- Print Service Order (as PDF)
- Cron job with Sidekiq to save DB data on GDrive (https://github.com/gimite/google-drive-ruby)

## Setup

Up docker containers

```sh
docker compose up -d
```

Install gems

```sh
bundle install
```

Setup database

```sh
rails db:create # Only create databases (dev and test)
rails db:setup  # Create databases (dev and test), run migrations and run seed
```

Deploy app locally

```sh
./bin/dev
```

# Running tests

```sh
rspec
```

## Tips

If you want to see SQL queries generated by ActiveRecord methods use this cmd on rails console:

```rb
ActiveRecord::Base.logger = Logger.new STDOUT
```
