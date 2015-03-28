class VersionTagRecognizer

  A_STABILITY_STABLE = "stable"
  A_STABILITY_PRE = "pre"
  A_STABILITY_RC = "RC"
  A_STABILITY_BETA = "beta"
  A_STABILITY_ALPHA = "alpha"
  A_STABILITY_SNAPSHOT = "SNAPSHOT"
  A_STABILITY_DEV = "dev"
  A_STABILITY_BUILD = "BUILD"
  A_STABILITY_PATCH = "patch"


  def self.value_for( value )
    return 0  if self.dev? value
    return 2  if self.snapshot? value
    return 3  if self.alpha? value
    return 4  if self.beta? value
    return 5  if self.rc? value
    return 6  if self.pre? value
    return 10 if self.stable? value
    return 11 if self.patch? value
    return 1
  end

  def self.compare_tags( a, b)
    a_val = self.value_for a
    b_val = self.value_for b
    return -1 if a_val < b_val
    return  1 if a_val > b_val
    return 0
  end

  def self.tagged? value
    return true if self.patch?(value)
    return true if self.alpha?(value)
    return true if self.beta?(value)
    return true if self.dev?(value)
    return true if self.rc?(value)
    return true if self.snapshot?(value)
    return true if self.pre?(value)
    return true if self.jbossorg?(value)
    return false
  end

  def self.remove_tag value
    if self.patch? value
      return value.gsub(/\.patch.*$/i, "")
    elsif self.alpha? value
      new_value = value.gsub(/\.[\w-]*alpha.*$/i, "")
      return new_value.gsub(/\.[\w-]*a.*$/i, "")
    elsif self.beta? value
      new_value = value.gsub(/\.[\w-]*beta.*$/i, "")
      return new_value.gsub(/\.[\w-]*b.*$/i, "")
    elsif self.rc? value
      return value.gsub(/\.[\w-]*rc.*$/i, "")
    elsif self.pre? value
      return value.gsub(/\.[\w-]*pre.*$/i, "")
    elsif self.jbossorg? value
      return value.gsub(/\.jbossorg.*$/i, "")
    elsif self.snapshot? value
      return value.gsub(/\.snapshot.*$/i, "")
    end
    return value
  end

  def self.remove_minimum_stability val
    val.gsub!(/@.*$/, "") if val.match(/@.*$/)
  end

  def self.does_it_fit_stability?( version_number, stability )
    patch    = self.patch?( version_number )
    stable   = self.stable?( version_number )
    pre      = stable || self.pre?( version_number )
    rc       = stable || self.rc?( version_number )
    beta     = rc     || self.beta?( version_number )
    alpha    = beta   || self.alpha?( version_number )
    snapshot = alpha  || self.pre?( version_number ) || self.snapshot?( version_number )

    return true if (stability.casecmp( A_STABILITY_PATCH )    == 0) && patch
    return true if (stability.casecmp( A_STABILITY_STABLE )   == 0) && stable
    return true if (stability.casecmp( A_STABILITY_PRE )      == 0) && pre
    return true if (stability.casecmp( A_STABILITY_RC )       == 0) && rc
    return true if (stability.casecmp( A_STABILITY_BETA )     == 0) && beta
    return true if (stability.casecmp( A_STABILITY_ALPHA )    == 0) && alpha
    return true if (stability.casecmp( A_STABILITY_SNAPSHOT ) == 0) && snapshot
    return true if (stability.casecmp( A_STABILITY_DEV )      == 0)
    return false
  end

  def self.stability_tag_for( version )
    if version.match(/@.*$/)
      spliti = version.split("@")
      return spliti[1]
    else
      if self.stable? version
        return A_STABILITY_STABLE
      elsif self.patch? version 
        return A_STABILITY_PATCH
      elsif self.pre? version
        return A_STABILITY_PRE
      elsif self.rc? version
        return A_STABILITY_RC
      elsif self.beta? version
        return A_STABILITY_BETA
      elsif self.alpha? version
        return A_STABILITY_ALPHA
      elsif self.snapshot? version
        return A_STABILITY_SNAPSHOT
      else
        return A_STABILITY_DEV
      end
    end
  end

  def self.release? value
    self.stable? value
  end

  def self.stable? value
    return true if value.match(/.+RELEASE.*/i)
    return true if value.match(/.+FINAL.*/i)
    return true if value.match(/.+SP.*/i)
    return true if value.match(/.+GA.*/i)
    return true if value.match(/.*patch.*/i)

    !self.alpha?(value)    and !self.beta?(value)       and
    !self.dev?(value)      and !self.pre?(value)        and
    !self.rc?(value)       and !value.match(/.+SEC.*/i) and
    !self.snapshot?(value) and !value.match(/.+M.+/i)   and
    !self.build?(value)
  end

  def self.patch? value
    value.match(/.*patch.*/i)
  end

  def self.alpha? value
    return false if self.beta? value
    value.match(/.*alpha.*/i) or value.match(/.+a.*/i)
  end

  def self.beta? value
    value.match(/.*beta.*/i) or value.match(/.+b.*/i)
  end

  def self.dev? value
    value.match(/.*dev.*/i)
  end

  def self.rc? value
    value.match(/.*rc.*/i)
  end

  def self.snapshot? value
    value.match(/.+SNAPSHOT.*/i)
  end

  def self.build? value
    value.match(/.+build.*/i)
  end

  def self.pre? value
    value.match(/.*pre.*$/i)
  end

  def self.jbossorg? value
    value.match(/.*jbossorg.*$/i)
  end

end
