function [rval] = SBInit()
%Initialization of Scorbot
global ScTCP;
if isvalid(ScTCP)
    cmd = [uint8(1)];
    write(ScTCP,cmd);
    vec = SBWaitStatus();
    if(vec(1) == 'S' && vec(2) == 1)
%        disp('Init Success');
        rval = 1;
    else
%        disp('Init Failure - check power and teach pad on auto');
        rval = 0;
    end
else
    disp('Init Failure - run Start_SB_Session first');
    rval = 0;
end
    
end

