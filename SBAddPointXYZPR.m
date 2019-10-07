function [rval] = SBAddPointXYZPR(N,XYZPR,Rel)
%Add a point to defined vector, Rel = 0 for Absolute coord, 1 for ABS
global ScTCP;
if(isvalid(ScTCP))
    if(SBIsInitDone()) %initialization done
        lcmd=[9,N,Rel,XYZPR(1),XYZPR(2),XYZPR(3),XYZPR(4),XYZPR(5)];
        write(ScTCP,lcmd);
        %wait for a status reply
        vec=SBWaitStatus();
        if(vec(1) == 'S' && vec(3) == 0) %No motion done signal for gripper
            disp('XYZPR Point Added');
            rval = 1;   %Command Accepted
        else
            disp('Error in Adding Point');
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

