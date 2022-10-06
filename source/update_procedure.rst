Update Procedure
================

Upgrading from LINUS Control v2.x to LINUS Control v2.3
--------------------------------------------------------

• Set your wired ethernet interface to 192.168.1.250 / 255.255.0.0
• Disable all other network interfaces, including Wi-Fi.
• Check your interface IP, Subnet Mask, and check you have disabled all other network interfaces, **including Wi-Fi**.
• Close any existing instance of LINUS Control.
• Launch LINUS Control v2.3.
• Click the Online button in the top right of the window.
• Network scanning will now start. In the bottom taskbar, an icon will be presented, showing how many amplifiers have been detected on the network. Click this button:

.. image:: assets/images/update_procedure/amplifierdiscoveryidentity.png
    :align: center

|

• You will now be presented with a view on the left of the workspace, showing you which units have been found on the network.  The units are shown with a Red ‘Update Firmware’ button beside them. Click all of these.

.. image:: assets/images/update_procedure/firmwayupdaterequired.png
    :align: center
    :width: 300

|

.. note::
    If after pressing the ‘Update Firmware’ button, it reappears again after a short period of time, power cycle the amplifier.  Once the ‘Update Firmware’ button is pressed, the amplifiers will disappear out of the discovery list.  Please wait at least 30 seconds for the amplifiers to show up again in the discovery list.

• The Front Panel LCD may present an error code, stating that the amplifier cannot find the Speaker Library. The error should be ignored.

.. image:: assets/images/update_procedure/statewindows.png
    :align: center
    
|

.. note::
    LINUS10-C’s and LINUS5-C’S will require a power-cycle at this point. 
    
    Unplug the AC Power, wait 5 seconds, and re-insert AC Power when prompted.


• When the firmware has been updated on these devices, they will return to the discovery list, but they will not contain the speaker library. Please proceed to click the red ‘Update Speaker Lib’ button to continue:

.. image:: assets/images/update_procedure/firmwayupdaterequired2.png
    :align: center
    :width: 300

|


• When the speaker library has been pushed to all the devices, they will appear in the discovery list, as shown below:

.. image:: assets/images/update_procedure/pushspeakerlibrary.png
    :align: center
    :width: 300

|

• Press the ‘Add all to workspace’ button to finish the process. 

.. image:: assets/images/update_procedure/addalltoworkspace.png
    :align: center
    :width: 300

|


• The units are now ready to be deployed in an active system.


LINUS Amplifier Firmware Version
---------------------------------

The following firmware is included with LINUS Control v2.3:

+-----------------------+-------------------+
| Product               | Firmware Version  |
+=======================+===================+
| LINUS CON             | V1.69             |
+-----------------------+-------------------+
| LINUS 14 / LINUS14-D  | V3.69             |
+-----------------------+-------------------+
| LINUS10               | V2.69             |
+-----------------------+-------------------+
| LINUS12C              | V3.69             |
+-----------------------+-------------------+
| LINUS10-C             | V5.69             |
+-----------------------+-------------------+
| LINUS5-C              | V5.69             |
+-----------------------+-------------------+
