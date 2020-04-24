# -*- coding: utf-8 -*-
# ruby
class ComplexNum
    attr_reader:real,:imag,:history
    @@addcounter=1
    @@mulcounter=1
    @@history=Array.new
    #contructor to init complex num values 
    def initialize(real , imag)
        @real = real
        @imag = imag
    end
    # overloading for + operator to add to cmnums 
    def +(cn)
        #here to add to history
        @@history.push("Adding cal "+"#{@@addcounter}")
        @@addcounter += 1
        #return result
        return ComplexNum.new(real + cn.real,
                       imag + cn.imag)
    end
    # overloading for * operator
    def *(cn)
        #here to add to history
        @@history.push("multiply cal "+"#{@@addcounter}")
        @@mulcounter += 1
        #return result
        return ComplexNum.new(real*cn.real,imag*cn.imag)
    end

    #to get sum of bulk
    def self.bulk_add(cns)
        #here to add to history
        @@history.push("Adding arr "+"#{@@addcounter}")
        @@addcounter += 1
        #init sum result
        sum=ComplexNum.new(0,0)
        #loop to add all arr elements
        cns.each do |cn| 
            sum += cn
        end
        #return result
        return sum
    end
    #to get multiplication of bulk
    def self.bulk_multiply(cns)
         #here to add to history
        @@history.push("multiply arr "+"#{@@addcounter}")
        @@mulcounter += 1
        #init mul result
        mul=ComplexNum.new(1,1)
        cns.each do |cn|
            mul *= cn
        end
        #return mul
        return mul
    end
    #to get history of calculator
    def self.get_stats
        return @@history
    end
end
#//-----------------------------------this is the end of class and all the below to test functionality
#define 3 complex numbers
cn1=ComplexNum.new(2,5)
cn2=ComplexNum.new(1,2)
cn3=ComplexNum.new(30,2)

#test to add 3 numbers
result= cn1 + cn2 + cn3
puts "#{result.real}"+" + "+"#{result.imag}"+"i"

#test to multiply
result= cn1 * cn2 * cn3
puts "#{result.real}"+" + "+"#{result.imag}"+"i"

# test arr sum
cns=[cn1,cn2]
result=ComplexNum.bulk_add(cns)
puts "#{result.real}" + " + "+"#{result.imag}"

#to test arr multiply
result=ComplexNum.bulk_multiply(cns)
puts "#{result.real}" + " + "+"#{result.imag}"


#to test history of calculator
allOps=ComplexNum.get_stats
puts "#{allOps}"