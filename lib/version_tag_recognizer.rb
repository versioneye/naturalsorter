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
  A_STABILITY_PREVIEW = "preview"


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

  def self.value_for_key( value )
    return 0  if A_STABILITY_DEV.eql? value
    return 2  if A_STABILITY_SNAPSHOT.eql? value
    return 3  if A_STABILITY_ALPHA.eql? value
    return 4  if A_STABILITY_BETA.eql? value
    return 5  if A_STABILITY_RC.eql? value
    return 6  if A_STABILITY_PRE.eql? value
    return 10 if A_STABILITY_STABLE.eql? value
    return 11 if A_STABILITY_PATCH.eql? value
    return 1
  end

  def self.compare_tags( a, b)
    a_val = self.value_for a
    b_val = self.value_for b
    return -1 if a_val < b_val
    return  1 if a_val > b_val
    return  0
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
    val.gsub!(/@.*$/, "") if val.to_s.match(/@.*$/)
  end


  def self.does_it_fit_stability?( version_number, stability )
    patch = self.patch?( version_number )
    return true if (stability.casecmp( A_STABILITY_PATCH ) == 0) && patch

    stable = self.stable?( version_number )
    return true if (stability.casecmp( A_STABILITY_STABLE ) == 0) && stable

    pre = stable || self.pre?( version_number )
    return true if (stability.casecmp( A_STABILITY_PRE ) == 0) && pre

    rc = stable || self.rc?( version_number )
    return true if (stability.casecmp( A_STABILITY_RC ) == 0) && rc

    beta = rc || self.beta?( version_number )
    return true if (stability.casecmp( A_STABILITY_BETA ) == 0) && beta

    alpha = beta || self.alpha?( version_number )
    return true if (stability.casecmp( A_STABILITY_ALPHA ) == 0) && alpha

    snapshot = alpha || self.pre?( version_number ) || self.snapshot?( version_number )
    return true if (stability.casecmp( A_STABILITY_SNAPSHOT ) == 0) && snapshot
    return true if (stability.casecmp( A_STABILITY_DEV )      == 0)
    
    return false
  end


  def self.stability_tag_for( version )
    if version.to_s.match(/@.*$/)
      spliti = version.split("@")
      return spliti[1]
    else
      return A_STABILITY_DEV if version.to_s.match(/\Adev-/i) || version.to_s.match(/-dev\z/i)

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
    return true if value.to_s.empty?
    return false if value.to_s.match(/\Adev-/i) || value.to_s.match(/-dev\z/i)
    return false if self.preview?( value )

    return true if value.to_s.match(/.+RELEASE.*/i)
    return true if value.to_s.match(/.+FINAL.*/i)
    return true if value.to_s.match(/.+SP.*/i)
    return true if value.to_s.match(/.+GA.*/i)
    return true if value.to_s.match(/.*patch.*/i)

    !self.alpha?(value)    and !self.beta?(value)       and
    !self.dev?(value)      and !self.pre?(value)        and
    !self.rc?(value)       and !value.to_s.match(/.+SEC.*/i) and
    !self.snapshot?(value) and !value.to_s.match(/.+M.+/i)   and
    !self.build?(value)
  end

  def self.patch? value
    value.to_s.match(/.*patch.*/i)
  end

  def self.alpha? value
    return false if self.beta? value
    value.to_s.match(/.*alpha.*/i) or value.to_s.match(/.+a.*/i)
  end

  def self.beta? value
    value.to_s.match(/.*beta.*/i) or value.to_s.match(/.+b.*/i)
  end

  def self.dev? value
    value.to_s.match(/.*dev.*/i)
  end

  def self.rc? value
    value.to_s.match(/.*rc.*/i) || value.to_s.match(/.*cr.*/i)
  end

  def self.snapshot? value
    value.to_s.match(/.+SNAPSHOT.*/i)
  end

  def self.build? value
    value.to_s.match(/.+build.*/i)
  end

  def self.pre? value
    value.to_s.match(/.*pre.*$/i)
  end

  def self.jbossorg? value
    value.to_s.match(/.*jbossorg.*$/i)
  end

  def self.preview? value
    value.to_s.match(/-preview\d+-/i) || value.to_s.match(/-preview-/i)
  end

end
