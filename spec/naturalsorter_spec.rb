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
  
  it "1.2, 1.1 is 1.1, 1.2" do
    Naturalsorter::Sorter.sort_version(["0.4", "0.1", "1.1", "1.2", "1.0"], "asc").should eql(["0.1", "0.4", "1.0", "1.1", "1.2"])
  end
  
  it "1.2, 1.1 is 1.1, 1.2" do
    Naturalsorter::Sorter.sort_version(["0.4", "0.1", "1.1", "1.2", "1.0", "1.0.RC1"], "asc").should eql(["0.1", "0.4", "1.0.RC1", "1.0", "1.1", "1.2"])
  end
  
  it "1.2, 1.1 is 1.1, 1.2" do
    Naturalsorter::Sorter.sort_version(["0.4", "0.1", "1.1", "1.2", "1.0", "1.0.RC1"], "desc").should eql(["1.2", "1.1", "1.0", "1.0.RC1", "0.4", "0.1"])
  end
  
  it "1.2, 1.1 is 1.1, 1.2" do
    Naturalsorter::Sorter.sort_version(["1.1", "1.2", "1.0"], "asc").should eql(["1.0", "1.1", "1.2"])
  end
  
  it "sort with RC" do
    Naturalsorter::Sorter.sort_version(["1.1", "1.1.RC1"], "asc").should eql(["1.1.RC1", "1.1"])
  end
  
  it "sort with RC" do
    Naturalsorter::Sorter.sort_version(["1.1.RC1", "1.1", "1.0"], "asc").should eql(["1.0", "1.1.RC1", "1.1"])
  end
  
end