require 'spec_helper'
require "naturalsorter"

describe Versioncmp do

  it "smaler" do
    expect( Versioncmp.compare("1.1", "1.2")).to eql(-1)
  end

  it "smaler" do
    expect( Versioncmp.compare("1.1.5", "1.1.x-dev")).to eql(-1)
  end

  it "smaler" do
    expect( Versioncmp.compare("1.1.5", "1.1-dev")).to eql(-1)
  end

  it "smaler" do
    expect( Versioncmp.compare("0.3", "0.7-groovy-2.0")).to eql(-1)
  end

  it "smaler" do
    expect( Versioncmp.compare("0.6-groovy-1.8-rc1", "0.6-groovy-1.8")).to eql(-1)
  end

  it "smaler" do
    expect( Versioncmp.compare("0.5.25", "0.5.20170404")).to eql(-1)
  end

  it "bigger" do
    expect( Versioncmp.compare("0.6-groovy-1.7", "0.6-groovy-1.7-rc1")).to eql(1)
  end

  it "bigger" do
    expect( Versioncmp.compare("5.0.1", "5.0.1-BETA")).to eql(1)
  end

  it "bigger" do
    expect( Versioncmp.compare("5.0.1", "5.0.1-SNAPSHOT")).to eql(1)
  end

  it "bigger" do
    expect( Versioncmp.compare("5.0.1", "5.0.1-beta")).to eql(1)
  end

  it "bigger" do
    expect( Versioncmp.compare("5.0.1", "5.0.1-alpha")).to eql(1)
  end

  it "bigger" do
    expect( Versioncmp.compare("5.0.1", "5.0.1-RC1")).to eql(1)
  end

  it "bigger" do
    expect( Versioncmp.compare("5.0.1", "5.0.1-RC-1")).to eql(1)
  end

  it "bigger" do
    expect( Versioncmp.compare("5.0.1", "5.0.1-alpha-1")).to eql(1)
  end

  it "bigger" do
    expect( Versioncmp.compare("3.10-beta2", "3.9")).to eql(1)
  end

  it "bigger" do
    expect( Versioncmp.compare("3.10-beta2", "3.10-beta1")).to eql(1)
  end

  it "bigger" do
    expect( Versioncmp.compare("3.0.2-FINAL", "3.0.1-FINAL")).to eql(1)
  end

  it "bigger" do
    expect( Versioncmp.compare("1.1", "1.0")).to eql(1)
  end

  it "bigger" do
    expect( Versioncmp.compare("2.5", "2.0-beta-1")).to eql(1)
  end

  it "bigger" do
    expect( Versioncmp.compare("2.3", "2.0-beta-1")).to eql(1)
  end

  it "bigger" do
    expect( Versioncmp.compare("0.5.20170404", "0.5.25")).to eql(1)
  end

  it "1.1.1 is bigger than 1.1" do
    expect( Versioncmp.compare("1.1.1", "1.1")).to eql(1)
  end

  it "dev-master is bigger than 10.10.999" do
    expect( Versioncmp.compare("dev-master", "10.10.999")).to eql(1)
  end

  it "2.2.x-dev is bigger than 2.2.1" do
    expect( Versioncmp.compare("2.2.x-dev", "2.2.1")).to eql(1)
  end

  it "3.5.5-1 is bigger than 3.5.5" do
    expect( Versioncmp.compare("3.5.5-1", "3.5.5")).to eql(1)
  end

  it "3.5.5 is smaller than 3.5.5-1 " do
    expect( Versioncmp.compare("3.5.5", "3.5.5-1")).to eql(-1)
  end

  it "2.3.1-b01 is bigger than 2.3.1" do
    expect( Versioncmp.compare("2.3.1-b01", "2.3.1")).to eql(1)
  end

  it "2.3.2-b01 is bigger than 2.3.1" do
    expect( Versioncmp.compare("2.3.2-b01", "2.3.1")).to eql(1)
  end

  it "2.3.d-b01 is smaller than 2.3.1" do
    expect( Versioncmp.compare("2.3.d-b01", "2.3.1")).to eql(-1)
  end


  it "2.18.1 is bigger than 2.18-20141019" do
    expect( Versioncmp.compare("2.18.1", "2.18-20141019")).to eql(1)
  end

  it "2.18-20141019 is smaller than 2.18.1" do
    expect( Versioncmp.compare("2.18-20141019", "2.18.1")).to eql(-1)
  end


  it "1.1 is smaller than 1.1.1" do
    expect( Versioncmp.compare("1.1", "1.1.1")).to eql(-1)
  end

  it "equal" do
    expect( Versioncmp.compare("1.1", "1.1")).to eql(0)
  end

  it "equal" do
    expect( Versioncmp.compare("1.0", "1.0.0")).to eql(0)
  end

  it "equal" do
    expect( Versioncmp.compare("3.3.1.Final", "3.3.1.Final-redhat-1")).to eql(0)
  end

  it "equal" do
    expect( Versioncmp.compare("3.3.1.Final", "3.3.1.Final-RedHat-33")).to eql(0)
  end

  it "1.0.0 is smaller than 1.0.*" do
    expect( Versioncmp.compare("1.0.0", "1.0.*")).to eql(-1)
  end

  it "1.0 is smaller than 1.0.*" do
    expect( Versioncmp.compare("1.0.0", "1.0.*")).to eql(-1)
  end

  it "equal RC" do
    expect( Versioncmp.compare("1.1.RC1", "1.1.RC1")).to eql(0)
  end

  it "smaller RC" do
    expect( Versioncmp.compare("1.1.RC1", "1.1")).to eql(-1)
  end

  it "smaller RC" do
    expect( Versioncmp.compare("1.1.rc1", "1.1")).to eql(-1)
  end

  it "smaller RC" do
    expect( Versioncmp.compare("1.1.rc1", "2.0")).to eql(-1)
  end

  it "smaller RC" do
    expect( Versioncmp.compare("1.1-rc1", "1.1")).to eql(-1)
  end

  it "smaller alpha" do
    expect( Versioncmp.compare("1.1-alpha1", "1.1")).to eql(-1)
  end

  it "alpha is smaller than BETA" do
    expect( Versioncmp.compare("2.1.0alpha", "2.1.0-BETA1")).to eql(-1)
  end

  it "smaller alpha-1" do
    expect( Versioncmp.compare("1.1-alpha-1", "1.1")).to eql(-1)
  end

  it "smaller alpha" do
    expect( Versioncmp.compare("1.1", "1.1-alpha-1")).to eql(1)
  end

  it "smaller beta" do
    expect( Versioncmp.compare("3.1-beta1", "3.1")).to eql(-1)
  end

  it "smaller beta" do
    expect( Versioncmp.compare("3.1-beta-1", "3.1")).to eql(-1)
  end

  it "smaller 3.0-rc4-negotiate" do
    expect( Versioncmp.compare("3.0-rc4-negotiate", "3.0")).to eql(-1)
  end

  it "smaller 3.1-jbossorg-1" do
    expect( Versioncmp.compare("3.1-jbossorg-1", "3.1")).to eql(-1)
  end

  it "smaller 3.1-pre1" do
    expect( Versioncmp.compare("3.1-pre1", "3.1")).to eql(-1)
  end

  it "bigger RC" do
    expect( Versioncmp.compare("1.1.rc3", "1.1.rc2")).to eql(1)
  end

  it "bigger RC than 1.0" do
    expect( Versioncmp.compare("1.1.RC1", "1.0")).to eql(1)
  end

  it "bigger RC than 1.0" do
    expect( Versioncmp.compare("1.1.RC1", "1.1")).to eql(-1)
  end

  it "20040121.140929 is smaller than 1.1" do
    expect( Versioncmp.compare("20040121.140929", "1.1")).to eql(-1)
  end

  it "1.1 is bigger than 20040121.140929" do
    expect( Versioncmp.compare("1.1", "20040121.140929")).to eql(1)
  end

  it "1.7b2 is smaller than 1.7" do
    expect( Versioncmp.compare("1.7b2", "1.7")).to eql(-1)
  end

  it "1.7 is bigger than 1.7b2" do
    expect( Versioncmp.compare("1.7", "1.7b2")).to eql(1)
  end

  it "1.7 is bigger than 1.7rc2" do
    expect( Versioncmp.compare("1.7", "1.7rc2")).to eql(1)
  end

  it "1.7 is bigger than 1.7RC2" do
    expect( Versioncmp.compare("1.7", "1.7RC2")).to eql(1)
  end

  it "1.7 is bigger than 1.7a" do
    expect( Versioncmp.compare("1.7", "1.7a")).to eql(1)
  end

  it "1.7 is bigger than 1.7b" do
    expect( Versioncmp.compare("1.7", "1.7b")).to eql(1)
  end

  it "1.7b is bigger than 1.7a" do
    expect( Versioncmp.compare("1.7b", "1.7a")).to eql(1)
  end

  it "1.7.1rc1 is smaller than 1.7.2" do
    expect( Versioncmp.compare("1.7.1rc1", "1.7.2")).to eql(-1)
  end

  it "1.7.2 is bigger than 1.7.1rc1" do
    expect( Versioncmp.compare("1.7.2", "1.7.1rc1")).to eql(1)
  end

  it "99.0-does-not-exist is smaller than 1.7.1" do
    expect( Versioncmp.compare("99.0-does-not-exist", "1.7.1")).to eql(-1)
  end

  it "2.2.1-b03 is bigger then 2.2" do
    expect( Versioncmp.compare("2.2.1-b03", "2.2")).to eql(1)
  end

  it "3.0.0 is equal to 3.0" do
    expect( Versioncmp.compare("3.0.0", "3.0")).to eql(0)
  end

  it "3.0 is equal to 3.0.0" do
    expect( Versioncmp.compare("3.0", "3.0.0")).to eql(0)
  end

  it "3.1-SNAPSHOT is equal to 3.1-SNAPSHOT" do
    expect( Versioncmp.compare("3.1-SNAPSHOT", "3.1-SNAPSHOT")).to eql(0)
  end

  it "3.1-SNAPSHOT is smaller than 3.2-SNAPSHOT" do
    expect( Versioncmp.compare("3.1-SNAPSHOT", "3.2-SNAPSHOT")).to eql(-1)
  end

  it "3.1 is smaller than 3.2-SNAPSHOT" do
    expect( Versioncmp.compare("3.1", "3.2-SNAPSHOT")).to eql(-1)
  end

  it "1.5.2 is smaller than 1.5.2-patch1" do
    expect( Versioncmp.compare("1.5.2", "1.5.2-patch1")).to eql(-1)
  end

  it "dev-master is bigger than 1.0.0" do
    expect( Versioncmp.compare("dev-master", "1.0.0")).to eql(1)
  end

  it "dev-master is bigger than dev-support_old" do
    expect( Versioncmp.compare("dev-master", "dev-support_old")).to eql(1)
  end

  it "dev-develop is bigger than 1.0.0" do
    expect( Versioncmp.compare("dev-develop", "1.0.0")).to eql(1)
  end

  it "dev-something is bigger than 1.0.0" do
    expect( Versioncmp.compare("dev-something", "1.0.0")).to eql(1)
  end

  it "3.21.0-GA is bigger than 3.22.0-CR1" do
    expect( Versioncmp.compare("3.21.0-GA", "3.21.0-CR1")).to eql(1)
  end

end
