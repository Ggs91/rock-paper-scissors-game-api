json.array! @games do |game|
  json.moves do
    json.name game.players.first.name
    json.move game.players.first.hand_move.name
  end

  json.result game.result
end
