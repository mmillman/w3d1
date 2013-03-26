require 'rspec'
require 'board'

describe Board do

  describe "::new_board" do
    it "creates a blank board" do
      Board.new_board.length.should == 8
    end
  end

  describe "square content retrieval" do
    it "retrieves a square's contents" do
      subject[4, 4].should be_a(Piece)
      subject[5, 5].should be_nil
    end
  end

  describe "#set_piece" do
    let(:black_piece) { double('piece', :color => :black ) }

    it "puts piece in the correct place" do
      subject.set_piece(black_piece, [1, 1])
      subject[1, 1].should == black_piece
    end
  end

  describe "#valid_move?" do
    # subject
    let(:off_board) { [9, 9] }
    let(:taken)     { [4, 4] }
    let(:isolated)  { [1, 1] }
    let(:no_flip)   { [5, 2] }

    it "rejects a coord off the board" do
      subject.valid_move?(:black, off_board).should equal(false)
    end

    it "rejects a taken square" do
      subject.valid_move?(:black, taken).should equal(false)
    end

    it "rejects an isolated piece" do
      subject.valid_move?(:black, isolated).should equal(false)
    end
  end

  context "opening sequence" do
    let(:coord1) { [2, 3] }
    let(:coord2) { [4, 2] }
    let(:piece1) { double("piece", :color => :black) }
    let(:piece2) { double("piece", :color => :white) }

    it "first move flips correct piece" do
      subject.coords_to_flip(piece1, coord1).should == [[3, 3]]
    end

    it "second move flips correct piece" do
      subject.set_piece(piece1, coord1)
      subject.coords_to_flip(piece2, coord2).should == [[4, 3]]
    end
  end

  it "multiple directions"
  it "win"

end