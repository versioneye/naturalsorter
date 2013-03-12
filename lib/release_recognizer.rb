class ReleaseRecognizer

  def self.release? value
    self.stable? value 
  end

  def self.stable? value
    if value.match(/.+RELEASE.*/i) or value.match(/.+BUILD.*/i) or 
      value.match(/.+FINAL.*/i) or value.match(/.+SP.*/i) or
      value.match(/.+GA.*/i) 
      return true 
    end
    !self.alpha?(value) and !self.beta?(value) and 
    !self.dev?(value) and !value.match(/.*pre.*/i) and
    !self.rc?(value) and !value.match(/.+SEC.*/i) and 
    !self.snapshot?(value) and !value.match(/.+M.+/i)
  end

  def self.alpha? value 
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

end
