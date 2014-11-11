#puts 1.+(7)
#
#class Pet
#  def speak
#    Kernel.puts("Woof Woof")
#  end
#  
#  def your_age(years)
#    puts "You're only #{years} years old?"
#  end
#
#  def your_breed(breed)
#    puts "You're such a cute little #{breed}!"
#  end
#end
#
#puts Pet.class
#
#dog = Pet.new
#
#Kernel.puts(dog)
#
#boo = Pet.new
#
#boo.speak
#
#boo.your_age(6)
#boo.your_breed("terrier")
#
#
#class Computer
#  def cpu (processor)
#    puts "CPU: #{processor}"
#  end
#
#  def memory (mem)
#    puts "Memory: #{mem}"
#  end
#end
#
#macintosh = Computer.new
#
#macintosh.cpu("Intel Core 2 Duo")
#macintosh.memory("160GB Hard Drive / 2GB RAM")
#
#class Marker
#  def set_color(my_color)
#    @color = my_color
#  end
#
#  def write
#    Kernel.puts("I am using a #{@color} marker!")
#  end
#end
#
#red_marker = Marker.new
#green_marker = Marker.new
#red_marker.set_color("red")
#green_marker.set_color("green")
#red_marker.write
#green_marker.write
#
#class Pet
#  def speak
#    puts "What does the pet say?"
#    noise = gets.chomp
#    puts "The pet says '#{noise}'!"
#  end
#  
#  def breed(my_breed)
#    @dog_breed = my_breed
#  end
#
#  def write_breed
#    puts "The pet's breed is #{@dog_breed}."
#  end
#
#end
#
#dog = Pet.new
#cat = Pet.new
##dog.speak
#dog.breed("schnauzer")
#dog.write_breed
#cat.breed("tabby")
#cat.write_breed

puts 5.*(5)
puts "omg".send(:upcase)
puts ['a', 'b', 'c'].send(:at, 1)
print ['a', 'b', 'c'].send(:insert, 2, 'o', 'h', 'n', 'o')
puts
puts 6 -32
puts "MakerSquare" * 6
puts "MakerSquare".split('a')
print ['alpha', 'beta'].push(3)
puts