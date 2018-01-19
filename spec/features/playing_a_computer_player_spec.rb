feature 'play against computer player' do
  before do
    visit('/')
    fill_in 'player_1_name', :with => 'Leigh-ann'
    click_button "Let's go"
  end
  scenario 'Only one name entered to play - computer default' do
    expect(page).to have_content "Leigh-ann vs Computer"
  end
  scenario 'Computer attacks player automatically after being attacked' do
    attack_player_and_return
    expect(page).to have_content('Computer attacked Leigh-ann')
  end
  scenario 'Computer attack reduce player points' do
    attack_player_and_return
    click_button("OK")
    expect(page).to have_content('Leigh-ann hit points 90')
  end
end
