require "naturalsorter"

describe Versioncmp do
  
  it "smaler" do
    Versioncmp.compare("1.1", "1.2").should eql(-1)
  end
  
  it "bigger" do
    Versioncmp.compare("1.1", "1.0").should eql(1)
  end
  
  it "equal" do
    Versioncmp.compare("1.1", "1.1").should eql(0)
  end
  
  it "equal RC" do
    Versioncmp.compare("1.1.RC1", "1.1.RC1").should eql(0)
  end
  
  it "smaller RC" do
    Versioncmp.compare("1.1.RC1", "1.1").should eql(-1)
  end
  
  it "smaller RC" do
    Versioncmp.compare("1.1.rc1", "1.1").should eql(-1)
  end
  
  it "bigger RC" do
    Versioncmp.compare("1.1.rc3", "1.1.rc2").should eql(1)
  end
  
  it "bigger RC than 1.0" do
    Versioncmp.compare("1.1.RC1", "1.0").should eql(1)
  end
  
  it "bigger RC than 1.0" do
    Versioncmp.compare("1.1.RC1", "1.1").should eql(-1)
  end

end