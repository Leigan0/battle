feature 'Game over' do
  scenario 'player 2 loses game, p2 hit points 0' do
    sign_in_and_play
    click_button 'attack'
    click_button 'OK'
    allow(player_2).to receives(:hit_points).and_return 0
    expect(page).to have_content 'Leigh-ann, YOU LOSE !!!'
  end
end
