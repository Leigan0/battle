def sign_in_and_play
  visit('/')
  fill_in 'player_1_name', :with => 'Simon'
  fill_in 'player_2_name', :with => 'Leigh-ann'
  click_button "Let's go"
end