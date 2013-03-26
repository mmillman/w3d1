require 'rspec'
require 'tower_of_hanoi'

describe TowerOfHanoi do
  subject { TowerOfHanoi.new_game }
  # REV: Good use of subject.
  # Yea, I guess you're using it a lot 
  # hence a good reason to use subject.

  it "has three disks" do
    subject.rods.flatten.length == 3
  end

  it "disks are moveable" do
    subject.move_disk(0, 2)
    subject.rods.should == [[3, 2], [], [1]]
  end

  it "can't place a larger disk on a smaller disk" do
    subject.move_disk(0, 2)
    expect { subject.move_disk(0, 2) }.to raise_error("invalid move")
    # REV: Won't raising an error exit out of the program?
    # So like, if someone makes an invalid move, the whole
    # Hanoi program exits and they have to start from scratch?
    # I'm bringing this up since we had the same discussion
    # about when to raise error.
  end

  it "can't move a disk from empty rod" do
    expect { subject.move_disk(2, 0) }.to raise_error("invalid move")
  end

  it "can't move disk to nonexistant rod" do
    expect { subject.move_disk(0, 3) }.to raise_error("invalid move")
  end

  context "winning game" do
    subject { TowerOfHanoi.new([[], [], [3, 2, 1]]) }

    it "detects a win" do
      subject.should be_win
    end
  end

end





