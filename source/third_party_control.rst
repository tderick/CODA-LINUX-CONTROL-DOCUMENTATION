3rd Party Control Protocol
==========================

1.General
---------

The specifics of the 3rd Party Control Protocol are as follows:

    • The devices shall be controlled with UDP Datagrams.
    • UDP Communication should be kept to the minimum amount possible to configure the Amplifiers.
    • Redundant information should not be sent. 
    • A UDP message should always contain one command. 
    • UDP messages should always start with an asterisk (*).
    • UDP messages should be sent in ASCII format.
    • UDP messages should be sent to UDP Port 3000 on the devices.
    • All amplifiers will respond to messages sent to either their own IP address, or the broadcast address for the Host’s subnet, IE:

            ▪ For a subnet of 255.255.255.0, send to: 192.168.1.255 

            ▪ For a subnet of 255.255.0.0, send to: 192.168.255.255 and so on.

    • SET commands are not acknowledged by the amplifiers.
    • GET commands will be responded to by the amplifier, always to the IP of the Host where the message originated, **not** to the broadcast address.
    • The amplifiers should only be controlled either by the LINUS Control software, -or- the 3rd Party Control Protocol, not both.


.. note::
    For example in a typical bar installation, the system would be commissioned with LINUS Control, allowing for easy real-time control of all aspects of the design. When the commissioning engineer is ready to commit the design, they would simply save the system in one or more ‘Snapshots’ inside the Amplifier. LINUS Control can then be taken out of the equation, and the system can be remotely controlled by the 3rd Party Control protocol, for instance, with a wall remote capable of sending UDP Datagrams. The snapshots can be loaded using this protocol, and changes (such as gains and mutes) can be pushed as and when they are required. Loading the snapshot once again would take the installation back to the state where the commissioning engineer had left it. Snapshots can be made for different configurations, use purposes, times of day, and areas of operation.



2. Commands
------------

2.1. *GETDEVINFO
++++++++++++++++

This message would typically be sent to the broadcast address to determine which amplifiers are present on the network & what their IP address and MAC address are. 
The MAC address is necessary for the *CHANGEIP command detailed in section 2.2.
	
Message Format:		*GETDEVINFO 

Message Reply Format:	*DEVINFO_X_Y

					Where X = Amplifier Model

					Where	Y = MAC Address of Amplifier

Example Reply:		*DEVINFO_LINUS10_001555F01234

Reply Explanation: 	A LINUS10 was discovered with the MAC Address 00:15:55:F0:12:34.


2.2. *CHANGEIP
++++++++++++++

This message is used to set the IP address of the amplifier in question. 
The message requires knowledge of the amplifier’s MAC Address, which can be obtained with the *GETDEVINFO command detailed in section 2.1.

This message can either be sent to the individual amplifier directly (to its IP Address) or to the broadcast address, in which case only the amplifier with the matching MAC address will change to the nominated IP.

Message Format:		*CHANGEIP=X:Y

						Where X = Desired new IP †

						Where Y = Target Amplifier MAC Address

.. warning::
    [† - The IP must be sent as a string of 15 characters – IE 192.168.1.1 must be sent as 192.168.001.001]. The device will accept the new IP Address immediately, but it may take up to 10 seconds for the Front Panel LCD to update to reflect the change. Pressing the ESC key on the Front Panel will immediately refresh the display.

Example Message:		*CHANGEIP=192.168.001.022:001555F01234

Example Explanation:		Change the IP of the unit with the MAC Address 00:15:55:F0:12:34 to 192.168.1.22

Message Reply Format:	No reply

Example Reply:		No reply

Reply Explanation:		No reply



2.3. *LOADSNAPSHOT	
++++++++++++++++++

This message is used to load a specific snapshot, either on one amplifier if the message is sent to just one IP, or to the whole system if the message is sent to the Broadcast Address. 

Message Format:		*LOADSNAPSHOT=X  Where X = The snapshot number to load (1-20). 

.. note::
    loading snapshot #21 will recall the previous state of the amplifier, from when LINUS Control was last connected.

.. list-table:: 
   :widths: 25 25 

   * - Message Reply Format:	
     - No reply

   * - Example Reply:		
     - No reply
   
   * - Reply Explanation:		
     - No reply

   * - Data Validation:		
     - X Must be an integer between 1 and 20 inclusively.



2.4. *GET_ACT_SNAPSHOT
++++++++++++++++++++++

This message is used to read back the snapshot number & name, either on one amplifier if the message is sent to just one IP, or to the whole system if the message is sent to the Broadcast Address. 

Message Format:		*GET_ACT_SNAPSHOT

Message Reply Format:	*ACT_SNAPSHOT=X,Y

					Where X = Snapshot Number (1 – 20)

					Where Y = Snapshot Name (max 16 chars)

