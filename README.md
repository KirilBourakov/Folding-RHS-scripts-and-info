This repo contains scripts for folding@rhs and info about setting up FoldingRHS machines.

#Scripts
Currently, X11VNC auto set up works.

#Notes
##Folding itself
Folding@RHS has two essential components, the folding web controller which can be found at their website, and folding@control.
##Folding Control 
###Download
Do not use the controller on the folding website, it uses python2 and does not work with mint. I have left a zip file with the python3 version on the head computer (RHS4). It can also be found [here](https://github.com/cdberkstresser/fah-control). 
###Autorun
You will need to set up the script to auto run. This can be done by going to the 'session and startup' in linux mint. When there, click 'Application autostart', and then 'Add'. 
When there, give it the name and description you want. The trigger should be 'on login'. The command it runs should be "python3 [PLACEHOLDER]" where [PLACEHOLDER] is the location of the file "FAHcontrol". Note that this file does not have a file extension. The easiest way to set up this autorun is to click on the folder icon beside command, locate "FAHcontrol" within the directory that holds all the fahcontrol files, and select it. With that done, go to the start of the file, and type 'python3' followed by a space. 
Restart and ensure that FAH control autostarts
###Connecting to the main computer
You need acess to both the master and slave computer for this step. 
1. Within the master, open a terminal and type 'hostname -I' to get the ip address. 
2. Within the slave, acess FAH control, click 'configure', and head to the 'remote acess' tab. There, set a password. Ensure that port is set to 36330, and scroll down until you see 'IP address restriction'. 
3. The allow section should already have *127.0.0.1*. DO NOT DELETE THIS. In that section, add a space followed by the IP address of the master.
4. Note the IP address of the slave with 'hostname -I'
5. Within the FAHcontrol of the master, click 'add' (bottom left of main screen), and enter the slaves IP address and password. Choose a name for the folding machine, then enter it's ip address, port, and password.
6. restart both machines, and then ensure that the master shows the slave within its clients 
