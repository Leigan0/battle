feature 'Switch turns after action' do
  scenario 'Switches to player two after Player 1 action' do
    sign_in_and_play
    attack_player_and_return
    expect(page).to have_content('Leigh-ann hit points 90')
    attack_player_and_return
    expect(page).to have_content('Simon hit points 90')
  end

  feature 'Shows player turn' do
    scenario 'game starts as player 1 turn' do
      sign_in_and_play
      expect(page).to have_content("Simon's turn")
      expect(page).not_to have_content("Leigh-ann's turn")
    end

    scenario 'show player 2 turn after player 1 attack' do
      sign_in_and_play
      attack_player_and_return
      expect(page).to have_content("Leigh-ann's turn")
      expect(page).not_to have_content("Simon's turn")
    end
  end
end
