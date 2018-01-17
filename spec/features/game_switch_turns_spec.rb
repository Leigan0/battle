feature 'Switch turns after action' do
  scenario 'Switches to player two after Player 1 action' do
    sign_in_and_play
    click_button 'attack'
    expect(page).to have_content('Leigh-ann hit points 90')
    click_button 'attack'
    expect(page).to have_content('Simon hit points 90')
  end
end
