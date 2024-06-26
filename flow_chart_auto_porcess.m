START
|
|-> Get range, resolution and seconds from user
|-> Check if Generator, Analyzer and Arcus are connected
|    |
|    |-> Yes:
|    |   |
|    |   |-> Check if range > 361
|    |   |   |
|    |   |   |-> Yes: Show error message for invalid range
|    |   |   |-> No:
|    |   |   |   |
|    |   |   |   |-> Check if resolution is divisible by 360
|    |   |   |   |   |
|    |   |   |   |   |-> No: Suggest a new resolution value
|    |   |   |   |   |-> Yes:
|    |   |   |   |       |
|    |   |   |   |       |-> Check if RF output button is ON
|    |   |   |   |       |   |
|    |   |   |   |       |   |-> No: Show error message to turn on the RF output button
|    |   |   |   |       |   |-> Yes:
|    |   |   |   |       |       |
|    |   |   |   |       |       |-> Initialize a table with the size based on the range and resolution
|    |   |   |   |       |       |-> Show a polar plot with zero degree at the top
|    |   |   |   |       |       |
|    |   |   |   |       |       |-> For each step, move the motor to the current step size
|    |   |   |   |       |       |-> Wait for a specified time
|    |   |   |   |       |       |-> Read the power and frequency from the signal analyzer
|    |   |   |   |       |       |-> Store the data in the table
|    |   |   |   |       |       |-> Update the data in the table
|    |   |   |   |       |       |-> Plot the point in the polar plot
|    |   |   |   |       |       |
|    |   |   |   |       |-> End for loop
|    |   |   |   |       |
|    |   |   |   |       |-> Plot the entire data in the polar plot
|    |   |   |   |       |-> Move the motor to the initial position
|    |   |   |   |
|    |   |   |-> End if
|    |
|    |-> No: Show error message for devices not connected
|
|-> End



Start
|
|__ Set Delay = 0.010
|
|__ Print communication time calculation message
|   |
|   |__ Print message with delay value
|   |
|   |__ Set h = 0
|   |
|   |__ Start timer
|   |
|   |__ Loop while h < 25
|   |   |
|   |   |__ If h = 5, set power level to 10 and print message
|   |   |
|   |   |__ Else if h = 10, set power level to 5 and print message
|   |   |
|   |   |__ Else if h = 15, set power level to 0 and print message
|   |   |
|   |   |__ Else if h = 20, set power level to 15 and print message
|   |   |
|   |   |__ Pause for Delay seconds
|   |   |
|   |   |__ Get marker power and store in P
|   |   |
|   |   |__ Print P
|   |   |
|   |   |__ Stop timer and print elapsed time
|   |   |
|   |   |__ Increment h by 1
|   |
|__ End loop
|
End

