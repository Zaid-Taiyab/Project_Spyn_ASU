global key
InitKeyboard(); %Initialises keyboard ssswws
while 1
    
    pause(0.1);
        switch key %checks for keyboard input
            case 'uparrow' %if keyboard input is the uparrow
                %Moves the accessible car forwards
                brick.MoveMotor('A', -50);
                brick.MoveMotor('D', -50);
            case 'downarrow' %if keyboard input is the downarrow
                %Moves the accessible car backwards
                brick.MoveMotor('A', 30);
                brick.MoveMotor('D', 30);
            
            case 'leftarrow' %if keyboard input is the leftarrow 
                %Moves the car left
                brick.MoveMotor('A', -5);
                brick.MoveMotor('D', -40);
            
            case 'rightarrow' %if keyboard input is the rigtharrow
                %Moves the car right 
                brick.MoveMotor('A', -40);
                brick.MoveMotor('D', -5);
        
            case 's' %if keyboard input is s
                brick.MoveMotor('C', -20); %Rotates the step motor clockwise 
                pause(0.2); %pauses the code for 0.25 secs
                brick.StopAllMotors(); %stops the motor
            case 'w' %if keyboard input is w
                brick.MoveMotor('C', 20);
                pause(0.2); %stops the motor
                brick.StopAllMotors(); %stops the motor
           case '0' %if the keyboard input is 0
                brick.StopAllMotors(); %Stops all the car
            case 'q' %if the keyboard input is q
                break; %escapes the code
        end
end

CloseKeyboard();
