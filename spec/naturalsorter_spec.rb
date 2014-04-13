require "naturalsorter"

describe Naturalsorter::Sorter do

  describe "sort" do
    it "cba is abc" do
      Naturalsorter::Sorter.sort(["c", "b", "a"], true).should eql(["a", "b", "c"])
    end
    it "is 2.2, 2.2.1-b03" do
      Naturalsorter::Sorter.sort(["2.2.1-b03", "2.2"], true).should eql(["2.2", "2.2.1-b03"])
    end
    it "c400b5a1 is a1b5c400" do
      Naturalsorter::Sorter.sort(["a400", "a5", "a1"], true).should eql(["a1", "a5", "a400"])
    end
  end
  describe "sort_desc" do
    it "cba is abc" do
      Naturalsorter::Sorter.sort(["c", "b", "a"],      true, false).should eql(["c", "b", "a"])
    end
    it "c400b5a1 is a1b5c400" do
      Naturalsorter::Sorter.sort(["a5", "a400", "a1"], true, false).should eql(["a400", "a5", "a1"])
    end
  end

  describe  "sort_by_method" do
    it "c400b5a1 is a1b5c400" do
      Naturalsorter::Sorter.sort_by_method(["a400", "a5", "a1"], "to_s", true).should eql(["a1", "a5", "a400"])
    end
  end
  describe  "sort_by_method_desc" do
    it "a5 a400 a1 is a400 a5 a1" do
      Naturalsorter::Sorter.sort_by_method(["a5", "a400", "a1"], "to_s", true, false).should eql(["a400", "a5", "a1"])
    end
  end


  describe "sort_version" do

    it "1.1 is 1.1" do
      Naturalsorter::Sorter.sort_version(["1.1"]).should eql(["1.1"])
    end

    it "1.1 is bigger than 20030211.134440" do
      Naturalsorter::Sorter.sort_version(["1.1", "20030211.134440"]).should eql(["20030211.134440", "1.1"])
    end

    it "is 2.2.0, 2.2.1-b03" do
      Naturalsorter::Sorter.sort_version(["2.2.1-b03", "2.2.0", ]).should eql(["2.2.0", "2.2.1-b03"])
    end

    it "is 2.2, 2.2.1-b03" do
      Naturalsorter::Sorter.sort_version(["2.2.1-b03", "2.2", ]).should eql(["2.2", "2.2.1-b03"])
    end

    it "is 2.2.0-b03, 2.2.1-b03" do
      Naturalsorter::Sorter.sort_version(["2.2.1-b03", "2.2.0-b03", ]).should eql(["2.2.0-b03", "2.2.1-b03"])
    end

    it "1.1, 1.0 is 1.0, 1.1" do
      Naturalsorter::Sorter.sort_version(["1.1", "1.0"]).should eql(["1.0", "1.1"])
    end

    it "1.0, 1.1 is 1.0, 1.1" do
      Naturalsorter::Sorter.sort_version(["1.0", "1.1"]).should eql(["1.0", "1.1"])
    end

    it "4.5, 1.0 is 1.0, 4.5" do
      Naturalsorter::Sorter.sort_version(["4.5", "1.0"]).should eql(["1.0", "4.5"])
    end

    it "1.0, 4.5 is 1.0, 4.5" do
      Naturalsorter::Sorter.sort_version(["1.0", "4.5"]).should eql(["1.0", "4.5"])
    end

    it "1.2, 1.1 is 1.1, 1.2" do
      Naturalsorter::Sorter.sort_version(["0.4", "0.1", "1.1", "1.2", "1.0"]).should eql(["0.1", "0.4", "1.0", "1.1", "1.2"])
    end

    it "1.2, 1.1 is 1.1, 1.2" do
      Naturalsorter::Sorter.sort_version(     ["0.4", "0.1", "1.1", "1.2", "1.0", "1.0.RC1"]).should eql(["0.1", "0.4", "1.0.RC1", "1.0", "1.1", "1.2"])
    end

    it "1.2, 1.1 is 1.1, 1.2" do
      Naturalsorter::Sorter.sort_version(["0.4", "0.1", "1.1", "1.2", "1.0", "1.0.RC1"], false).should eql(["1.2", "1.1", "1.0", "1.0.RC1", "0.4", "0.1"])
    end

    it "1.2, 1.1 is 1.1, 1.2" do
      Naturalsorter::Sorter.sort_version(["0.4", "0.1", "1.1", "1.1.1", "1.2", "1.2.1", "1.0", "1.0.RC1"], false).should eql(["1.2.1", "1.2", "1.1.1", "1.1", "1.0", "1.0.RC1", "0.4", "0.1"])
    end

    it "sorts this to the end 20040121.140929" do
      Naturalsorter::Sorter.sort_version(["0.4", "0.1", "20040121.140929", "1.1.1", "1.2", "1.2.1", "1.0", "1.0.RC1"], false).should eql(["1.2.1", "1.2", "1.1.1", "1.0", "1.0.RC1", "0.4", "0.1", "20040121.140929"])
    end

    it "1.2, 1.1 is 1.1, 1.2" do
      Naturalsorter::Sorter.sort_version(["1.1", "1.2", "1.0"]).should eql(["1.0", "1.1", "1.2"])
    end

    it "sort alphas and betas" do
      Naturalsorter::Sorter.sort_version(["1.0.2", "1.0.1-b", "1.0.1-a"]).should eql(["1.0.1-a", "1.0.1-b", "1.0.2"])
    end

    it "sort with RC" do
      Naturalsorter::Sorter.sort_version(["1.1", "1.1.RC1"]).should eql(["1.1.RC1", "1.1"])
    end

    it "sort with RC" do
      Naturalsorter::Sorter.sort_version(["1.1.RC1", "1.1", "1.0"]).should eql(["1.0", "1.1.RC1", "1.1"])
    end

    it "sorts 2.1.0-beta11 higher than 2.1.0-beta9" do
      Naturalsorter::Sorter.sort_version(["2.1.0-beta11", "2.1.0-beta9"]).should eql(["2.1.0-beta9", "2.1.0-beta11"])
    end

  end

  describe "is_version_current?" do
    it "returns true" do
      Naturalsorter::Sorter.is_version_current?("1.1.1", "1.1.9").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.is_version_current?("1.1.1", "1.1.2").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.is_version_current?("1.1.1", "1.1.12").should be_true
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
    it "returns false" do
      Naturalsorter::Sorter.is_version_current?("1.1", "2.0").should be_false
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
    it "returns 1.10" do
      Naturalsorter::Sorter.get_newest_version("1.10", "1.8").should eql("1.10")
    end
    it "returns 1.10" do
      Naturalsorter::Sorter.get_newest_version("1.10", "v1.0").should eql("1.10")
    end
    it "returns v1.10" do
      Naturalsorter::Sorter.get_newest_version("v1.10", "v1.0").should eql("v1.10")
    end
    it "returns v1.10" do
      Naturalsorter::Sorter.get_newest_version("v1.10", "1.0").should eql("v1.10")
    end
    it "returns 1.10.x-dev" do
      Naturalsorter::Sorter.get_newest_version("1.10.x-dev", "1.10.1").should eql("1.10.x-dev")
    end
    it "returns still 1.10.x-dev" do
      Naturalsorter::Sorter.get_newest_version("1.10.x-dev", "1.10.99").should eql("1.10.x-dev")
    end
    it "returns still 1.11.1" do
      Naturalsorter::Sorter.get_newest_version("1.10.x-dev", "1.11.1").should eql("1.11.1")
    end

  end

  describe "bigger?" do

    it "returns true" do
      Naturalsorter::Sorter.bigger?("1.1", "1.0").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.bigger?("1.1", "20030211.134440").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.bigger?("1.1", "20030211").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.bigger?("2.0", "1.0").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.bigger?("2.20", "2.9").should be_true
    end
    it "returns false" do
      Naturalsorter::Sorter.bigger?("2.20", "2.20").should be_false
    end
    it "returns false" do
      Naturalsorter::Sorter.bigger?("2.20", "3.0").should be_false
    end

  end

  describe "bigger_or_equal?" do

    it "returns true" do
      Naturalsorter::Sorter.bigger_or_equal?("1.1", "1.0").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.bigger_or_equal?("2.0", "1.0").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.bigger_or_equal?("2.20", "2.9").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.bigger_or_equal?("2.20", "2.20").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.bigger_or_equal?("2.20", "2.20.0").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.bigger_or_equal?("2.20", "2.20").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.bigger_or_equal?("v3.2.0", "3.2.0").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.bigger_or_equal?("v3.2.0", "3.1.0").should be_true
    end
    it "returns false" do
      Naturalsorter::Sorter.bigger_or_equal?("2.20", "3.0").should be_false
    end

  end

  describe "smaller?" do

    it "returns false" do
      Naturalsorter::Sorter.smaller?("1.1", "1.0").should be_false
    end
    it "returns false" do
      Naturalsorter::Sorter.smaller?("2.0", "1.0").should be_false
    end
    it "returns false" do
      Naturalsorter::Sorter.smaller?("2.20", "2.9").should be_false
    end
    it "returns false" do
      Naturalsorter::Sorter.smaller?("2.20", "2.20").should be_false
    end
    it "returns true" do
      Naturalsorter::Sorter.smaller?("2.20", "3.0").should be_true
    end
    it "returns false" do
      Naturalsorter::Sorter.smaller?("2.0", "2.0").should be_false
    end
    it "returns false" do
      Naturalsorter::Sorter.smaller?("2.0", "2.0.0").should be_false
    end

  end

  describe "smaller_or_equal?" do

    it "returns false" do
      Naturalsorter::Sorter.smaller_or_equal?("1.1", "1.0").should be_false
    end
    it "returns false" do
      Naturalsorter::Sorter.smaller_or_equal?("2.0", "1.0").should be_false
    end
    it "returns false" do
      Naturalsorter::Sorter.smaller_or_equal?("2.20", "2.9").should be_false
    end
    it "returns false" do
      Naturalsorter::Sorter.smaller_or_equal?("2.20", "2.20").should be_true
    end
    it "returns false" do
      Naturalsorter::Sorter.smaller_or_equal?("2.20.0", "2.20").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.smaller_or_equal?("2.20", "2.20").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.smaller_or_equal?("2.20", "3.0").should be_true
    end
    it "returns true" do
      Naturalsorter::Sorter.smaller_or_equal?("2.20", "v3.0").should be_true
    end

  end

end
