require 'rspec'
require 'board'

describe Board do

  describe "::new_board" do
    it "creates a blank board" do
      Board.new_board.length.should == 8
    end
  end

  describe "#set_piece" do
    let(:black_piece) { double('piece', :color => :black ) }

    it "puts piece in the correct place" do
      subject.set_piece(black_piece, [1, 1])
      subject[1, 1].should == black_piece
    end
  end

  it "checks valid moves"


  it "makes flips"
  it "multiple directions"
  it "win"

end