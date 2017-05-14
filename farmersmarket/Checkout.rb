#!/usr/bin/env ruby
#C:\Users\Despreciada\Documents\Ruby
load 'Register.rb'

class Checkout
    attr_accessor :register
    def initialize
        @register = Register.new
        @itemCount = Hash['CH1', 0, 'AP1', 0, 'CF1', 0, 'MK1', 0]
        @inventory = Hash['CH1', 3.11, 'AP1', 6.00, 'CF1', 11.23, 'MK1', 4.75]
        @discount = Hash['CF1', ['BOGO', '@itemCount["CF1"]>=2 && cf1Cnt%2==0', 11.23], 'AP1', ['APPL', '@itemCount["AP1"]>=3', 1.50], 'MK1', ['CHMK', '@itemCount["CH1"]==1', 4.75]] 
    end
    
    def scan(item)
        #add item and price to register
        @register.ringUp(item)
        @itemCount[item]+=1
    end
    
    def printReceipt
        puts "Item\t\t\tPrice"
        puts "----\t\t\t-----"
        total = 0
        cf1Cnt = 0
        
        #capture the purchases in an array
        purchasedItems = @register.itemsInOrderOfScan
        #get price of item from inventory
        price = @inventory[purchasedItems]
        
        
        for i in 0..purchasedItems.length-1
            currentPurchasedItem = purchasedItems.at(i)
            #now that we have an item from our list of purchases,
            #we want to use the item to see if there is an applicable
            #discount.
            #first, though, print the purchase. :)
            if(currentPurchasedItem == 'CF1')
                cf1Cnt = cf1Cnt + 1
            end
            currentPurchasedItemPrice = @inventory[currentPurchasedItem]
            puts "#{currentPurchasedItem}\t\t\t#{currentPurchasedItemPrice}"
            total = total + currentPurchasedItemPrice
            #now, we need to figure out if the next line should be about an applicable discount.
            d = @discount[currentPurchasedItem]
            unless d == nil
                if(eval(d.at(1)))
                    discountNaam = d.at(0)
                    priceOff = d.at(2)
                    puts "\t#{discountNaam}\t\t-#{priceOff}"
                    total = total - priceOff
                end
            end
        end
        puts "-----------------------------------\n\t\t\t#{total}"
    end
end
