feature 'Player 1 attacks Player 2' do
  scenario 'attack confirmation' do
    sign_in_and_play
    click_button 'attack'
    expect(page).to have_content('Leigh-ann hit points 80')
    expect(page).to have_content('Simon hit points 100')
  end
end
