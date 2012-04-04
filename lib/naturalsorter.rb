require "naturalsorter/version"
require "natcmp"
require "versioncmp"

# naturalsorter.rb
#
# Natural order sorting for an array of strings or more advanced objects
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

module Naturalsorter
  
  class Sorter
  
    # 'Natural order' sort for an simple string array
    def self.sort(array, caseinsesitive)
      if (array.nil? || array.empty?)
        return nil
      end
      array.sort { |a,b| Natcmp.natcmp(a,b,caseinsesitive) }
    end
    
    def self.sort_desc(array, caseinsesitive)
      if (array.nil? || array.empty?)
        return nil
      end
      array.sort { |a, b| Natcmp.natcmp(a,b,caseinsesitive) }
    end
    
    def self.sort_version(array, direction)
      return nil if (array.nil? || array.empty?)
      if direction.eql? "asc"
        array.sort { |a,b| Versioncmp.compare( a, b ) }
      else
        array.sort { |a,b| Versioncmp.compare( b, a ) }
      end
    end
    
    # 'Natural order' sort for an array of objects. 
    def self.sort_by_method(array, method, caseinsesitive)
      if (array.nil? || array.empty?)
        return nil
      end
      array.sort { |a,b| Natcmp.natcmp(a.send(method),b.send(method),caseinsesitive) }
    end
    
    def self.sort_version_by_method(array, method, direction)
      return nil if (array.nil? || array.empty?)
      if direction.eql? "asc"
        array.sort { |a,b| Versioncmp.compare(a.send(method), b.send(method)) }
      else
        array.sort { |a,b| Versioncmp.compare(b.send(method), a.send(method)) }
      end
    end
    
    def self.sort_desc_by_method(array, method, caseinsesitive)
      if (array.nil? || array.empty?)
        return nil
      end
      array.sort { |a, b| Natcmp.natcmp(a.send(method),b.send(method),caseinsesitive) }
    end
  
  end
  
end