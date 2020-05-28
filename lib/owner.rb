require 'pry'

class Owner
  @@all = [] 
  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self 
  end 
  attr_reader :name 
  attr_reader :species 
  def say_species 
    return "I am a #{@species}."
  end 
  def self.all
    @@all 
  end 
  def self.count 
    @@all.length 
  end 
  def self.reset_all 
    @@all = [] 
  end 
#and this function lists the cats
  def cats 
    Cat.all.select {|one_cat| one_cat.owner == self} 
  end 

  def dogs 
    Dog.all.select {|one_dog| one_dog.owner == self }
  end 

  # def find_or_make_pet_by_name(pet_name, pet_class)
  #   existence = pet_class.all.find {|one_pet| one_pet.name == pet_name}
  #   if existence 
  #     return existence 
  #   else pet_class.new(pet_name,self)
  #   end 
  # end 

  # def buy_cat(cat_name)
  #   the_cat = find_or_make_pet_by_name(cat_name, Cat)
  #   the_cat.owner = self 
  # end 

  def buy_cat(name)
    new_cat = Cat.new(name,self)
  end 

  # def buy_dog(dog_name)
  #   the_dog = find_or_make_pet_by_name(dog_name, Dog)
  #   the_dog.owner = self 
  # end 

  def buy_dog(name)
    new_dog = Dog.new(name,self)
  end 

  def walk_dogs
    self.dogs.each do |one_dog| 
      one_dog.mood = "happy"
    end 
  end 

   def feed_cats
    self.cats.each do |one_cat| 
      one_cat.mood = "happy"
    end 
  end 

  def sell_pets 
    disown(self.cats)
    disown(self.dogs) 
  end 

  def disown(pet_array)
    pet_array.each do |one_pet| 
      one_pet.owner = nil 
      one_pet.mood = "nervous"
    end 
  end 

  def list_pets 
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end 
end


# class Cat
#   @@all = []
#   def initialize(name, owner)
#     @name = name 
#     @owner = owner 
#     @mood = "nervous"
#     @@all << self 
#   end 
#   attr_reader :name 
#   attr_accessor :owner 
#   attr_accessor :mood 
#   def self.all 
#     @@all 
#   end 
# end
