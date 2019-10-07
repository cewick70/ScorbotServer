function [rval] = SBIsInitDone()
%Checks to see if Init is done
global ScTCP;
if(isvalid(ScTCP))
   vec = SBGetStatus();
   if(vec(1) == 'S' && vec(2) == 1) %initialization done 
       rval = 1;
   else
       rval = 0;
   end
else
    disp('Error - Must Start_SB_Session First');
    rval = 0;
end    
end

