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



  it "is alpha? is true" do
    ReleaseRecognizer.alpha?("2.0.alpha").should be_true
  end

  it "is alpha? is true" do
    ReleaseRecognizer.alpha?("2.1.0alpha").should be_true
  end

  it "is alpha? is false" do
    ReleaseRecognizer.alpha?("2.0.1").should be_false
  end

  it "is alpha? is false" do
    ReleaseRecognizer.alpha?("2.1.0-BETA1").should be_false
  end

  it "is scoped? is true" do
    ReleaseRecognizer.scoped?("2.1.0alpha").should be_true
  end

  it "remove_scope is right" do
    ReleaseRecognizer.remove_scope("2.1.0alpha").should eql("2.1")
  end



  it "is beta? is true" do
    ReleaseRecognizer.beta?("2.0.beta").should be_true
  end

  it "is beta? is true" do
    ReleaseRecognizer.beta?("2.1.0beta").should be_true
  end

  it "is beta? is false" do
    ReleaseRecognizer.beta?("2.0.1").should be_false
  end

  it "is beta? is true" do
    ReleaseRecognizer.beta?("2.2.0-BETA2").should be_true
  end

  it "is beta? is true" do
    ReleaseRecognizer.beta?("2.1.0-BETA1").should be_true
  end

  it "is scoped? is true" do
    ReleaseRecognizer.scoped?("2.1.0-BETA1").should be_true
  end

  it "remove_scope is right" do
    ReleaseRecognizer.remove_scope("2.1.0-BETA1").should eql("2.1")
  end
  


  it "is dev? is true" do
    ReleaseRecognizer.dev?("dev-master").should be_true
  end

  it "is dev? is true" do
    ReleaseRecognizer.dev?("dev-progress-helper").should be_true
  end

  it "is dev? is true" do
    ReleaseRecognizer.dev?("dev-deprecated").should be_true
  end

  it "is dev? is true" do
    ReleaseRecognizer.dev?("2.2.x-dev").should be_true
  end

  it "is dev? is false" do
    ReleaseRecognizer.dev?("2.0.1").should be_false
  end



  it "is rc? is true" do
    ReleaseRecognizer.rc?("2.0.rc").should be_true
  end

  it "is rc? is true" do
    ReleaseRecognizer.rc?("2.1.0rc").should be_true
  end

  it "is rc? is true" do
    ReleaseRecognizer.rc?("2.2.0-RC3").should be_true
  end

  it "is rc? is false" do
    ReleaseRecognizer.rc?("2.0.1").should be_false
  end



  it "is snapshot? is true" do
    ReleaseRecognizer.snapshot?("2.0.snapshot").should be_true
  end

  it "is snapshot? is true" do
    ReleaseRecognizer.snapshot?("2.1.0snapshot").should be_true
  end

  it "is snapshot? is true" do
    ReleaseRecognizer.snapshot?("2.2.0-snapshot3").should be_true
  end

  it "is snapshot? is false" do
    ReleaseRecognizer.snapshot?("2.0.1").should be_false
  end


end