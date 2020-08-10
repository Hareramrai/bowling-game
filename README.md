# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version (2.7.1)

- System dependencies

- Configuration

- Database creation

  `rails db:create`

- Database initialization

  `rails db:setup`

- How to run the test suite

`SIMPLECOV=true bundle exec rake spec`

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- APIs

## API for starting a new game

** When passed invalid params for new game **

```
curl --location --request POST 'http://localhost:5000/api/v1/games' \
--header 'Content-Type: application/json' \
--data-raw '{

    "game": {
    	"player_name": null
    }

}'

```

** Response of above api **

`{ "player_name": [ "can't be blank" ] }`

** When passed valid params for new game **

```
curl --location --request POST 'http://localhost:5000/api/v1/games' \
--header 'Content-Type: application/json' \
--data-raw '{

    "game": {
    	"player_name": "James"
    }

}'

```

** Response of above api **

`{ "id": 1, "player_name": "James", "pins_knock_down_in_throws": [], "scores_in_frames": [], "created_at": "2020-08-09T13:41:25.567Z", "updated_at": "2020-08-09T13:41:25.567Z" }`

## API for playing a game

`curl --location --request POST 'http://localhost:5000/api/v1/games/1/pins_downs' \ --header 'Content-Type: application/json' \ --data-raw '{ "pins_down": { "pins_knocked": 10 } }'`

## API for fetching a score of a game

`curl --location --request GET 'http://localhost:5000/api/v1/games/1/scores' --header 'Content-Type: application/json'`

** Response of above api **

`{ "scores_in_frames": [ 20, 16, 6, 6, 0, 5, 15, 15, 15, 10 ], "total_scores": 108 }`
