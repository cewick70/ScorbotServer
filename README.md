# ScorbotServer
Server and 'M'-Files to Communicate between Matlab and a Scorbot on a 64 bit Matlab platform
The existing Scorbot Dll is incompatible with a 64 bit implementation of Matlab.  A new TCP/IP server program now allows 
Matlab and Scorbot to communicate with each side keeping to their own standards (64 bit Matlab, 32 bit Server/Scorbot Dll).
The Server program is written in MS Visual C++ (Visual Studio 2017).  Scorbot Server presents a simple read-only command window on
startup that keeps a running dialog of Matlab commands that are sent to the Scorbot via the TCP/IP interface.  
The server is currently implemented as local host only, (127.0.0.1) port 8897. Matlab M-Files implement Scorbot commands by building 
compatible communications vectors, which are then passed to the server program. 
The server program decodes incoming commands and parameters, reconfigures variables for C++ routines and then executes the desired function.
To use, you may need to have MS Visual Studio (2017) Community installed.  It is best also to have Intelitek's Scorbase program installed. 
Place the server executable in the .BIN directory of Scorbase to get access to the Scorbot files it needs.  Edit the Start_SB_Session Matlab
M-File so the included system command points to the location of the server executable.
In normal use, start a Matlab session by issuing Start_SB_Session in the Matlab command window.  This command will bring up a server
window, define a Scorbot vector for points and home the robot.  After homing is complete other functions allow for definition of individual
motion points and for moving to those points.  See the enclosed 'docx' file for additional information of the included M-Files.
