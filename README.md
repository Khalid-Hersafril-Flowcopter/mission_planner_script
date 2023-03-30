# Mission Planner Script

Before setting this up, ensure that your computer is connected to the CubePilot.

![image](https://user-images.githubusercontent.com/122445348/228844160-7ee86291-86cd-4d07-b820-5237d09db599.png)

In order for the automated scripting to work, you need to change the `SCR_ENABLE` parameter to 1.

Once that is done, navigate to the `MAVFtp` tab, and go to the `scripts` folder which can be found here:

![image](https://user-images.githubusercontent.com/122445348/228844669-2890e3bc-a176-4b75-accc-9decbfb5b9c4.png)

If the `scripts` folder does not exist, create the folder. Once that is done, right click inside the `scripts` folder, and choose the `upload` option. 

![image](https://user-images.githubusercontent.com/122445348/228848949-7098469b-635c-455d-9a3f-cfb948f7c106.png)

Upload the `.lua` script and disconnect the CubePilot and Reboot MissionPlanner (this is the only way I got it to work, so feel free to try other methods)

Once everything above is done, in the `Messages` tab inside the Flight Data, your console should be populated with some text as shown below.

![image](https://user-images.githubusercontent.com/122445348/228845664-252c7d1c-e2a6-4c27-b8b1-bb311fb977f3.png)


