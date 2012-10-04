require "naturalsorter"

describe ReleaseRecognizer do
  
  it "release? is true" do
    ReleaseRecognizer.release?("1.1").should be_true
  end

  it "release? is true" do
    ReleaseRecognizer.release?("1.0.0").should be_true
  end

  it "release? is true" do
    ReleaseRecognizer.release?("1").should be_true
  end

  it "release? is true" do
    ReleaseRecognizer.release?("3.3.2.GA").should be_true
  end

  it "release? is true" do
    ReleaseRecognizer.release?("4.1.5.SP1").should be_true
  end

  it "release? is true" do
    ReleaseRecognizer.release?("3.1.0.RELEASE").should be_true
  end

  it "release? is true" do
    ReleaseRecognizer.release?("3.2.0.BUILD").should be_true
  end

  it "release? is true" do
    ReleaseRecognizer.release?("3.2.0buiLd").should be_true
  end

  it "release? is true" do
    ReleaseRecognizer.release?("3.2.0.Final").should be_true
  end

  it "release? is true" do
    ReleaseRecognizer.release?("3.2.0FINAL").should be_true
  end

  it "release? is false" do
    ReleaseRecognizer.release?("1.1.pre").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("2.5.6.SEC03").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("2.3.8.pre1").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("2.3.9.pre").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("3.0.0.beta4").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("3.0.0.BETA4").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("3.0.0.beta").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("3.0.0.rc").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("3.0.0.rc2").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("3.0.0.RC2").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("2.0.x-dev").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("2.0.x-DEV").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("1.8b1").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("1.8B1").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("1.1.3a").should be_false
  end  

  it "release? is false" do
    ReleaseRecognizer.release?("1.1.3A").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("1.SNAPSHOT").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("1.snapshot").should be_false
  end

  it "release? is false" do
    ReleaseRecognizer.release?("1.M1").should be_false
  end
  
  it "release? is false" do
    ReleaseRecognizer.release?("2.0-m4").should be_false
  end

end