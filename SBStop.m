function [rval] = SBStop()
%Gets Jaw opening in mm
global ScTCP;
if(isvalid(ScTCP))
    if(SBIsInitDone()) %initialization done
        lcmd=uint8(20);
        write(ScTCP,lcmd);
        %wait for a reply
        vec=SBWaitStatus();
        if(vec(1) == 'S' && vec(3) == 0) %No Errors
            disp('Stop initiated');
            rval = 1;   %Command Accepted
        else
            disp('Error - Stop Command');
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

