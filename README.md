# README

## Overview

This project is the final stage of the technical challenge proposed by Elevate.  
It contains RESTful API that supports user sign-up, authentication, and additional protected endpoints.  


## Technologies
- Docker
- Ruby (version 3.3.8)
- Ruby on Rails
- Postgres
- Sidekiq
- Redis
- RSpec
- JWT

## Getting Started

This project runs inside a Docker environment, so you don't need to install every single technologies listed above on your local machine.  
Follow the steps below inside of the app folder in your computer to get everything up and running:


### 1. Close the project
First of all you will need to clone the project.

```bash
git clone git@github.com:chrfreitas/elevate-app-test.git
```

### 2. Build the docker image

```bash
docker compose build
```

### 3. Start the docker containers

```bash
docker compose up
```
* Ensure the following services are running correctly: `app`, `postgres`, `redis`, and `sidekiq`.

### 4. Set up database

```bash
docker compose exec app bash
rails db:create
rails db:migrate
```

### 5. Done!
The server should now be running at: http://localhost:3000


## Testing
In other to execute all of them just run into the container the following commands:


```bash
docker compose exec app bash
RAILS_ENV=test rails db:create
RAILS_ENV=test rails db:migrate

rspec
```

## Project Structure
That's quick overview of the main folders in the application:

- `/adapters` – Wraps third-party libraries to separate them from the codebase.
- `/controllers` – Handles HTTP requests.
- `/integrations` – Contains external API clients (e.g. for payment providers or other services).
- `/models` – Defines ActiveRecord models.
- `/presenters` – Prepares and formats data for the API responses, controlling what is exposed to the client.
- `/services` – Contains reusable service classes.
- `/workers` – Asynchronous background jobs processed by Sidekiq.



