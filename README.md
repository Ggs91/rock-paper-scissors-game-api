# Rock Paper Scissors API built with Ruby on Rails

## I - Initialization

1. Clone the project: open a terminal and type in
```
$ git clone https://github.com/Ggs91/rock-paper-scissors-game-api
```
2. Change directory to `rock-paper-scissors-game-api`:
```
$ cd rock-paper-scissors-game-api
```
3. Download dependencies:

```
$ bundle install
```

4. Setup database:
```
$ rails db:create
$ rails db:migrate
```

5. Start the server:
```
$ rails s
```

## II - Make a request to the API using Postman

##### Available endpoints:
- `POST/api/v1/games`: Play the game and save result in DB. Result response (includes moves, players name and result) is sent back.
- `GET/api/v1/games`: Retrieve past games from DB.


##### To make a request with Postman, simply:
 - Go to [https://www.postman.com/](https://www.postman.com/) or download the app
 - Go to "My workspace" then click "Create a request"
 - Select the body panel, then "raw" and select "JSON" format
 - Set the URL to `http://localhost:3000/api/v1/games`

#####First endpoint:

To play the game, we `POST` the player's `name` and `move` to the API.
- Select `POST` on the dropdown button
- Write the request body:

```json
{
  "name": "Ponky",
  "move": "rock"
}
```

#####Second endpoint:
To retrieve past the game history, we send a `GET` request to the URL.
- Select `GET` on the dropdown button
- Click "send", you will receive a response back with the past games history.
