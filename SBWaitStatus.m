function [rval] = SBWaitStatus()
%Waits for returned status from a command
global ScTCP;
if(isvalid(ScTCP))
    while(ScTCP.BytesAvailable == 0)
    end
    rval = read(ScTCP,ScTCP.BytesAvailable,'uint8');
else
    disp('Error - Must Start_SB_Session First');
    rval = 0;
end    
end

