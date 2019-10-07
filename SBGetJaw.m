function [rval] = SBGetJaw()
%Gets Jaw opening in mm
global ScTCP;
if(isvalid(ScTCP))
    if(SBIsInitDone()) %initialization done
        lcmd=uint8(17);
        write(ScTCP,lcmd);
        %wait for a reply
        while(ScTCP.BytesAvailable == 0)
        end
        rval = read(ScTCP,1,'uint16');
    else
        disp('Error - Must Complete Initialization First');
        rval = 0;
    end
else
    disp('Error - Must Start_SB_Session First');
    rval = 0;
end

