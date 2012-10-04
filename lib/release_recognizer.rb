class ReleaseRecognizer

  def self.release?(value)
    if value.match(/.+RELEASE.*/i) or value.match(/.+BUILD.*/i) or 
      value.match(/.+FINAL.*/i) or value.match(/.+SP.*/i) or
      value.match(/.+GA.*/i) 
      return true 
    end
    !value.match(/.*alpha.*/i) and !value.match(/.*beta.*/i) and 
    !value.match(/.+a.*/i) and !value.match(/.+b.*/i) and 
    !value.match(/.*dev.*/i) and !value.match(/.*pre.*/i) and
    !value.match(/.*rc.*/i) and !value.match(/.+SEC.*/i) and 
    !value.match(/.+SNAPSHOT.*/i)
  end

end