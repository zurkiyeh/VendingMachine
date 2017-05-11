# VendingMachine

This is a VHDL project to implement a Vending Machine. The purpose of the project is to employ RTL design to implement a simple vending
machine. For simplicity, the vending machine has two choices of items -This can easily be expanded to many more-. The value of each item 
must be predefined by the user -Can be either hardcoded, or variable during simulation-.
Upon simulations, Users must select their choice of items by setting the variable C either to 0 or 1. Then, users must feed the vending 
machine with values which represents coins, the machine will add up the inserted coins (a coin check will happen every clock cycle) until 
total adds up to equal or greater than the price that corrosponds with the users choice. 

This implementation consists of two main components; a Control Subsystem and a Data Subsystem. The Control  
