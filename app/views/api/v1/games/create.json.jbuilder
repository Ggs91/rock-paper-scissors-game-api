json.moves do
  json.array! @game.players do |player|
    json.name player.name
    json.move player.move
  end
end
json.result @game.result
