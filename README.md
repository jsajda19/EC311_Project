# EC311_Project

# Project Name
E-Hockey

# Team Members 
Ryan Flynn, Abdulaziz Alrasheed, Jeremy Sajda, Yousif Alhajji

# Project Demo Video Link
//

# Overview of the Project
//

# How to Run the Project
Once the project is loaded on the FPGA, choose your mode by pressing the number key 1-8 above the letter keys on your keyboard, this project assumes there is a keypad on your keyboard. Once you've selected your mode press space to start. After the game has started, the player on the left uses w,a,s,d to move up, left, down, or right respectively. To shoot the puck once it has been latched, press B to shoot up, N to shoot 

# Overview of the Code Structure
//

[Player_motion.v] This module takes inputs from the keyboard and other modules, and it outputs the x and y position of the player. When the game is running, the mode is taken into account, and the player moves based on which key is being pressed. Both players are able to move simultaneously as a result.
