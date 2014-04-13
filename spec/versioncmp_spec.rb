require "naturalsorter"

describe Versioncmp do

  it "smaler" do
    Versioncmp.compare("1.1", "1.2").should eql(-1)
  end

  it "smaler" do
    Versioncmp.compare("1.1.5", "1.1.x-dev").should eql(-1)
  end

  it "smaler" do
    Versioncmp.compare("1.1.5", "1.1-dev").should eql(-1)
  end

  it "bigger" do
    Versioncmp.compare("1.1", "1.0").should eql(1)
  end

  it "1.1.1 is bigger than 1.1" do
    Versioncmp.compare("1.1.1", "1.1").should eql(1)
  end

  it "dev-master is bigger than 10.10.999" do
    Versioncmp.compare("dev-master", "10.10.999").should eql(1)
  end

  it "2.2.x-dev is bigger than 2.2.1" do
    Versioncmp.compare("2.2.x-dev", "2.2.1").should eql(1)
  end

  it "1.1 is smaller than 1.1.1" do
    Versioncmp.compare("1.1", "1.1.1").should eql(-1)
  end

  it "equal" do
    Versioncmp.compare("1.1", "1.1").should eql(0)
  end

  it "equal" do
    Versioncmp.compare("1.0", "1.0.0").should eql(0)
  end

  it "1.0.0 is smaller than 1.0.*" do
    Versioncmp.compare("1.0.0", "1.0.*").should eql(-1)
  end

  it "1.0 is smaller than 1.0.*" do
    Versioncmp.compare("1.0.0", "1.0.*").should eql(-1)
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

  it "smaller RC" do
    Versioncmp.compare("1.1.rc1", "2.0").should eql(-1)
  end

  it "smaller RC" do
    Versioncmp.compare("1.1-rc1", "1.1").should eql(-1)
  end

  it "smaller alpha" do
    Versioncmp.compare("1.1-alpha1", "1.1").should eql(-1)
  end

  it "alpha is smaller than BETA" do
    Versioncmp.compare("2.1.0alpha", "2.1.0-BETA1").should eql(-1)
  end

  it "smaller alpha-1" do
    Versioncmp.compare("1.1-alpha-1", "1.1").should eql(-1)
  end

  it "smaller alpha" do
    Versioncmp.compare("1.1", "1.1-alpha-1").should eql(1)
  end

  it "smaller beta" do
    Versioncmp.compare("3.1-beta1", "3.1").should eql(-1)
  end

  it "smaller beta" do
    Versioncmp.compare("3.1-beta-1", "3.1").should eql(-1)
  end

  it "smaller 3.0-rc4-negotiate" do
    Versioncmp.compare("3.0-rc4-negotiate", "3.0").should eql(-1)
  end

  it "smaller 3.1-jbossorg-1" do
    Versioncmp.compare("3.1-jbossorg-1", "3.1").should eql(-1)
  end

  it "smaller 3.1-pre1" do
    Versioncmp.compare("3.1-pre1", "3.1").should eql(-1)
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

  it "20040121.140929 is smaller than 1.1" do
    Versioncmp.compare("20040121.140929", "1.1").should eql(-1)
  end

  it "1.1 is bigger than 20040121.140929" do
    Versioncmp.compare("1.1", "20040121.140929").should eql(1)
  end

  it "1.7b2 is smaller than 1.7" do
    Versioncmp.compare("1.7b2", "1.7").should eql(-1)
  end

  it "1.7 is bigger than 1.7b2" do
    Versioncmp.compare("1.7", "1.7b2").should eql(1)
  end

  it "1.7 is bigger than 1.7rc2" do
    Versioncmp.compare("1.7", "1.7rc2").should eql(1)
  end

  it "1.7 is bigger than 1.7RC2" do
    Versioncmp.compare("1.7", "1.7RC2").should eql(1)
  end

  it "1.7 is bigger than 1.7a" do
    Versioncmp.compare("1.7", "1.7a").should eql(1)
  end

  it "1.7 is bigger than 1.7b" do
    Versioncmp.compare("1.7", "1.7b").should eql(1)
  end

  it "1.7b is bigger than 1.7a" do
    Versioncmp.compare("1.7", "1.7b").should eql(1)
  end

  it "1.7.1rc1 is smaller than 1.7.2" do
    Versioncmp.compare("1.7.1rc1", "1.7.2").should eql(-1)
  end

  it "1.7.2 is bigger than 1.7.1rc1" do
    Versioncmp.compare("1.7.2", "1.7.1rc1").should eql(1)
  end

  it "99.0-does-not-exist is smaller than 1.7.1" do
    Versioncmp.compare("99.0-does-not-exist", "1.7.1").should eql(-1)
  end

  it "2.2.1-b03 is bigger then 2.2" do
    Versioncmp.compare("2.2.1-b03", "2.2").should eql(1)
  end

  it "3.0.0 is equal to 3.0" do
    Versioncmp.compare("3.0.0", "3.0").should eql(0)
  end

  it "3.0 is equal to 3.0.0" do
    Versioncmp.compare("3.0", "3.0.0").should eql(0)
  end

end
