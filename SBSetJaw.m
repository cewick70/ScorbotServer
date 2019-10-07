function [rval] = SBSetJaw(Posit)
%Move Joint to point coordinates
global ScTCP;
if(isvalid(ScTCP))
    if(SBIsInitDone()) %initialization done
        lcmd=[16,Posit];
        write(ScTCP,lcmd);
        %wait for a status reply
        vec=SBWaitStatus();
        if(vec(1) == 'S' && vec(3) == 0) %No Errors
            disp('Gripper Move Initiated');
            rval = 1;   %Command Accepted
        else
            disp('Error - Gripper Metric Move');
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

