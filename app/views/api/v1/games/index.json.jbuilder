json.total @games.size
json.games @games do |game|
  json.moves do
    json.array! game.players do |player|
      json.name player.name
      json.move player.hand_move
    end
  end
  json.result game.result
  json.timestamps game.created_at.to_s(:db)
end
