function [rval] = SBDeletePoint(PointNum)
%Move to point in linear fashion
global ScTCP;
if(isvalid(ScTCP))
    if(SBIsInitDone()) %initialization done
        lcmd=[13,PointNum];
        write(ScTCP,lcmd);
        %wait for a status reply
        vec=SBWaitStatus();
        if(vec(1) == 'S' && vec(3) == 0) %No Errors
            disp('Point Deleted');
            rval = 1;   %Command Accepted
        else
            disp('Error in Deleting Point');
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

