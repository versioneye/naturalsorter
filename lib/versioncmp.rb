# versioncmp.rb
#
# Natural order comparison of two version strings
# e.g. "1.10.beta" < "1.10" > "1.9"
# which does not follow alphabetically
#
#
# This implementation is Copyright (C) 2012 by Robert Reiz
#
# This software is provided 'as-is', without any express or implied
# warranty.  In no event will the authors be held liable for any damages
# arising from the use of this software.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it
# freely, subject to the following restrictions:
#
# 1. The origin of this software must not be misrepresented; you must not
#    claim that you wrote the original software. If you use this software
#    in a product, an acknowledgment in the product documentation would be
#    appreciated but is not required.
# 2. Altered source versions must be plainly marked as such, and must not be
#    misrepresented as being the original software.
# 3. This notice may not be removed or altered from any source distribution.

class Versioncmp

  # 'Natural version order' comparison of two version strings
  def self.compare(a_val, b_val)

    if (!a_val.nil? || a_val.eql?("") ) && b_val.nil?
      return 1
    end

    if (!b_val.nil? || b_val.eql?("")) && a_val.nil?
      return -1
    end  

    # this case should never happen!  
    if a_val.nil? && b_val.nil? 
      return -1
    end

    a = do_x_dev_replacements a_val
    b = do_x_dev_replacements b_val

    replace_leading_v( a )
    replace_leading_v( b )

    offset1 = 0;
    offset2 = 0;

    for i in 0..100
      break if offset1 >= a.length() || offset2 >= b.length() 

      part1 = Versioncmp.get_a_piece_of_the_cake(offset1, a);
      part2 = Versioncmp.get_a_piece_of_the_cake(offset2, b);  
      
      return -1 if Versioncmp.timestamp?(part1) && part2.length() < 8
      return  1 if Versioncmp.timestamp?(part2) && part1.length() < 8
      
      offset1 += part1.length() + 1;
      offset2 += part2.length() + 1;

      if ( part1.match(/^[0-9]+$/) && part2.match(/^[0-9]+$/) )
        ai = part1.to_i;
        bi = part2.to_i;
        result = Versioncmp.compare_int(ai, bi);
        return result if result != 0
        next 
      elsif ( part1.match(/^[0-9]+$/) == nil && part2.match(/^[0-9]+$/) == nil )
        result = Versioncmp.compare_string(part1, part2)
        return result if (result != 0)
        next
      else
        result = Versioncmp.check_jquery_versioning(part1, part2)
        return result if result != nil
        return  1 if (part1.match(/^[0-9]+$/) && part2.match(/^[0-9]+$/) == nil)
        return -1;
      end
    end
    result = Versioncmp.check_for_scopes(a, b) 
    return result
  end
  
  def self.compare_int(ai, bi)
    return -1 if (ai < bi)
    return  0 if (ai == bi)
    return  1
  end
  
  def self.compare_string(a, b)
    return  0 if a.eql? b
    return -1 if a < b
    return  1
  end

  def self.compare_string_length(a, b)    
    return  1 if (a.length() < b.length())
    return -1
  end
  
  # Scopes are alphas, betas, RCs and so on
  #
  def self.check_for_scopes(a, b)
    big = String.new(a)
    small = String.new(b)
    if (a.length() < b.length())
      big = String.new(b)
      small = String.new(a)
    end
    if (ReleaseRecognizer.rc?(big))
      bigwithoutRc = big.gsub(/\.rc.*$/i, "")
      if (Versioncmp.compare_string(bigwithoutRc, small) == 0)
        return Versioncmp.compare_string_length(a, b)
      end
    elsif (ReleaseRecognizer.beta?(big))
      bigwithoutBeta = big.gsub(/\.beta.*$/i, "")
      if (Versioncmp.compare_string(bigwithoutBeta, small) == 0)
        return Versioncmp.compare_string_length(a, b)
      end
    elsif (ReleaseRecognizer.alpha?(big))
      bigwithoutAlpha = big.gsub(/\.alpha.*$/i, "")
      if (Versioncmp.compare_string(bigwithoutAlpha, small) == 0)
        return Versioncmp.compare_string_length(a, b)
      end
    elsif (ReleaseRecognizer.pre?(big))
      bigwithoutPre = big.gsub(/\.pre.*$/i, "")
      if (Versioncmp.compare_string(bigwithoutPre, small) == 0)
        return Versioncmp.compare_string_length(a, b)
      end
    elsif (ReleaseRecognizer.jbossorg?(big))
      bigwithoutRc = big.gsub(/\.jbossorg.*$/i, "")
      if (Versioncmp.compare_string(bigwithoutRc, small) == 0)
        return Versioncmp.compare_string_length(a, b)
      end
    end
    return  1 if a.length > b.length
    return -1 if a.length < b.length
    return  0
  end
  
  def self.get_a_piece_of_the_cake(offset, cake)
    for z in 0..100
      offsetz = offset + z
      break if offsetz > cake.length() 
      p = cake[ offset..offset + z ]
      if ( p.match(/^\w+\.$/) != nil )
        break
      end
    end
    if z > 0
      z = z - 1
    end
    piece = cake[offset..offset + z ]
    return piece
  end
  
  def self.timestamp?(part)
    return part.length() == 8 && part.match(/^[0-9]+$/) != nil
  end

  def self.do_x_dev_replacements val 
    new_val = String.new(val)
    if val.eql?("dev-master")
      new_val = "9999999"
    elsif val.match(/\.x-dev$/)
      new_val = val.gsub("x-dev", "9999999")
    elsif val.match(/-dev$/)
      new_val = val.gsub("-dev", ".9999999")
    end
    new_val
  end

  def self.replace_leading_v val 
    if val.match(/^v[0-9]+/)
      val.gsub!(/^v/, "")  
    end
  end

  def self.check_jquery_versioning(part1, part2)
    # --- START ---- special case for awesome jquery shitty verison numbers 
    if ( part1.match(/^[0-9]+[a-zA-Z]+[0-9]+$/) != nil && part2.match(/^[0-9]+$/) != nil )
      part1_1 = part1.match(/^[0-9]+/)
      result = Versioncmp.compare_int(part1_1[0], part2)
      if result != 0
        return result
      end
      return -1
    end

    if ( part2.match(/^[0-9]+[a-zA-Z]+[0-9]+$/) != nil && part1.match(/^[0-9]+$/) != nil )
      part2_1 = part2.match(/^[0-9]+/)
      result = Versioncmp.compare_int(part1, part2_1[0])
      if result != 0
        return result
      end
      return 1
    end

    return nil
    # --- END ---- special case for awesome jquery shitty verison numbers 
  end

end
