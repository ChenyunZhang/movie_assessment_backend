# Moviee

## What is Moviee

Moviee is a website for users to browser trending movies.

## Demo

### [Front-End](https://github.com/ChenyunZhang/movie_assessment_front)

- Moviee is built using React as its front-end framework.

- React hooks as well as Redux are utilized in order to manage stateful logic and to create a cohesive UX.

- Moviee's API is built with Ruby on Rails, utilizing PostgreSQL for its database.

- NewsMe gathers the trending movies from TMDB API

### Installation (make sure to first run backend)
- Clone repo and CD into the directory
- bundle install
- run rails db:create to create your postgres database
- run rails db:migrate to bring up migrations
- run rails db:seed to seed data for movies
- run rails s to start the server