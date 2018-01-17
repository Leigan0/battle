feature 'viewing player hit points' do
  scenario 'Page shows player one and player two hit points' do
    # visit('/')
    # fill_in 'player_1_name', :with => 'Simon'
    # fill_in 'player_2_name', :with => 'Leigh-ann'
    # click_button "Let's go"
    sign_in_and_play
    expect(page).to have_content 'Simon hit points 100'
    expect(page).to have_content 'Leigh-ann hit points 100'
  end
end
