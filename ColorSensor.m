 
global key;
InitKeyboard();
brick.SetColorMode(2,2);                    %sets the sensor to look for color
while 1
    color = brick.ColorCode(2);             %gets color code
    pause(0.1);

    switch key

        case 'uparrow' %case for uparrow
            if (color == 5)
               brick.StopAllMotors();
               pause(1);
               brick.MoveMotor('A', -50);
               brick.MoveMotor('D', -50);
            else
               brick.MoveMotor('A', -50);
               brick.MoveMotor('D', -50);
            end
            
            
        case 'downarrow' %case for downarrow
            brick.MoveMotor('A', 30);
            brick.MoveMotor('D', 30);
            
        case 'leftarrow' %case for leftarrow
            brick.MoveMotor('A', -15);
            brick.MoveMotor('D', -30);
            
        case 'rightarrow' %case for rightarrow
            brick.MoveMotor('A', -10);
            brick.MoveMotor('D', -30);
           
            
        case 'w' %case for w
            if (color == 3) %if color is blue, moves crane down
            brick.MoveMotor('C', -10);
            pause(0.25);
            brick.StopAllMotor();
            end
            
            
        case 's' %case for s
            if (color == 4) %if color is green, moves crane up
            brick.MoveMotor('C', 10);
            pause(0.25);
            brick.StopAllMotor();
            end
            
        case '0' %case for 0, it stops all the motors
            brick.StopAllMotors();
        case 'q'
            break;
    end
end

CloseKeyboard();
