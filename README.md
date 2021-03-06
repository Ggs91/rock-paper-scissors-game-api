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


## Make a request with Postman:
 - Go to [https://www.postman.com/](https://www.postman.com/) or download the app
 - Go to "My workspace" then click "Create a request"
 - Select the body panel, then "raw" and select "JSON" format
 - Set the URL to `http://localhost:3000/api/v1/games`

### 1. First endpoint:

To play the game,`POST` player's `name` and `move` to the API.
- Select `POST` on the dropdown button
- Write the request body:

```json
{
  "name": "Ponky",
  "move": "rock"
}
```

A response is sent back to the postman client, and result appears in the body response.

### 2. Second endpoint:
To retrieve past games history, send a `GET` request to the URL, you can specify `limit` and `offset` options for pagination:
- Select `GET` on the dropdown button
- Add the options to the url (type `?` followed by the key value pairs separated by `&`), e.g: `http://localhost:3000/api/v1/games?limit=10&offset=5` will get the first 10 items starting from the 5th one. You can omit either the limit (it will be 100 by default), or both, (it will retrieve the first 100 records).
- Click "send", you will receive a response with an array of the requiered records.
