# Mars Rover technical Challenge
A squad of robotic rovers are to be landed by NASA on a plateau on Mars.<br><br>
This plateau, which is curiously rectangular, must be navigated by the rovers so that their on board cameras can get a complete view of the surrounding terrain to send back to Earth.<br><br>
A rover's position is represented by a combination of an x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.<br><br>
In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot.<br><br>
'M' means move forward one grid point, and maintain the same heading.<br><br>
Assume that the square directly North from (x, y) is (x, y+1).<br><br>

### INPUT
The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.<br><br>
The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover's position, and the second line is a series of instructions telling the rover how to explore the plateau.<br><br>
The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover's orientation.<br><br>
Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.<br><br>

### OUTPUT
The output for each rover should be its final co-ordinates and heading.

### TEST INPUT
```
5 5

1 2 N

LMLMLMLMM

3 3 E

MMRMMRMRRM 
```
### EXPECTED OUTPUT
```
1 3 N

5 1 E
```

# Descriptions
Keywords      | Description                                                                                                     | Interpretation
------------- |-----------------------------------------------------------------------------------------------------------------| ----------------
**SQUAD**        | A small group of people having a particular task                                                                | More than one Rover 
**ROVERS**  | Motor vehicle designed to travel on the surface of Mars.                                                        | Main object to be moved
**PLATEAU** | An area of fairly level high ground                                                                             | Area in which the Rovers will be moving
**RECTANGULAR** | A plane figure with four straight sides and four right angles                                                   | Our Plateau is in Rectangular shape where the rovers will be moving
**POSITION** | A place where  something is located or has been put                                                             | Place at which the rovers is at according to the coordinates
**REPRESENTED** | One (as a picture or symbol) that is a sign or portrayal of something else                                      | Position is illustrated by combination of x and y co-ordinates and a letter representing one of the four cardinal compass points.
**COORDINATES** | A set of numbers or numbers and letters together that show you a position on a map                              | x and y corresponding numbers to located where the Rover is situated 
**COMBINATION** | A joining or merging of different parts or qualities in which the component elements are individually distinct. | Rover position is deduced by merging x and y and one letter of cardinal compass points
**GRID** | A network of lines that cross each other to form a series of squares or rectangles.                             | Plateau is in rectangular shape as whole and whilst also inside divided into grid
**L** | Left                                                                                                            |  Rover spin 90 degrees left
**R** | Right                                                                                                           |  Rover spin 90 degrees Right 
**M** | Move forward                                                                                                    |  Move forward one grid point, and maintain the same heading.


## Installing the Application

Clone the repository or download it into your PC.

Run `$ bundle install` to install gems

## Running the Application


To execute the ruby program, run the following command:

`$ ruby app.rb `

and start inputting the provided test data by following the prompts
