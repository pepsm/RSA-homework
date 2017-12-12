 

class RSA
   @n 
   @e
   @d
   
   def initialize n, e, d
    @n = n
    @e = e
    @d = d
     #initializes this instance of RSA with a n,e and d variables of type int. 'n','e' are the public key and 'd' is the private one. This n,e,d should be used when encrypting and decrypting the message
   end

   def prime_gen
      require 'prime'
      n = Random.new.rand(1 .. 100)
      return Prime.first(n).last
   end
   
   def n
      @n
      #returns the value of 'n' passed in the initialize
   end
   
   def e
     @e
      #returns the value of 'e' passed in the initialize
   end
   
   def d
      @d
      #returns the value of 'd' passed in the initialize
   end
   
   def new_key
      
      while((q = prime_gen) == (p = prime_gen))
      end

      n = p * q
      lcm = (p - 1).lcm(q - 1)
      
      loop do
         e = rand(1 .. lcm)
         break if e.gcd(lcm) == 1
      end

      d = inv_mod(e, lcm)
      [n, e, d]
      #generates a new 'n','e' and 'd' values following the RSA algorithm. Returns a new array of three elements where the first element is 'n', the second is 'e' and the third is 'd'. Each time it is called a new key must be returned.
   end
   
   def encrypt message
      arr = Array.new
      message.each_char do |ch|
          arr << (ch.ord ** @e % @n)
      end
       arr.to_s
      #encrypts the message passed. The message is of type string. Encrypts each symbol of this string by using its ASCII number representation and returns the encrypted message.
   end
   
   def decrypt message
      dec = String.new
      message.split(', ').each do |num|
        decrypted_char = (num.to_i ** d % n).chr
        dec << decrypted_char
      end
      dec
  end

   def inv_mod(a, m)
      i = 0
     loop do
         if a * i % m == 1
            return i
         end
         i+=1
      end
   end
end
