function [rval] = SBGetStatus()
%Gets Status Vector from Scorbot
global ScTCP;
if(isvalid(ScTCP))
    %send a request for status
    cmd = uint8(5);
    write(ScTCP,cmd);
    %wait for a reply
    rval=SBWaitStatus();
else
    disp('Error - Must Start_SB_Session First');
    rval = 0;
end    
end

