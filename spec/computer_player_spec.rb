require 'computer_player'

describe ComputerPlayer do
  subject(:computer) { described_class.new }
  it 'initializes with default name of computer' do
    expect(computer.name).to eq 'Computer'
  end
 end
