# EC311_Project

# Project Name
E-Hockey

# Team Members 
Ryan Flynn, Abdulaziz Alrasheed, Jeremy Sajda, Yousif Alhajji

# Project Demo Video Link
https://drive.google.com/file/d/1tVkM2zGSBeNe1PIMIh7OgIFzUTt4MsAf/view?usp=drivesdk

# Overview of the Project
Eee-Eee Enterprises is proud to present its latest video-gaming sensation: "E-HOCKEY"
In this game, players can experience life in the big leagues firsthand using a state-of-the-art FPGA console (NEXYS A7).
With EIGHT modes and SIMULTANEOUS TWO-PLAYER inputs this game is guaranteed to provide a fun time for all ages.

Players can move in 2 dimensions, grab a puck by overlapping with its collision box, switch the puck from one hand to the other and shoot in three directions. The goal of the game is to score on your opponent 7 times (the current score is shown on the seven segment display). There are 8 modes to choose from which can be selected on the menu screen by inputting the mode number on the keyboard.

To enter the game from the menu screen, simply press the SPACEBAR/ENTER once a mode is selected and the rink will appear.
Once 7 goals are registered by one player, the game automatically goes to the GAME OVER screen which keeps the gamescore saved on the display until a new game is started.
To start a new game from any screen, press BACKSPACE to reset to the main menu.

# How to Run the Project
MODES:
1: slow player speed, wall collisions on, goals fixed
2: slow player speed, wall collisions off, goals fixed
3: fast player speed, wall collisions on, goals fixed
4: fast player speed, wall collisions off, goals fixed
5: slow player speed, wall collisions on, goals moving slowly
6: slow player speed, wall collisions off, goals moving slowly
7: fast player speed, wall collisions on, goals moving quickly
8: fast player speed, wall collisions off, goals moving quickly

SETUP CONTROLS:
1,2,3,4,5,6,7,8: mode selection
SPACEBAR/ENTER: enter game
BACKSPACE: return to main menu


LEFT PLAYER CONTROLS:
W: move up
S: move down
A: move left
D: move right
B: shoot up
N: shoot middle
M: shoot down
,: hold puck down
.: hold puck up


RIGHT PLAYER CONTROLS:
UP: move up
DOWN: move down
LEFT: move left
RIGHT: move right
KEYPAD 1: shoot up
KEYPAD 5: shoot middle
KEYPAD 3: shoot down
KEYPAD 0/INSERT: hold puck down
KEYPAD ./DELETE: hold puck up


# Overview of the Code Structure
[AirHockey_top] This top module is where most sub-module instantiations take place. It is also where the game background visuals are assigned to their respective x and y values in addition to attaching the keyboard inputs to their respective controls.

[clock_divider] Takes in the 100MHz clock on the FPGA and outputs a 100Hz clock.

[puckstates_FSM] defines all the possible states the puck can be in and how they connect to eachother. In this game the puck has 1 setup state, 6 motion states, 2 goal states, and 2 held states per player leading to a total of 13 states. The module decides what to do with the puck based on the inputs and current state which makes it a Mealy Machine.

[Player_motion.v] This module takes inputs from the keyboard and other modules, and it outputs the x and y position of the player. When the game is running, the mode is taken into account, and the player moves based on which key is being pressed. Both players are able to move simultaneously as a result.

[ShiftReg] generates a random number to be used in deciding the initial puck state.

[vga640x480] controls the VGA sanning system.

[PS2Receiver] receives keyboard inputs.

[debounce] debouncer for keyboard inputs.

[fasterclock] Takes in the 100MHz clock on the FPGA and outputs a 1kHz clock.

[segdisp] takes in the scores and outputs the cathode and anode values needed to drive the seven segment display.

[segdecoder] converts score values to 7-bit one-hot-encoded numbers which are to be shown on the seven segment display.

[lettermap] Within this module we split each sprite into rectangles that are combined to create the whole sprite. To do this we use the x and y coordinate of where each sprite starts and the width and height in pixels of each sprite and its components. As the VGA scans the screen it will see if the x and y coords fall within the specified boundaries of each rectangle component. If they do then the components of each letter will be set to 1, turning that pixel on. What sprite is outputted is determined by a case statement dependent on the sprite ID.

[menu] This module defines the width and height in pixels of each sprite and the x and y coordinates of where each sprite starts. It then calls on lettermap to create each individal sprite of the menu screen, then combines them to create to create the full menu screen. Depending on the game mode, the screen will dipslay which mode is selected.

[GOscreen] This module defines the width and height in pixels of each sprite and the x and y coordinates of where each sprite starts. It then calls on lettermap to create each individal sprite of the Game Over screen, then combines them to create to create the full Game Over screen.
