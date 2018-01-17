feature 'Shows player turn' do
  scenario 'show player 1 turn' do
    sign_in_and_play
    expect(page).to have_content('Player Leigh-anns turn')
    expect(page).not_to have_content('Player Simons turn')
  end

  scenario 'show player 2 turn' do
    sign_in_and_play
    click_button 'attack'
    expect(page).to have_content('Player Simons turn')
    expect(page).not_to have_content('Player Leigh-anns turn')
  end
end
