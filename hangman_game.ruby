


class Hangman
 def initialize
   @letters = ('a'..'z').to_a
   @word = words.sample
   @lives = 7
   @correct_guesses = []
   @word_teaser =""
    @word.first.size.times do
        @word_teaser += "_ "
  end
 end

 def words
  [
    ["cricket", "A game played by good people"],
  ["jogging", "Swimming with sharks on a sunny day"],
  ["walking", "Hey there.."],
  ["full","The truth is that it is simple"],
  ["unaware", "Gaining ground on truth"]
 ]
 end

def print_teaser last_guess = nil
update_teaser(last_guess) unless last_guess.nil?
puts @word_teaser
end

def update_teaser last_guess
 new_teaser = @word_teaser.split
new_teaser.each_with_index do |letter, index|
#replace blank value with letter if matches letter in word
if letter == '_' && @word.first[index] == last_guess
    new_teaser[index] = last_guess
   end
 end
 @word_teaster = new_teaser.join(' ')
end

def make_guess
      if @lives > 0
     puts "Enter a letter"
       guess = gets.chomp

     #if letter is part of the word user has guessed

     good_guess = @word.first.include? guess


     if good_guess
      puts "Good guess!"

      @correct_guesses << guess

      #remove guess from array
      @letters.delete guess


      print_teaser guess
     if @word.first == @word_teaser.split.join
       puts "Congratulations!"
     else
      make_guess
     end
     else
      @lives -= 1
      puts "Sorry.... you have #{@lives} lives left. Try again!"
      make_guess
      end
     else
      puts "Game is over!"
     end
end



 def begin
  #ask user for a letter
  puts "New game started.. your word is #{@word.first.size} characters long"
  puts "To exit at any point, type 'exit'"

  print_teaser

  puts  "your clue is #{@word.last}"

  make_guess

 end

end

game = Hangman.new
game.begin
