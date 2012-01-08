require "naturalsorter"

describe Naturalsorter::Sorter do
  
  it "cba is abc" do
    Naturalsorter::Sorter.sort(["c", "b", "a"], true).should eql(["a", "b", "c"])
  end
  
  it "c400b5a1 is a1b5c400" do
    Naturalsorter::Sorter.sort(["a400", "a5", "a1"], true).should eql(["a1", "a5", "a400"])
  end
  
  it "c400b5a1 is a1b5c400" do
    Naturalsorter::Sorter.sort_by_method(["a400", "a5", "a1"], "to_s", true).should eql(["a1", "a5", "a400"])
  end

end