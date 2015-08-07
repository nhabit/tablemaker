Feature: Run the Tablemaker command
  As a Command Line user
  I want to be able to run the tablemaker command
  In order to print a multiplication table of the first 10 primes 
  And satisfy my desire to learn a new language

Scenario: run the Tablemaker command with default arguments
  Given that the tablemaker command is in my path
  When I run tablemaker without arguments
  Then I should see a 10x10 prime multiplication table