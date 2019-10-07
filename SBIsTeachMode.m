function [rval] = SBIsTeachMode()
%Gets TeachMode from Scorbot
global ScTCP;
if(isvalid(ScTCP))
    %send a teach mode query
    cmd = uint8(15);
    write(ScTCP,cmd);
    %wait for a reply
    tmp=SBWaitStatus();
    if(tmp(6)==1)
        rval = 1;
    else
        rval = 0;
    end
else
    disp('Error - Must Start_SB_Session First');
    rval = 0;
end    

