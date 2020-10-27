# README

* Ruby version

  **ruby 2.6.3

* Rails version

  ** Rails 5.2.4

* System dependencies

  ** run bundle

* Database creation
  ** rake db:create

* Database initialization
  ** rake db:migrate

* Configs

  ** You can use ngrok to test the webhook on development
  ** download -> https://ngrok.com/download
  ** run -> ./ngrok http 3000

* Set enviroment variables

  ** create a .env -> run $touch .env on terminal

  ** LOGIN=xxx
  ** PASSWORD=xxx
  ** GITHUB_WEBHOOK_KEY="your_key_from_github_webhook"

* API Endpoints

  ** GET /api/v1/issues/:number/events

  application/json
    To check the events from a particular number, you need to pass the :number on the request
    In the headers of request => { "login": "xxx", "password": "xxx"}


