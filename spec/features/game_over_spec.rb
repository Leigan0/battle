feature 'Game over' do
  scenario 'player 2 loses game, p2 hit points 0' do
    sign_in_and_play
    19.times { attack_player_and_return }
    expect(page).to have_content 'Leigh-ann, YOU LOSE !!'
  end
end
