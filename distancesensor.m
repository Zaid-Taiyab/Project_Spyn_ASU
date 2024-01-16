threshold = 10;
hastakenright = false;
brick.SetColorMode(2, 2);

while 1
    brick.MoveMotor('A', -50);
    brick.MoveMotor('D', -50);
    touch = brick.TouchPressed(3);
    color = brick.ColorCode(2);
    distance = brick.UltrasonicDist(4);
    %Color Decisions
    if color == 5                      %if color is red stop for 4 sec                   
        brick.StopAllMotors(); %stops the car 
        pause(4); %stops the car for 4 secs
        brick.MoveMotor('A', -50); %moves the car from the red
        brick.MoveMotor('D', -50);
        
    elseif color == 2 || color == 3    %if color is blue or green, activate keyboard control
        brick.StopAllMotors();
        run('KeyboardControl.m');
        brick.MoveMotor('A', -50);
        brick.MoveMotor('D', -50);
        pause(3);
    end
    
    %Navigation
    
    if distance > threshold                %if right wall falls away from right side
        pause(0.6); %wait to get past wall
        brick.StopAllMotors();
        brick.MoveMotor('A', 20);
        pause(3.4); %turning time
        brick.StopMotor('A');
        brick.MoveMotor('A', -50); 
        brick.MoveMotor('D', -50);
        pause(2);
    end 
    if touch %if hit wall in front
        pause(1); %keep going forward for a short period of time in order to calibrate
        
        disp('touched');
        brick.StopAllMotors();          %stop
        dist = brick.UltrasonicDist(1); %get distance from right wall
        brick.MoveMotor('A', 30);
        brick.MoveMotor('D', 30);
        pause(0.2); %time to back up from wall
        brick.StopMotor('AD', 'Brake'); %stop
        
        %theoretically should never get here if previous method right
        if distance < threshold %if there is no wall on the right
            brick.MoveMotor('D', 10); 
            pause(3.4);
            brick.StopMotor('D');
            brick.MoveMotor('A', -50); 
            brick.MoveMotor('D', -50);
            pause(2);
        else %if there is a wall on the right
            brick.MoveMotor('A', 10);
            pause(3.4);
            brick.StopMotor('A');
            brick.MoveMotor('A', -50); 
            brick.MoveMotor('D', -50);
            pause(2);
        end
    end

end
