require 'rspec'
require 'board'

describe Board do

  it "makes a piece" do
    let(:piece1) { double('piece', :color => :black) }
    #subject.make_piece(piece1.color)
  end

  it "set a piece" do
    let(:piece1) { double('piece', :color => :black) }
    subject.set_piece(:black, [2, 3])
    # get board [2,3] and it should return piece1
  end


  it "checks valid moves"


  it "makes flips"
  it "multiple directions"
  it "win"

end