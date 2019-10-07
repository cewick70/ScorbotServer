function SBWaitMotionDone()
%Wait until motion signals completion
tmpf = 0;
while(tmpf == 0)
    tmp = SBGetStatus();
    if((tmp(1) == 'S') && (tmp(5) == 1))
        tmpf = 1; 
    else
        tmpf = 0;
    end
end
end

