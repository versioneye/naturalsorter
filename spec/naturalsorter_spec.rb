require "naturalsorter"

describe Naturalsorter::Sorter do
  
  it "cba is abc" do
    Naturalsorter::Sorter.sort(["c", "b", "a"], true).should eql(["a", "b", "c"])
  end
  
  it "c400b5a1 is a1b5c400" do
    Naturalsorter::Sorter.sort(["c400", "b5", "a1"], true).should eql(["a1", "b5", "c400"])
  end
  
  it "c400b5a1 is a1b5c400" do
    Naturalsorter::Sorter.sort_by_method(["c400", "b5", "a1"], "to_s", true).should eql(["a1", "b5", "c400"])
  end

end