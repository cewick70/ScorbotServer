function [rval] = SBGetPositXYZPR()
%Get Posit returns vector of 5 floats
global ScTCP;
if isvalid(ScTCP)
    if(SBIsInitDone())
        cmd = [uint8(6)];
        write(ScTCP,cmd);
        while(ScTCP.BytesAvailable == 0)
        end
        rval = read(ScTCP,5,'double');
    else
        disp('Init Failure - run Start_SB_Session first');
        rval = 0;
    end
else
    disp('Init Failure - run Start_SB_Session first');
    rval = 0;
end
end

