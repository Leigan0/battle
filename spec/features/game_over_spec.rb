feature 'Game over' do
  scenario 'player 2 loses game, p2 hit points 0' do
    allow_any_instance_of(Attack).to receive(:rand).and_return(Player::DEFAULT_HITPOINTS)
    sign_in_and_play
    click_button 'attack'
    click_button 'OK'
    expect(page).to have_content 'Leigh-ann, YOU LOSE !!'
  end
end
