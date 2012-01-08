require "naturalsorter/version"
require "natcmp"

module Naturalsorter
  
  class Sorter
  
    def self.sort(array, caseinsesitive)
      if (array.nil? || array.empty?)
        return nil
      end
      array.sort { |a,b| Natcmp.natcmp(a,b,caseinsesitive) }
    end
    
    def self.sort_by_method(array, method, caseinsesitive)
      if (array.nil? || array.empty?)
        return nil
      end
      array.sort { |a,b| Natcmp.natcmp(a.send(method),b.send(method),caseinsesitive) }
    end
  
  end
  
end