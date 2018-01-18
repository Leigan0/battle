feature 'Game over' do
  scenario 'player 2 loses game, p2 hit points 0' do
    sign_in_and_play
    click_button 'attack'
    click_button 'OK'
    allow($game.player_2).to receive(:dead?).and_return true
    expect(page).to have_content 'Leigh-ann, YOU LOSE !!!'
  end
end
