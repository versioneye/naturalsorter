require "naturalsorter"

describe VersionTagRecognizer do

  it "release? is true" do
    VersionTagRecognizer.release?("1.1").should be_truthy
  end

  it "release? is true" do
    VersionTagRecognizer.release?("1.0.0").should be_truthy
  end

  it "release? is true" do
    VersionTagRecognizer.release?("1").should be_truthy
  end

  it "release? is true" do
    VersionTagRecognizer.release?("3.3.2.GA").should be_truthy
  end

  it "release? is true" do
    VersionTagRecognizer.release?("4.1.5.SP1").should be_truthy
  end

  it "release? is true" do
    VersionTagRecognizer.release?("3.1.0.RELEASE").should be_truthy
  end

  it "release? is true" do
    VersionTagRecognizer.release?("3.2.0.BUILD").should be_falsey
  end

  it "release? is true" do
    VersionTagRecognizer.release?("3.2.0buiLd").should be_falsey
  end

  it "release? is true" do
    VersionTagRecognizer.release?("3.2.0.Final").should be_truthy
  end

  it "release? is true" do
    VersionTagRecognizer.release?("3.2.0FINAL").should be_truthy
  end

  it "release? is false" do
    VersionTagRecognizer.release?("1.1.pre").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("2.5.6.SEC03").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("2.3.8.pre1").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("2.3.9.pre").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("3.0.0.beta4").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("3.0.0.BETA4").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("3.0.0.beta").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("3.0.0.rc").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("3.0.0.rc2").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("3.0.0.RC2").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("2.0.x-dev").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("2.0.x-DEV").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("1.8b1").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("1.8B1").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("1.1.3a").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("1.1.3A").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("1.SNAPSHOT").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("1.snapshot").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("1.M1").should be_falsey
  end

  it "release? is false" do
    VersionTagRecognizer.release?("2.0-m4").should be_falsey
  end



  it "is alpha? is true" do
    VersionTagRecognizer.alpha?("2.0.alpha").should be_truthy
  end

  it "is alpha? is true" do
    VersionTagRecognizer.alpha?("2.1.0alpha").should be_truthy
  end

  it "is alpha? is false" do
    VersionTagRecognizer.alpha?("2.0.1").should be_falsey
  end

  it "is alpha? is false" do
    VersionTagRecognizer.alpha?("2.1.0-BETA1").should be_falsey
  end

  it "is tagged? is true" do
    VersionTagRecognizer.tagged?("2.1.0alpha").should be_truthy
  end



  it "remove_tag is right" do
    VersionTagRecognizer.remove_tag("2.1.0alpha").should eql("2.1")
  end
  it "remove_tag is right" do
    VersionTagRecognizer.remove_tag("2.1.1-BETA").should eql("2.1")
  end
  it "remove_tag is right" do
    VersionTagRecognizer.remove_tag("2.1.1-RC").should eql("2.1")
  end
  it "remove_tag is right" do
    VersionTagRecognizer.remove_tag("2.1.1-PRE").should eql("2.1")
  end



  it "is beta? is true" do
    VersionTagRecognizer.beta?("2.0.beta").should be_truthy
  end

  it "is beta? is true" do
    VersionTagRecognizer.beta?("2.1.0beta").should be_truthy
  end

  it "is beta? is false" do
    VersionTagRecognizer.beta?("2.0.1").should be_falsey
  end

  it "is beta? is true" do
    VersionTagRecognizer.beta?("2.2.0-BETA2").should be_truthy
  end

  it "is beta? is true" do
    VersionTagRecognizer.beta?("2.1.0-BETA1").should be_truthy
  end

  it "is tagged? is true" do
    VersionTagRecognizer.tagged?("2.1.0-BETA1").should be_truthy
  end

  it "remove_tag is right" do
    VersionTagRecognizer.remove_tag("2.1.0-BETA1").should eql("2.1")
  end



  it "is dev? is true" do
    VersionTagRecognizer.dev?("dev-master").should be_truthy
  end

  it "is dev? is true" do
    VersionTagRecognizer.dev?("dev-progress-helper").should be_truthy
  end

  it "is dev? is true" do
    VersionTagRecognizer.dev?("dev-deprecated").should be_truthy
  end

  it "is dev? is true" do
    VersionTagRecognizer.dev?("2.2.x-dev").should be_truthy
  end

  it "is dev? is false" do
    VersionTagRecognizer.dev?("2.0.1").should be_falsey
  end



  it "is rc? is true" do
    VersionTagRecognizer.rc?("2.0.rc").should be_truthy
  end

  it "is rc? is true" do
    VersionTagRecognizer.rc?("2.1.0rc").should be_truthy
  end

  it "is rc? is true" do
    VersionTagRecognizer.rc?("2.2.0-RC3").should be_truthy
  end

  it "is rc? is false" do
    VersionTagRecognizer.rc?("2.0.1").should be_falsey
  end



  it "is snapshot? is true" do
    VersionTagRecognizer.snapshot?("2.0.snapshot").should be_truthy
  end

  it "is snapshot? is true" do
    VersionTagRecognizer.snapshot?("2.1.0snapshot").should be_truthy
  end

  it "is snapshot? is true" do
    VersionTagRecognizer.snapshot?("2.2.0-snapshot3").should be_truthy
  end

  it "is snapshot? is false" do
    VersionTagRecognizer.snapshot?("2.0.1").should be_falsey
  end


  it 'is a build' do
    VersionTagRecognizer.build?("1.3.0-build.2921+sha.02c0ed2").should be_truthy
  end


  it "returns the right value for dev" do
    VersionTagRecognizer.value_for("1.1.1-dev").should eql(0)
  end
  it "returns the right value for snapshot" do
    VersionTagRecognizer.value_for("1.1.1-SNAPSHOT").should eql(2)
  end
  it "returns the right value for alpha" do
    VersionTagRecognizer.value_for("1.1.1-alpha").should eql(3)
  end
  it "returns the right value for beta" do
    VersionTagRecognizer.value_for("1.1.1-beta").should eql(4)
  end
  it "returns the right value for rc" do
    VersionTagRecognizer.value_for("1.1.1-rc").should eql(5)
  end
  it "returns the right value for pre" do
    VersionTagRecognizer.value_for("1.1.1-pre").should eql(6)
  end
  it "returns the right value for stable" do
    VersionTagRecognizer.value_for("1.1.1").should eql(10)
  end



  it "returns compares right for alpha and beta" do
    VersionTagRecognizer.compare_tags("1.1.1-alpha", "1.1.1-beta").should eql(-1)
  end
  it "returns compares right for beta and alpha" do
    VersionTagRecognizer.compare_tags("1.1.1-beta", "1.1.1-alpha").should eql(1)
  end
  it "returns compares right for alpha and alpha" do
    VersionTagRecognizer.compare_tags("1.1.1-alpha", "1.1.1-alpha").should eql(0)
  end
  it "returns compares right for RC and stable" do
    VersionTagRecognizer.compare_tags("1.1.1-RC", "1.1.1").should eql(-1)
  end
  it "returns compares right for stable and dev" do
    VersionTagRecognizer.compare_tags("1.1.1", "1.1.x-dev").should eql(1)
  end



  it "does fit stability" do
    VersionTagRecognizer.does_it_fit_stability?( "2.2.1", "stable" ).should be_truthy
  end
  it "does not fit stability" do
    VersionTagRecognizer.does_it_fit_stability?( "2.2.1-BETA", "stable" ).should be_falsey
  end
  it "does not fit stability" do
    VersionTagRecognizer.does_it_fit_stability?( "1.3.0-build.2921+sha.02c0ed2", "stable" ).should be_falsey
  end
  it "does not fit stability" do
    VersionTagRecognizer.does_it_fit_stability?( "1.3.0-build.2809+sha.94bcc03", "stable" ).should be_falsey
  end
  it "does fit stability" do
    VersionTagRecognizer.does_it_fit_stability?( "2.2.1-BETA", "alpha" ).should be_truthy
  end
  it "does fit stability" do
    VersionTagRecognizer.does_it_fit_stability?( "2.2.1-BETA", "beta" ).should be_truthy
  end
  it "does fit stability" do
    VersionTagRecognizer.does_it_fit_stability?( "2.2.x-dev", "dev" ).should be_truthy
  end
  it "does not fit stability" do
    VersionTagRecognizer.does_it_fit_stability?( "2.2.x-dev", "alpha" ).should be_falsey
  end
  it "does not fit stability" do
    VersionTagRecognizer.does_it_fit_stability?( "2.2.x-dev", "RC" ).should be_falsey
  end
  it "does fit stability" do
    VersionTagRecognizer.does_it_fit_stability?( "2.2.1-RC", "RC" ).should be_truthy
  end



  it "stability_tag_for returns right" do
    VersionTagRecognizer.stability_tag_for( "2.2.1").should eql(VersionTagRecognizer::A_STABILITY_STABLE)
  end
  it "stability_tag_for returns right" do
    VersionTagRecognizer.stability_tag_for( "2.2.1-RC").should eql(VersionTagRecognizer::A_STABILITY_RC)
  end
  it "stability_tag_for returns right" do
    VersionTagRecognizer.stability_tag_for( "2.2.1-BETA1").should eql(VersionTagRecognizer::A_STABILITY_BETA)
  end
  it "stability_tag_for returns right" do
    VersionTagRecognizer.stability_tag_for( "2.2.1-alpha").should eql(VersionTagRecognizer::A_STABILITY_ALPHA)
  end
  it "stability_tag_for returns right" do
    VersionTagRecognizer.stability_tag_for( "2.2.x-dev").should eql(VersionTagRecognizer::A_STABILITY_DEV)
  end




end
