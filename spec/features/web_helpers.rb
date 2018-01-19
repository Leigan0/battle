def sign_in_and_play
  visit('/')
  fill_in 'player_1_name', :with => 'Simon'
  fill_in 'player_2_name', :with => 'Leigh-ann'
  click_button "Let's go"
end

def attack_player_and_return
  allow_any_instance_of(Attack).to receive(:rand).and_return(10)
  click_button 'attack'
  click_button 'OK'
end
