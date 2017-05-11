# VHDL VendingMachine

This is a VHDL project to implement a Vending Machine. The purpose of the project is to employ RTL design to implement a simple vending
machine. For simplicity, the vending machine has two choices of items -This can easily be expanded to many more-. The value of each item 
must be predefined by the user -Can be either hardcoded, or variable during simulation-.

Upon simulations, Users must select their choice of items by setting the variable C either to 0 or 1. Then, users must feed the vending 
machine with values which represents coins, the machine will add up the inserted coins (a coin check will happen every clock cycle) until 
total adds up to equal or greater than the price that corrosponds with the users choice. After that, the vending machine will dispense the
item and give back the change that the costumer owes. The process then is restarted and the machine is ready to accept new values and a
new choice. At any point in time if an item has not been dispensed yet, costumers can reset and get their money back. 

This implementation consists of two main components; a Control Subsystem and a Data Subsystem. The Control  subsystems is a simple state
machine which handles the different states of the vending machine. It controls the Enable and Reset flags of the various registers along
with dispensing the items.

As for the Data subsystem, it executes the mathmatical operations of the system. It recieves the value of the coin from the Control
subsystem and adds it to an accumulator. It also outputs the total and the change amounts to the user. The Data subsystem contains all the
registers of the vending machine, along with the adder and the comparitor. It also feeds the values of the comparitor to the Control
subsystem as an internal signal which in turn uses it to change the states.