Example Reply:		*ACT_SNAPSHOT = 3,Daytime

Reply Explanation:		The active snapshot is number 3. 

				The active snapshot has the name “Daytime”.

2.5. *SET_MUTE 
++++++++++++++

This message is used to set and unset the output channel mutes on the amplifier. 
It has the same effect as the user pressing the front panel mute buttons. 

The message can either be sent to just one IP, or to the whole system if the message is sent to the Broadcast Address.

Message Format:		*SET_MUTE=X,Y

					Where X = Channel (1 - 4)

					Where Y = Muted = 1, Unmuted = 0

Example Message:		*SET_MUTE=2,1

Example Explanation:		Mute channel 2.

Message Reply Format:	No reply

Example Reply:		No reply

Reply Explanation:		No reply 

Data Validation:		X Must be an integer 1 through 4 inclusively.

				Y Must be a 1 or a 0.

2.6. *GET_MUTE
++++++++++++++

This message is used to read the mute state of the amplifier output channels. 
The message can either be sent to just one IP, or to the whole system if the message is sent to the Broadcast Address.

Message Format:		*GET_MUTE=X

					Where X = Channel (1 - 4)

Example Message:		*GET_MUTE=3

Example Explanation:		Get the mute state of Amplifier Channel 3.

Message Reply Format:	*MUTE=Y

					Where Y = Muted = 1, Unmuted = 0

Example Reply:		*MUTE=0

Reply Explanation:		Amplifier Channel 3 is unmuted.

2.7. *SET_GAIN
++++++++++++++

This message is used to set the output gain of the output channel. It is the same gain as addressed by the tuning groups in both LINUS Control and the Front Panel. 

The message can either be sent to just one IP, or to the whole system if the message is sent to the Broadcast Address.

Message Format:		*SET_GAIN=X,Y,Z

					Where X = Channel (1 - 4) 

					Where Y = set this parameter to 0 in all cases.

					Where Z = Gain in 10ths of dB

Example Message:		*SET_GAIN=1,0,-98

Example Explanation:		Set amplifier output channel 1 gain to -9.8dB.

Message Reply Format:	no reply

Example Reply:		no reply

Reply Explanation:		no reply

Data Validation:		X Must be an integer between 1 and 4 inclusively.

				Y Must be the number 0 in all cases.

				Z Must be a number between -990 and 150 inclusively. 




2.8. *GET_GAIN
++++++++++++++

This message is used to read the output gain state of the amplifier output channels. It is the same gain as used by the tuning groups in both LINUS Control and the Front Panel.  The message can either be sent to just one IP, or to the whole system if the message is sent to the Broadcast Address.

Message Format:		*GET_GAIN=X,Y

					Where X = Channel (1 - 4)

					Where Y = set this parameter to 0 in all cases.

Example Message:		*GET_GAIN=2

Example Explanation:		Get the gain value of Amplifier Channel 3.

Message Reply Format:	*GAIN=X,Y,Z

					Where X = Channel (1 - 4)

					Where Y = 0

					Where Z = Gain in 10ths of dB.

Example Reply:		*GAIN=3,0,64

Reply Explanation:		Amplifier Channel 3’s output gain is +6.4dB.

2.9. *SET_DELAY
+++++++++++++++

This message is used to set the output delay of the output channel. It is the same delay as addressed by the tuning groups in both LINUS Control and the Front Panel. 

The message can either be sent to just one IP, or to the whole system if the message is sent to the Broadcast Address.

Message Format:		*SET_DELAY=X,Y,Z

					Where X = Channel (1 - 4) 

					Where Y = set this parameter to 0 in all cases.

					Where Z = Delay in Samples @96kHz.

Example Message:		*SET_DELAY=1,0,480

Example Explanation:		Set amplifier output channel 1 delay to 5ms.

Message Reply Format:	no reply

Example Reply:		no reply

Reply Explanation:		no reply

Data Validation:		X Must be an integer between 1 and 4 inclusively.

				Y Must be the number 0 in all cases.

				Z Must be a number between 0 and 96000 inclusively. †

.. note::
    LINUS 5-C and 10-C Support a maximum of 200ms delay per output channel. So in this instance the range for Z would be 0..19200.


2.10. *GET_DELAY
++++++++++++++++

This message is used to read the output delay state of the amplifier output channels. It is the same delay as used by the tuning groups in both LINUS Control and the Front Panel.  The message can either be sent to just one IP, or to the whole system if the message is sent to the Broadcast Address.

Message Format:		*GET_DELAY=X,Y

					Where X = Channel (1 - 4) 

					Where Y = set this parameter to 0 in all cases.

Example Message:		*GET_DELAY=0

