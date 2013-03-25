require 'rspec'
require 'array'

describe "Array" do

  describe "my_uniq" do
    subject { [1, 2, 1, 3, 3] }

    it "strips out repeated values" do
      subject.my_uniq.should == [1, 2, 3]
    end
  end

  describe "two_sum" do
    let(:no_two_sum) { [1, 2, 1, 3, 3] }
    let(:has_two_sum) { [1, 2, 1, 3, -3] }

    it "does not have pairs that sums to zero" do
      no_two_sum.two_sum.should be_false
    end

    it "has pair that sums to zero" do
      has_two_sum.two_sum.should be_true
    end

    context "array with zeros" do
      let(:one_zero) { [1, 2, 0, 3, 3] }
      let(:two_zeros) { [1, 2, 0, 3, 0] }

      it "returns false with one zero" do
        one_zero.two_sum.should be_false
      end

      it "returns true with two zeros" do
        two_zeros.two_sum.should be_true
      end

    end

  end




end