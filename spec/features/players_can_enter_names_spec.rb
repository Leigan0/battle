feature "Players can enter names in a form " do
  scenario "two players enter name and submit" do
    visit('/')
    fill_in 'player_1_name', :with => 'Lewis'
    fill_in 'player_2_name', :with => 'Leigh-ann'
    click_button "Let's go"
    expect(page).to have_content 'Lewis vs Leigh-ann'
  end
end
