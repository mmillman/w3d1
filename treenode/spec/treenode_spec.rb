require 'rspec'
require 'treenode'

#     0
#   1   4
# 2  3
describe TreeNode do
  subject { TreeNode.new(:root) }
  let(:one)   { TreeNode.new(:one)   }
  let(:two)   { TreeNode.new(:two)   }
  let(:three) { TreeNode.new(:three) }
  let(:four)  { TreeNode.new(:four)  }

  before do
    subject.add_child(one)
    subject.add_child(two)
    one.add_child(three)
    one.add_child(four)
  end

  it "can add children" do
    root = TreeNode.new(:root)
    5.times { |index| root.add_child(TreeNode.new(index)) }
    root.children.count == 5
  end

  # REV seems like there are more tests you should run here, like whether disassociated children have their parent designation deleted

  # todo: test return values for each search

  describe "BFS" do
    it "visits nodes in correct order" do
      [subject, one, two, three, four].each do |node|
        node.should_receive(:value).ordered
      end
      subject.bfs(:four)
    end
  end

  describe "DFS" do
    it "visits nodes in correct order" do
      [subject, one, three, four, two].each do |node|
        node.should_receive(:value).ordered
      end
      subject.dfs(:two)
    end
  end

end