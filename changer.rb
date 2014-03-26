# Short and simple program to take a dollar amount and turn it into worded form.

require 'bigdecimal'
require 'bigdecimal/util' # loads the to_d method

# ex output for 152.35:
# 1 100s, 1 50s, 2 1s, 1 Quarters, 1 Dimes

amount = gets.to_d

  cash = [100,50,20,10,5,1,0.25,0.10,0.05,0.01]
  change = Array.new

    cash.each do |cash|
      while amount >= cash
        change << cash
        amount -= cash
      end
    end

  # coins.each {|coin| coin.to_f}

    change.map! {|cash|
      if(cash == 100)
        "100s"
      elsif(cash == 50)
        "50s"
      elsif(cash == 20)
        "20s"
      elsif(cash == 10)
        "10s"
      elsif(cash == 5)
        "5s"
      elsif(cash == 1)
        "1s"
      elsif(cash == 0.25)
        "Quarters"
      elsif(cash == 0.10)
        "Dimes"
      elsif(cash == 0.05)
        "Nickles"
      else(cash == 0.01)
        "Pennies"
      end
    }
    change.uniq.each do |element|
      s = "#{change.count(element)} #{element}, "
      s.delete(",")
      print s
    end
