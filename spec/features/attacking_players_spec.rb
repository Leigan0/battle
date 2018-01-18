feature 'Players can attack each other' do
  scenario 'Player 1 receives confirmation of attack on player 2' do
    sign_in_and_play
    click_button 'attack'
    expect(page).to have_content 'Simon attacked Leigh-ann'
  end
  scenario 'Player 1 attack reduces player 2 hit points' do
    sign_in_and_play
    click_button 'attack'
    click_link 'OK'
    expect(page).to have_content('Leigh-ann hit points 90')
    expect(page).not_to have_content('Leigh-ann hit points 100')
  end

  scenario 'Player 2 receives confirmation of attack on player 1' do
    sign_in_and_play
    click_button 'attack'
    click_link 'OK'
    click_button 'attack'
    expect(page).to have_content 'Leigh-ann attacked Simon'
  end
  scenario 'Player 2 attacks reduces Player 1 hit points' do
    sign_in_and_play
    click_button 'attack'
    click_link 'OK'
    click_button 'attack'
    click_link 'OK'
    expect(page).not_to have_content('Simon hit points 100')
    expect(page).to have_content('Simon hit points 90')
  end
end
