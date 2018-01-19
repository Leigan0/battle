feature 'play against computer player' do
  before do
    fill_in 'player_2_name', :with => 'Leigh-ann'
    click_button "Let's go"
  end

  scenario 'Only one name entered to play - computer default' do
    expect(page).to have_content "Leigh-an vs Computer"
  end
  scenario 'Computer attacks player automatically after being attacked' do
    attack_player_and_return
    expect(page).to have_content
    expect(page).to have_content('Leigh-ann hit points 100')
    expect(page).to have_content('Simon hit points 90')
  end
end
