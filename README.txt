DESCRIPTION:
This program is written in Ruby and it uses MiniTest as the test framework.

I have 2 classes String and Card. I monkey-patched the String class so that I could easily take a "$123" and convert it to the integer 123. I then added a Card class with a constructor function and 2 instance methods (charge and credit). It was mentioned in the instructions that I could assume a certain input. Because I could assume the input was in the correct format, I didn't have to write as much input validation. If the input could not be trusted I would've added more validation. The program performs as directed per the spec and all the public methods in both classes have been tested.

TO RUN TESTS:
ruby test/unit/string.rb
ruby test/unit/card.rb

TO EXECUTE PROGRAM:
ruby lib/main.rb --file test/fixtures/input.txt

OUTPUT:
Lisa: $-93
Quincy: error
Tom: $500
