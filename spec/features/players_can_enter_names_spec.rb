feature "Players can enter names in a form " do
  scenario "two players enter name and submit" do
    sign_in_and_play
    expect(page).to have_content 'Simon vs Leigh-ann'
  end
end
