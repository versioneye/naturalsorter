require 'spec_helper'
require "naturalsorter"

describe VersionTagRecognizer do

  it "release? is true" do
    expect( VersionTagRecognizer.release?("1.1")).to be_truthy
  end

  it "release? is true" do
    expect( VersionTagRecognizer.release?("1.0.0")).to be_truthy
  end

  it "release? is true" do
    expect( VersionTagRecognizer.release?("1")).to be_truthy
  end

  it "release? is true" do
    expect( VersionTagRecognizer.release?("3.3.2.GA")).to be_truthy
  end

  it "release? is true" do
    expect( VersionTagRecognizer.release?("4.1.5.SP1")).to be_truthy
  end

  it "release? is true" do
    expect( VersionTagRecognizer.release?("3.1.0.RELEASE")).to be_truthy
  end

  it "release? is true" do
    expect( VersionTagRecognizer.release?("3.2.0.BUILD")).to be_falsey
  end

  it "release? is true" do
    expect( VersionTagRecognizer.release?("3.2.0buiLd")).to be_falsey
  end

  it "release? is true" do
    expect( VersionTagRecognizer.release?("3.2.0.Final")).to be_truthy
  end

  it "release? is true" do
    expect( VersionTagRecognizer.release?("3.2.0FINAL")).to be_truthy
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("1.1.pre")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("2.5.6.SEC03")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("2.3.8.pre1")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("2.3.9.pre")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("3.0.0.beta4")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("3.0.0.BETA4")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("3.0.0.beta")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("3.0.0.rc")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("3.0.0.rc2")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("3.0.0.RC2")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("3.0.0.CR1")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("2.0.x-dev")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("2.0.x-DEV")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("1.8b1")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("1.8B1")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("1.1.3a")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("1.1.3A")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("1.SNAPSHOT")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("1.snapshot")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("1.M1")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("2.0-m4")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("dev-garbage-collection-configuration")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("garbage-collection-configuration-dev")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("2.0.0-preview-final")).to be_falsey
  end

  it "release? is false" do
    expect( VersionTagRecognizer.release?("2.0.0-preview2-final")).to be_falsey
  end



  it "is alpha? is true" do
    expect( VersionTagRecognizer.alpha?("2.0.alpha")).to be_truthy
  end

  it "is alpha? is true" do
    expect( VersionTagRecognizer.alpha?("2.1.0alpha")).to be_truthy
  end

  it "is alpha? is false" do
    expect( VersionTagRecognizer.alpha?("2.0.1")).to be_falsey
  end

  it "is alpha? is false" do
    expect( VersionTagRecognizer.alpha?("2.1.0-BETA1")).to be_falsey
  end

  it "is tagged? is true" do
    expect( VersionTagRecognizer.tagged?("2.1.0alpha")).to be_truthy
  end



  it "remove_tag is right" do
    expect( VersionTagRecognizer.remove_tag("2.1.0alpha")).to eql("2.1")
  end
  it "remove_tag is right" do
    expect( VersionTagRecognizer.remove_tag("2.1.1-BETA")).to eql("2.1")
  end
  it "remove_tag is right" do
    expect( VersionTagRecognizer.remove_tag("2.1.1-RC")).to eql("2.1")
  end
  it "remove_tag is right" do
    expect( VersionTagRecognizer.remove_tag("2.1.1-PRE")).to eql("2.1")
  end



  it "is beta? is true" do
    expect( VersionTagRecognizer.beta?("2.0.beta")).to be_truthy
  end

  it "is beta? is true" do
    expect( VersionTagRecognizer.beta?("2.1.0beta")).to be_truthy
  end

  it "is beta? is false" do
    expect( VersionTagRecognizer.beta?("2.0.1")).to be_falsey
  end

  it "is beta? is true" do
    expect( VersionTagRecognizer.beta?("2.2.0-BETA2")).to be_truthy
  end

  it "is beta? is true" do
    expect( VersionTagRecognizer.beta?("2.1.0-BETA1")).to be_truthy
  end

  it "is tagged? is true" do
    expect( VersionTagRecognizer.tagged?("2.1.0-BETA1")).to be_truthy
  end

  it "remove_tag is right" do
    expect( VersionTagRecognizer.remove_tag("2.1.0-BETA1")).to eql("2.1")
  end



  it "is dev? is true" do
    expect( VersionTagRecognizer.dev?("dev-master")).to be_truthy
  end

  it "is dev? is true" do
    expect( VersionTagRecognizer.dev?("dev-progress-helper")).to be_truthy
  end

  it "is dev? is true" do
    expect( VersionTagRecognizer.dev?("dev-deprecated")).to be_truthy
  end

  it "is dev? is true" do
    expect( VersionTagRecognizer.dev?("2.2.x-dev")).to be_truthy
  end

  it "is dev? is false" do
    expect( VersionTagRecognizer.dev?("2.0.1")).to be_falsey
  end



  it "is rc? is true" do
    expect( VersionTagRecognizer.rc?("2.0.rc")).to be_truthy
  end

  it "is rc? is true" do
    expect( VersionTagRecognizer.rc?("2.1.0rc")).to be_truthy
  end

  it "is rc? is true" do
    expect( VersionTagRecognizer.rc?("2.2.0-RC3")).to be_truthy
  end

  it "is rc? is false" do
    expect( VersionTagRecognizer.rc?("2.0.1")).to be_falsey
  end



  it "is snapshot? is true" do
    expect( VersionTagRecognizer.snapshot?("2.0.snapshot")).to be_truthy
  end

  it "is snapshot? is true" do
    expect( VersionTagRecognizer.snapshot?("2.1.0snapshot")).to be_truthy
  end

  it "is snapshot? is true" do
    expect( VersionTagRecognizer.snapshot?("2.2.0-snapshot3")).to be_truthy
  end

  it "is snapshot? is false" do
    expect( VersionTagRecognizer.snapshot?("2.0.1")).to be_falsey
  end


  it 'is a build' do
    expect( VersionTagRecognizer.build?("1.3.0-build.2921+sha.02c0ed2")).to be_truthy
  end


  it "returns the right value for dev" do
    expect( VersionTagRecognizer.value_for("1.1.1-dev")).to eql(0)
  end
  it "returns the right value for snapshot" do
    expect( VersionTagRecognizer.value_for("1.1.1-SNAPSHOT")).to eql(2)
  end
  it "returns the right value for alpha" do
    expect( VersionTagRecognizer.value_for("1.1.1-alpha")).to eql(3)
  end
  it "returns the right value for beta" do
    expect( VersionTagRecognizer.value_for("1.1.1-beta")).to eql(4)
  end
  it "returns the right value for rc" do
    expect( VersionTagRecognizer.value_for("1.1.1-rc")).to eql(5)
  end
  it "returns the right value for pre" do
    expect( VersionTagRecognizer.value_for("1.1.1-pre")).to eql(6)
  end
  it "returns the right value for stable" do
    expect( VersionTagRecognizer.value_for("1.1.1")).to eql(10)
  end


  it "returns the right value for stable" do
    expect( VersionTagRecognizer.value_for_key(VersionTagRecognizer::A_STABILITY_STABLE)).to eql(10)
  end
  it "returns the right value for patch" do
    expect( VersionTagRecognizer.value_for_key(VersionTagRecognizer::A_STABILITY_PATCH)).to eql(11)
  end
  it "returns the right value for pre" do
    expect( VersionTagRecognizer.value_for_key(VersionTagRecognizer::A_STABILITY_PRE)).to eql(6)
  end
  it "returns the right value for rc" do
    expect( VersionTagRecognizer.value_for_key(VersionTagRecognizer::A_STABILITY_RC)).to eql(5)
  end
  it "returns the right value for beta" do
    expect( VersionTagRecognizer.value_for_key(VersionTagRecognizer::A_STABILITY_BETA)).to eql(4)
  end
  it "returns the right value for alpha" do
    expect( VersionTagRecognizer.value_for_key(VersionTagRecognizer::A_STABILITY_ALPHA)).to eql(3)
  end
  it "returns the right value for snapshot" do
    expect( VersionTagRecognizer.value_for_key(VersionTagRecognizer::A_STABILITY_SNAPSHOT)).to eql(2)
  end
  it "returns the right value for dev" do
    expect( VersionTagRecognizer.value_for_key(VersionTagRecognizer::A_STABILITY_DEV)).to eql(0)
  end


  it "returns compares right for alpha and beta" do
    expect( VersionTagRecognizer.compare_tags("1.1.1-alpha", "1.1.1-beta")).to eql(-1)
  end
  it "returns compares right for beta and alpha" do
    expect( VersionTagRecognizer.compare_tags("1.1.1-beta", "1.1.1-alpha")).to eql(1)
  end
  it "returns compares right for alpha and alpha" do
    expect( VersionTagRecognizer.compare_tags("1.1.1-alpha", "1.1.1-alpha")).to eql(0)
  end
  it "returns compares right for RC and stable" do
    expect( VersionTagRecognizer.compare_tags("1.1.1-RC", "1.1.1")).to eql(-1)
  end
  it "returns compares right for stable and dev" do
    expect( VersionTagRecognizer.compare_tags("1.1.1", "1.1.x-dev")).to eql(1)
  end



  it "does fit stability" do
    expect( VersionTagRecognizer.does_it_fit_stability?( "2.2.1", "stable" )).to be_truthy
  end
  it "does not fit stability" do
    expect( VersionTagRecognizer.does_it_fit_stability?( "2.2.1-BETA", "stable" )).to be_falsey
  end
  it "does not fit stability" do
    expect( VersionTagRecognizer.does_it_fit_stability?( "1.3.0-build.2921+sha.02c0ed2", "stable" )).to be_falsey
  end
  it "does not fit stability" do
    expect( VersionTagRecognizer.does_it_fit_stability?( "1.3.0-build.2809+sha.94bcc03", "stable" )).to be_falsey
  end
  it "does fit stability" do
    expect( VersionTagRecognizer.does_it_fit_stability?( "2.2.1-BETA", "alpha" )).to be_truthy
  end
  it "does fit stability" do
    expect( VersionTagRecognizer.does_it_fit_stability?( "2.2.1-BETA", "beta" )).to be_truthy
  end
  it "does fit stability" do
    expect( VersionTagRecognizer.does_it_fit_stability?( "2.2.1-alpha", "beta" )).to be_falsey
  end
  it "does fit stability" do
    expect( VersionTagRecognizer.does_it_fit_stability?( "2.2.x-dev", "dev" )).to be_truthy
  end
  it "does not fit stability" do
    expect( VersionTagRecognizer.does_it_fit_stability?( "2.2.x-dev", "alpha" )).to be_falsey
  end
  it "does not fit stability" do
    expect( VersionTagRecognizer.does_it_fit_stability?( "2.2.x-dev", "RC" )).to be_falsey
  end
  it "does fit stability" do
    expect( VersionTagRecognizer.does_it_fit_stability?( "2.2.1-RC", "RC" )).to be_truthy
  end



  it "stability_tag_for returns right" do
    expect( VersionTagRecognizer.stability_tag_for( "2.2.1")).to eql(VersionTagRecognizer::A_STABILITY_STABLE)
  end
  it "stability_tag_for returns right" do
    expect( VersionTagRecognizer.stability_tag_for( "2.2.1-RC")).to eql(VersionTagRecognizer::A_STABILITY_RC)
  end
  it "stability_tag_for returns right" do
    expect( VersionTagRecognizer.stability_tag_for( "2.2.1-BETA1")).to eql(VersionTagRecognizer::A_STABILITY_BETA)
  end
  it "stability_tag_for returns right" do
    expect( VersionTagRecognizer.stability_tag_for( "2.2.1-alpha")).to eql(VersionTagRecognizer::A_STABILITY_ALPHA)
  end
  it "stability_tag_for returns right" do
    expect( VersionTagRecognizer.stability_tag_for( "2.2.x-dev")).to eql(VersionTagRecognizer::A_STABILITY_DEV)
  end


  it "stability_tag_for returns false" do
    expect( VersionTagRecognizer.stability_tag_for( "dev-garbage-collection-configuration")).to eql(VersionTagRecognizer::A_STABILITY_DEV)
  end


end
