feature 'viewing player hit points' do
  scenario 'Page shows player one and player two hit points' do
    sign_in_and_play
    expect(page).to have_content 'Simon hit points 100'
    expect(page).to have_content 'Leigh-ann hit points 100'
  end
end
