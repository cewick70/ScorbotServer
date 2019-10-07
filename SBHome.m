function [rval] = SBHome()
%Robot Homing Function
global ScTCP;
if(isvalid(ScTCP))
    if(SBIsInitDone()) %initialization done
        cmd = [uint8(2)]; %send home command
        write(ScTCP,cmd);
        %wait for a status reply
        vec = SBWaitStatus();
        if(vec(1) == 'S' && vec(4) == 1) %homing done
            disp('Homing Completed');
            rval = 1;   %homing completed ok
        else
            disp('Error during Homing');
            rval = 0;
        end
    else
        disp('Error - Must Complete Initialization First');
        rval = 0;
    end
else
    disp('Error - Must Start_SB_Session First');
    rval = -1;
end
end

