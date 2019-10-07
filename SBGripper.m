function [rval] = SBGripper(OpenClose)
%Open if nonzero, close if zero
global ScTCP;
if(isvalid(ScTCP))
    if(SBIsInitDone()) %initialization done
        if(OpenClose ~= 0) %open gripper
            cmd = [uint8(3)]; %gripper command
        else
            cmd = [uint8(4)];
        end
        write(ScTCP,cmd);
        %wait for a status reply
        vec = SBWaitStatus();
        if(vec(1) == 'S' && vec(3) == 0) %No motion done signal for gripper
            disp('Command Accepted');
            rval = 1;   %Command Accepted
        else
            disp('Error in Gripper Operation');
            rval = 0;
        end
    else
        disp('Error - Must Complete Initialization First');
        rval = 0;
    end
else
    disp('Error - Must Start_SB_Session First');
    rval = 0;
end
end

