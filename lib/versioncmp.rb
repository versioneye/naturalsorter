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
  def self.compare(a, b)

	  offset1 = 0;
    offset2 = 0;

    for i in 0..100
      break if offset1 >= a.length() || offset2 >= b.length() 

      part1 = Versioncmp.getAPiece(offset1, a);
      part2 = Versioncmp.getAPiece(offset2, b);  
      
      offset1 += part1.length() + 1;
      offset2 += part2.length() + 1;

      if ( part1.match(/^[0-9]+$/) != nil && part2.match(/^[0-9]+$/) != nil )
        ai = part1.to_i;
        bi = part2.to_i;
        result = Versioncmp.compareInt(ai, bi);
        return result if result != 0
        next 
      elsif ( part1.match(/^[0-9]+$/) == nil && part2.match(/^[0-9]+$/) == nil )
        result = Versioncmp.compareString(part1, part2)
        return result if (result != 0)
        next
      else
        return 1 if (part1.match(/^[0-9]+$/) != nil && part2.match(/^[0-9]+$/) == nil)
        return -1;
      end
	  end
	  result = Versioncmp.checkForRC(a, b) 
	  return result
  end
  
  def self.compareInt(ai, bi)
    return -1 if (ai < bi)
    return 0 if (ai == bi)
    return 1
  end
  
  def self.compareString(a, b)
    return 0 if a.eql? b
    return -1 if a < b
    return 1
  end
  
  def self.checkForRC(a, b)
    big = String.new(a)
    small = String.new(b)
    if (a.length() < b.length())
      big = String.new(b)
      small = String.new(a)
    end
    if (Versioncmp.isRc(big))
      bigwithoutRc = big.gsub(/\.RC[1-9]*$/, "").gsub(/\.rc[1-9]*$/, "")
      if (Versioncmp.compareString(bigwithoutRc, small) == 0)
        return Versioncmp.getRcValue(a, b)
      end
    elsif (Versioncmp.isBeta(big))
      bigwithoutBeta = big.gsub(/\.BETA[1-9]*$/, "").gsub(/\.beta[1-9]*$/, "")
      if (Versioncmp.compareString(bigwithoutBeta, small) == 0)
        return Versioncmp.getRcValue(a, b)
      end
    elsif (Versioncmp.isPre(big))
      bigwithoutPre = big.gsub(/\.PRE[1-9]*$/, "").gsub(/\.pre[1-9]*$/, "")
      if (Versioncmp.compareString(bigwithoutPre, small) == 0)
        return Versioncmp.getRcValue(a, b)
      end
    end
    return 1 if a.length > b.length
    return -1 if a.length < b.length
    return 0
  end
  
  def self.isRc(a)
    return a.match(/.*RC[1-9]*$/) != nil || a.match(/.*rc[1-9]*$/) != nil;
  end
  
  def self.isBeta(a)
    return a.match(/.*BETA[1-9]*$/) != nil || a.match(/.*beta[1-9]*$/) != nil;
  end
  
  def self.isPre(a)
    return a.match(/.*PRE[1-9]*$/) != nil || a.match(/.*pre[1-9]*$/) != nil;
  end
  
  def self.getAPiece(offset, cake)
    for z in 0..100
      offsetz = offset + z
      break if offsetz > cake.length() 
      p = cake[offset..offset + z]
      if ( p.match(/^[0-9]+$/) == nil )
        break
      end
    end
    if z > 0
      z = z - 1
    end
    piece = cake[offset..offset + z ]
    return piece
  end
  
  def self.getRcValue(a, b)    
    return 1 if (a.length() < b.length())
    return -1
  end

end