Example Explanation:		Get the gain value of Amplifier Channel 1.

Message Reply Format:	*DELAY=X,Y,Z

					Where X = Channel (1 - 4)

					Where Y = 0

					Where Z = delay in samples @ 96kHz.

Example Reply:		*DELAY=1,0,11664

Reply Explanation:		Amplifier Channel 1’s output delay is 121.500ms.


2.11. *SET_FALLBACK
+++++++++++++++++++

This message is used to set the Amplifiers Fallback state to either ON or OFF.
This message can either be sent to just one IP, or to the whole system if the message is sent to the Broadcast Address. 

Message Format:		*SET_FALLBACK=X

					Where X = Enabled = 1, Disabled = 0 

Example Message:		*SET_FALLBACK=0

Example Explanation		The amplifier has Analog Fallback disabled. 

Message Reply Format:	no reply

Example Reply:		no reply

Reply Explanation:		no reply

Data Validation:		X Must be 1 or 0.



2.12. *GETFALLBACK
++++++++++++++++++

This message is used to read the Fallback state of the chosen amplifier. 
The message can either be sent to just one IP, or to the whole system if the message is sent to the Broadcast Address.

Message Format:		*GET_FALLBACK 

Example Message:		*GET_FALLBACK

Example Explanation:		Get the Fallback state for the chosen amplifier.

Message Reply Format:	*FALLBACK=Y

					Where Y = 1 = Enabled, 0 = Disabled.

Example Reply:		*FALLBACK=1

Reply Explanation:		Fallback is enabled on this amplifier. 

2.13. *SET_FALLBACKFORCE
++++++++++++++++++++++++

This message forces the targeted amplifiers to go to their analog backup immediately, if they have Fallback enabled. If they do not have Fallback enabled, they will not do anything.

The message can either be sent to just one IP, or to the whole system if the message is sent to the Broadcast Address.

Message Format:		*SET_FALLBACKFORCE 

Example Message:		*SET_FALLBACKFORCE

Example Explanation:		The amplifier will immediately go to its analog backup source 
if it has Fallback enabled.

Message Reply Format:	no reply

Example Reply:		no reply

Reply Explanation:		no reply

Data Validation:		no parameters passed 

2.14. *SET_FALLBACKRECOVER
+++++++++++++++++++++++++++

This message forces the targeted amplifiers to go to their digital source, if they are in analog Fallback & the digital source is enabled again. If the amplifier does not have Fallback enabled, they will not do anything.

The message can either be sent to just one IP, or to the whole system if the message is sent to the Broadcast Address.

Message Format:		*SET_FALLBACKRECOVER

Example Message:		*SET_FALLBACKRECOVER

Example Explanation:		The amplifier will test its digital signal and if it is available 
again, it will recover to this.

Message Reply Format:	no reply

Example Reply:		no reply

Reply Explanation:		no reply

Data Validation:		no parameters passed 

2.15. *SET_POWER††
++++++++++++++++++

This message is used to turn the amplifiers into and out of Standby Mode. There is a delay parameter which can be used to sequence the power up to prevent inrush currents when many amplifiers are switched on in an installation. This message can either be sent to just one IP, or to the whole system if the message is sent to the Broadcast Address, but to benefit from the time delay, individual power on messages should be sent, with different delay times.

Message Format:		*SET_POWER=X,Y

					Where X = ON = 1, STANDBY = 0

					Where Y = time delay in seconds †

Example Message:		*SET_POWER=1,3

Example Explanation:		The amplifier will power on after a 3 second delay. 

Message Reply Format:	no reply

Example Reply:		no reply

Reply Explanation:		no reply

Data Validation:		X Must be 1 or 0.

				Y Must be a positive integer up to and including 30.

.. note::
    the time delay is only applicable for turning amplifiers ON, the value is ignored for turning amplifiers into standby. You still must include the Y parameter when sending the amplifiers into Standby however, just set it to 0.

.. note::
    only LINUS14 / LINUS 14D / LINUS12C/ LINUS5-C and LINUS10-C are capable of Standby mode. LINUS 10 and LINUS CON cannot be remotely controlled due to hardware design. 

2.16. *CLEARGROUP
+++++++++++++++++

This message clears all the tuning filters and EQ from the selected amplifiers, leaving only their speaker files, routing, gain & delay. Filters & EQ are all ‘zeroed’. 

This message can either be sent to just one IP, or to the whole system if the message is sent to the Broadcast Address.

Message Format:		*CLEARGROUP

Example Message:		*CLEARGROUP

Example Explanation:		The amplifier will clear all group parameters from all channels.

Message Reply Format:	no reply

Example Reply:		no reply

Reply Explanation:		no reply

Data Validation:		no parameters passed