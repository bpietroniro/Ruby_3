# implement a Rot13 encryption for a string containing lowercase and 
# uppercase letters and spaces

=begin
- const ROTATION = 13
- initialize output string
- split string into array of chars
- iterate through char array
  - if current char is a space,
    - add a space to the output string
    - next
  - get ASCII num for current char
  - adjustment is 65 for uppercase, 97 for lowercase
  - new_char_ord = ((current char ASCII - adjustment) + ROTATION) % 26 + adjustment
  - add char(new_char_ord) to output string
- return output string
=end

ROTATION = 13

def rot13_decrypt(name)
  decrypted = ''
  name.each_char do |letter|
    if letter =~ /[a-z]/
      decrypted += ((letter.ord - 97 + ROTATION) % 26 + 97).chr
    elsif letter =~ /[A-Z]/
      decrypted += ((letter.ord - 65 + ROTATION) % 26 + 65).chr
    else
      decrypted += letter
    end
  end

  decrypted
end

p rot13_decrypt("Nqn Ybirynpr")
p rot13_decrypt("Tenpr Ubccre")
p rot13_decrypt("Nqryr Tbyqfgvar")
p rot13_decrypt("Nyna Ghevat")
p rot13_decrypt("Puneyrf Onoontr")
p rot13_decrypt("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p rot13_decrypt("Wbua Ngnanfbss")
p rot13_decrypt("Ybvf Unvog")
p rot13_decrypt("Pynhqr Funaaba")
p rot13_decrypt("Fgrir Wbof")
p rot13_decrypt("Ovyy Tngrf")
p rot13_decrypt("Gvz Orearef-Yrr")
p rot13_decrypt("Fgrir Jbmavnx")
p rot13_decrypt("Xbaenq Mhfr")
p rot13_decrypt("Fve Nagbal Ubner")
p rot13_decrypt("Zneiva Zvafxl")
p rot13_decrypt("Lhxvuveb Zngfhzbgb")
p rot13_decrypt("Unllvz Fybavzfxv")
p rot13_decrypt("Tregehqr Oynapu")
