function End_SB_Session()
%End_SB_Session ends SB server session
global ScTCP;
if(isvalid(ScTCP) == 1)
    cmd=[uint8(127)];
    write(ScTCP,cmd);
    disp('Session Ended');
    delete(ScTCP);
    clear ScTCP;
    else
    disp('Session Not Open');
end
end

