require 'rspec'
require 'board'

describe Board do

  #REV you can define the let outside the two it() methods so that both share the code.

  it "makes a piece" do
    let(:piece1) { double('piece', :color => :black) }
    #subject.make_piece(piece1.color)
  end

  it "set a piece" do
    let(:piece1) { double('piece', :color => :black) }
    subject.set_piece(:black, [2, 3])
    # get board [2,3] and it should return piece1
  end

  #REV or maybe use a begin(:each) ? would allow you to reset the example code so that you wouldn't carry over state

  it "checks valid moves"


  it "makes flips"
  it "multiple directions"
  it "win"

end