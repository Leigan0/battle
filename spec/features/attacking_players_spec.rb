feature 'Player 1 attacks Player 2' do
  scenario 'attack confirmation' do
    sign_in_and_play
    click_button 'attack'
    expect(page).to have_content('Leigh-ann hit points 90')
    expect(page).not_to have_content('Leigh-ann hit points 100')
  end
  scenario 'Player 2 attacks Player 1' do
    sign_in_and_play
    click_button 'attack'
    click_button 'attack'
    expect(page).not_to have_content('Simon hit points 100')
    expect(page).to have_content('Simon hit points 90')
  end
end
