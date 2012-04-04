require "naturalsorter"

describe Naturalsorter::Sorter do
  
  describe "sort" do
    it "cba is abc" do
      Naturalsorter::Sorter.sort(["c", "b", "a"], true).should eql(["a", "b", "c"])
    end
    it "c400b5a1 is a1b5c400" do
      Naturalsorter::Sorter.sort(["a400", "a5", "a1"], true).should eql(["a1", "a5", "a400"])
    end
  end
  
  describe  "sort_by_method" do
    it "c400b5a1 is a1b5c400" do
      Naturalsorter::Sorter.sort_by_method(["a400", "a5", "a1"], "to_s", true).should eql(["a1", "a5", "a400"])
    end
  end
  
  
  describe "sort_version" do
  
    it "1.1, 1.0 is 1.0, 1.1" do
      Naturalsorter::Sorter.sort_version(["1.1", "1.0"], "asc").should eql(["1.0", "1.1"])
    end
    
    it "1.0, 1.1 is 1.0, 1.1" do
      Naturalsorter::Sorter.sort_version(["1.0", "1.1"], "asc").should eql(["1.0", "1.1"])
    end
    
    it "4.5, 1.0 is 1.0, 4.5" do
      Naturalsorter::Sorter.sort_version(["4.5", "1.0"], "asc").should eql(["1.0", "4.5"])
    end
    
    it "1.0, 4.5 is 1.0, 4.5" do
      Naturalsorter::Sorter.sort_version(["1.0", "4.5"], "asc").should eql(["1.0", "4.5"])
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
  
  describe "is_version_current?" do 
    it "returns true" do 
      Naturalsorter::Sorter.is_version_current?("1.1.1", "1.1.9").should be_true
    end
    it "returns false" do 
      Naturalsorter::Sorter.is_version_current?("1.1.1", "1.2.0").should be_false
    end
    it "returns false" do 
      Naturalsorter::Sorter.is_version_current?("1.1.1", "1.2").should be_false
    end
    it "returns false" do 
      Naturalsorter::Sorter.is_version_current?("1.1.1", "2.0").should be_false
    end
    it "returns false" do 
      Naturalsorter::Sorter.is_version_current?("1.1.1", "2").should be_false
    end
  end
  
  describe "get_newest_version" do 
    
    it "returns 2.0" do
      Naturalsorter::Sorter.get_newest_version("1.1", "2.0").should eql("2.0")
    end
    it "returns 1.1" do
      Naturalsorter::Sorter.get_newest_version("1.1", "1.0").should eql("1.1")
    end
    it "returns 4.5" do
      Naturalsorter::Sorter.get_newest_version("4.5", "1.0").should eql("4.5")
    end
    it "returns 1.0" do
      Naturalsorter::Sorter.get_newest_version("1.0", "1.0").should eql("1.0")
    end
  
  end
  
end