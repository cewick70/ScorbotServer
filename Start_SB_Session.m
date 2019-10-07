function  [rval] = Start_SB_Session()
%Start_SB_Session - start a Scorbot session
%   Starts Scorbot tcp server program
%   Then initializes Scorbot dll
%   returns tcp object variable
global ScTCP;
%!C:\Scorbot\Projects\ScorbotServer\debug\ScorbotServer &
!C:\Intelitek\Scorbase\Bin\ScorbotServer &
ScTCP=tcpclient('127.0.0.1',8897);
ex=isvalid(ScTCP);
if(ex==1)
    % If client is successful, try to initialize dll
    tmp = SBInit();
    if(tmp == 1)
        tmp1=0;
        tmp2=0;
        tmp1 = SBDefineVector;
            if(tmp1 == 1)
                tmp2= SBHome;
            end
    end
    if((tmp ==1) && (tmp1==1) && (tmp2==1))
        rval = 1;
    else
        disp('Init Failure - check power and teach pad on auto');
        rval = 0;
    end
else
    disp('Init Failure - check power and teach pad on auto');
    rval = 0;
end
    
end

