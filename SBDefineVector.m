function [rval] = SBDefineVector()
%Open if nonzero, close if zero
global ScTCP;
if(isvalid(ScTCP))
    if(SBIsInitDone()) %initialization done
        cmd = [uint8(8)];  %define vector USNA1
        write(ScTCP,cmd);
        %wait for a status reply
        vec=SBWaitStatus();
        if(vec(1) == 'S' && vec(3) == 0) 
            disp('Vector Defined');
            rval = 1;   %Command Accepted
        else
            disp('Error in Defining Vector');
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

