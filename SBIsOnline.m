function [rval] = SBIsOnline()
%Gets Online status from Scorbot
global ScTCP;
if(isvalid(ScTCP))
    %send an online query
    cmd = uint8(14);
    write(ScTCP,cmd);
    %wait for a reply
    tmp=SBWaitStatus();
    if(tmp(7)==1)
        rval = 1;
    else
        rval = 0;
    end
else
    disp('Error - Must Start_SB_Session First');
    rval = 0;
end    

