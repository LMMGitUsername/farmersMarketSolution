class Register
    attr_accessor :itemsInOrderOfScan
    attr_accessor :itemPriceInOrderOfScan
    def initialize
        @itemsInOrderOfScan = Array.new
    end
    
    def ringUp(item)
        @itemsInOrderOfScan.push(item)
    end
end