## Project Overview/Design Functionality

###### The goal of this project was to implement a simplified variant of the arcade game Whack-a-Mole onto the Xilinx Nexys 4 Artix-7 FPGA board using Verilog, where a randomized set of LEDs act as the moles and the buttons act as the hammers. Our baseline list of features for project completion was to have the game starting according to a five second timer and ending according to a thirty second timer, a single randomly activated LED blinking for an entire clock cycle acting as a mole, the LEDs deactivating if button input is received while it is on, and for an incrementing counter to display the score on the onboard seven-segment display whenever an LED is successfully turned off. 

###### From the beginning we intended for our project to be centralized entirely onto the onboard mechanics of this specific FPGA board, disregarding the use of external connectivity features like the VGA or ethernet port. While, from a commercial level, the intentionally crude realization of the game seems outwardly too simple, the project served less as a construction of a product and more as a learning experience for the entire team in the process of embedded system design from conceptualization all the way to the final implementation. We are in strong faith that the single-minded focus on utilizing only the FPGA served us much more as undergraduate students than if we had instead worked from the mindset that the project was a profession.


## Simplified Logic

### Pre-Game
###### From a pseudo-start state, initialization of the game by turning on the FPGA or toggling the reset switch begins a counter that counts down from five and displays the passing seconds on the segmented display. Once the timer ends, control is passed to the game state.

### Game
###### When the game state is reached, a second counter separate from the earlier five second counter begins, now counting down from thirty and retaining the value within the FPGA rather than displaying it on the segmented display. 
###### One of the first five LEDs is selected to turn on per second and at random via a linear-feedback shift register. LEDs are on HIGH for one second before turning off as another LED is chosen. Each of the five face buttons on the FPGA is bound to a single LED. Should the LED’s state and its corresponding button’s state be HIGH at the same time, a signal is sent to a score module that increments the user’s score by one and displays this value onto the right side of the segmented display. 
###### When the thirty second counter ends, the game is concluded and the FPGA stops receiving input from the buttons. From here the user can either turn the board off or use the reset switch to return control to the pre-game state.
