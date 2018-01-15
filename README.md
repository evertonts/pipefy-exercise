# Pipefy Exercise

[![CircleCI](https://circleci.com/gh/evertonts/pipefy-exercise/tree/master.svg?style=svg)](https://circleci.com/gh/evertonts/pipefy-exercise/tree/master)

https://pipefy-exercise.herokuapp.com

Fetches the Pipefy API saves the result and display a table with all the cards and it's information for a specific organization and pipe. The App is using ruby 2.5.0, Rails 5.1.4 and PostgreSQL.

## Setup
Just run the setup script

```bash
bin/setup
```
Then add your PostgreSQL configuration to the .env file

## Running
```bash
bin/rails s
```

## Tests
To run the tests
```bash
bin/rspec
```
