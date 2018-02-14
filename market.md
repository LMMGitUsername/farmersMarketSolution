The Farmer’s Market

We sell the following four products at the local farmer’s market every week.

```
+--------------|--------------|---------+
| Product Code |     Name     |  Price  |
+--------------|--------------|---------+
|     CH1      |   Chai       |  $3.11  |
|     AP1      |   Apples     |  $6.00  |
|     CF1      |   Coffee     | $11.23  |
|     MK1      |   Milk       |  $4.75  |
+--------------|--------------|---------+
```

This week, we’re celebrating our one year anniversary and would like to offer the
following specials.  To do so, we’ll need to update our checkout system to apply
the following rules.

1. BOGO -- Buy-One-Get-One-Free Special on Coffee. (Unlimited)
2. APPL -- If you buy 3 or more bags of Apples, the price drops to $4.50.
3. CHMK -- Purchase a box of Chai and get milk free. (Limit 1)

A checkout system interface might look something like the following:

```
co = Checkout.new
co.scan(item)
co.scan(item)
```

At any time, we should be able to print out the current register to see what the state of
the basket is.  This should include the price and the applied discount or special, if any.

For example, given the following basket:

CH1, AP1, AP1, AP1, MK1

After CH1 and AP1, it should yield:

```
Item                          Price
----                          -----
CH1                            3.11
AP1                            6.00
-----------------------------------
                               9.11
```
After the entire basket is added, it would yield:

```
Item                          Price
----                          -----
CH1                            3.11
AP1                            6.00
            APPL              -1.50
AP1                            6.00
            APPL              -1.50
AP1                            6.00
            APPl              -1.50
MK1                            4.75
            CHMK              -4.75
-----------------------------------
                              16.61
```
Using Ruby, implement a checkout system that allows us to fulfill the above requirements.

Here’s some test data for your specs:

```
Basket: CH1, AP1, CF1, MK1
Total price expected: $20.34
```

```
Basket: MK1, AP1
Total price expected: $10.75
```

```
Basket: CF1, CF1
Total price expected: $11.23
```

```
Basket: AP1, AP1, CH1, AP1
Total price expected: $16.61
```

-----

The scope of this project is meant to be fairly narrow, but there are a lot of details to consider.  
Ultimately, the goal should be to design a simple set of classes to fulfill the requirements as set.  
We’re looking for the following things when reviewing your code:

1. Design (Structure and readability)
2. Testing (Please use MiniTest or RSpec to show test coverage)
3. Accuracy (The math should work out)
4. Flexibility (Will this allow for future changes?)
5. Completeness (Did you read all the way to here?)

Please feel free to ask questions as they arise.