brick.SetColorMode(2, 2); %sets color sensor to look for color
threshold = 40; %sets distance threshold to 40


while 1
    %keeps moving the car forward
    brick.MoveMotor('A', -50);
    brick.MoveMotor('D', -50);
 
    %initialises the color, distance and touch sensor from respective ports
    color = brick.ColorCode(2);
    distance = brick.UltrasonicDist(1);
    touch = brick.TouchPressed(3);
    disp(color);

    %makes decisions based on color
    if color == 5                   %if color is red stop for 4 sec                   
        brick.StopAllMotors();      %stops the car 
        pause(2);                   %stops the car for 4 secs
        brick.MoveMotor('A', -50);  %moves the car from the red
        brick.MoveMotor('D', -50);
        pause(1);
        
    elseif color == 2 || color == 3    %if color is blue or green, activate keyboard control
        brick.StopAllMotors();
        run('KeyboardControl.m');
        brick.MoveMotor('A', -50);      %once keyboardcontrol is quit, it moves the car forward
        brick.MoveMotor('D', -50);
        pause(1);
    end
    
   
    %makes decision based on if touch sensor is pressed
    if touch
            pause(1);                   %pauses the code to register touch, to calibrate
            disp(distance);
            %Stops the car, moves it backward to take a proper turn
            brick.StopAllMotors();      
            brick.MoveMotor('A', 30);
            brick.MoveMotor('D', 30);
            pause(1);

            %takes a left turn 
            brick.MoveMotor('D', -30);
            pause(1.06); %turning time
            brick.StopMotor('D');

            %moves the car forward
            brick.MoveMotor('A', -50); 
            brick.MoveMotor('D', -50);
            pause(1);
    end
     
end
