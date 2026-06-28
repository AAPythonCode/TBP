# June 24, 2026
## Brainstorming + Research!

It's summer break, and I want to create something cool! Since I play tennis on a daily basis, I thought of creating something related to it. Therefore, I thought of creating a tennis ball picker that could collect tennis balls for the user, without collecting other players'.

To start, I researched on what the picker would need. For the very basic things, the picker should...
- Collect tennis balls
- Not go out of the tennis court
- Store the balls

I started with tracking the picker, as it would tackle number 2 on the list: keep the picker in the court. So, I researched on tracking an object in space, where the x and y axes changed, and the z axis remained stationary.

At first, on a [Reddit forum](https://www.reddit.com/r/arduino/comments/kv0y2y/best_way_to_track_an_object_or_a_person_in_local/), I found lidar tracking, which allowed for a very precise tracking system. However, after further research, even hobby lidar sensors (such as the SLAMTEC RPLIDAR A1) seemed far too expensive. 

However, after searching for a low-cost, low-energy tracking device, I stumbled upon ultra-wideband technology, which according to [Wikepedia](https://en.wikipedia.org/wiki/Ultra-wideband), is a "radio technology that can use a very low energy level for short-range, high-bandwidth communications over a large portion of the radio spectrum."

Perfect! I immediately reserached on how it could track things, and found the DWM1000, a chip that used this same technology to track how far two chips were in space! According to its datasheet, it had a ±10cm accuracy per chip. Here's a demo video I found: [Video](https://www.youtube.com/watch?v=ECUdwzs8Sc8)

I brainstormed many ideas, but in the end I thought of using cones on each of the four corners of the court to track the bot. Each cone would have a DWM1000 and a ESP32-WROOM-32, a low-cost programmable chip. The bot would also have the same, slightly modified board, which would use the distance data from each of the cones to find where it would be in relation to them. Here's a drawing I made:

<img width="358" height="502" alt="Screenshot 2026-06-28 at 3 50 48 PM" src="https://github.com/user-attachments/assets/089317ab-5a0b-4514-8526-0b18ad760e9f" />

The white dots are the cones, the arrows are the UWB signals, and the blue rectangle is the bot. 

Next, I'm planning to create the schematic for the custom boards!

### Total Time Spent: 6.5 hours


​
# June 26, 2026
## Creating the schematic
This is my favorite part of the project: creating the schematic for the to-be build!

I started by improting all of the parts into the schematic! Luckily, the DWM1000 was already a present part, and I didn't need to find a matching symbol+footprint+3D model online! That was close!

Next, I referenced the [DWM1000's Data Sheet](https://github.com/user-attachments/files/29435176/DWM1000.Data.Sheet.pdf) to wire the ESP32-WROOM-32 to the DWM1000. However, it wasn't that simple...

The DWM1000 and ESP32-WROOM-32 needed a voltage regulator, and since the ESP32-WROOM-32 didn't have a native UART converter, I had to source that too. Moreover, I had to install a USB TYPE-C VBUS to install software onto each of the boards. In the end, I chose the AMS1117-3.3 to regulate the volgate from the VBUS, and a CH340C to convert the data from the VBUS to programmable data for the ESP32-WROOM-32. 

For the VBUS itself, I chose the USB_C_Receptacle_CNCTech_C-ARA1-AK51X. Though it sounds complicated, it was the only VBUS that matched the symbol, so I had to choose it. 

Moreover, each of the chips and other miscellaneous items required their very own resistors and capacitors, so I had to add that as well. These were sourced from their respecive datasheets. 

As a bonus, I added an LED as an indicator to indicate power to the PCB, and mounting holes that I'll need later.

In all, today was a productive session! Here's some images for this session:


**The Schematic**

<img width="801" height="552" alt="Screenshot 2026-06-28 at 4 06 40 PM" src="https://github.com/user-attachments/assets/a712d833-af02-43b3-8f92-476afe74eabf" />

Phew, that took long!

**The LED**

<img width="156" height="72" alt="Screenshot 2026-06-28 at 4 09 48 PM" src="https://github.com/user-attachments/assets/ae937ac0-4584-4f5d-b345-069b41337311" />

That'll help later!

**The DWM1000 + ESP32-WROOM-32 (from left to right, respectively.)**

<img width="991" height="592" alt="Screenshot 2026-06-28 at 4 11 26 PM" src="https://github.com/user-attachments/assets/610dd74c-1c59-4b01-b990-212983097835" />

too. many. wires. 🏳️

P.S. I added transistors to automate the flashing process, so I could flash code without having to press a button!
Also, I added labels to each of the resistors and caps. 

<img width="244" height="223" alt="Screenshot 2026-06-28 at 4 14 14 PM" src="https://github.com/user-attachments/assets/78e4c56a-c12b-4248-8771-96f92c89dd3f" />

### Total Time Spent: 4 hours

​

# June 27, 2026
## Creating the PCB (for the cones only, didn't route anything yet)
Not much to say here, but I've finished the PCB!

To start, I rearranged all of the components, so they all were compact, and could fit nicely in small cones. This was pretty difficult, as I had to keep everything laid correctly, and everything also needed to be (and look) polished! 

Moreover, I was planning to add a capacitor right next to the VOUT of the CH340C, as it would prevent electrical noise and keep the data sent from the USBC VBUS the way it was. This was really important, and so I built my PCB around it once I put the capacitor in the correct spot! (Check the second image in the images section)

To finish the PCB off, I added some silkscreen decoration on the corners (they were empty) and added mounting holes!

In all, I feel that this step of the build wasn't too difficult, though it was slightly hard to arrange all of the parts correctly and neatly! Anyways, here are the images for the journal:

**The Full (Unrouted) PCB**

<img width="456" height="403" alt="Screenshot 2026-06-28 at 4 37 48 PM" src="https://github.com/user-attachments/assets/fb6dcb2c-2a21-4416-b958-de7af7ee49f9" />

time to route... 🫡🥲

**The Capacitor**

<img width="288" height="107" alt="Screenshot 2026-06-28 at 4 38 21 PM" src="https://github.com/user-attachments/assets/b0c9c215-b0e0-4925-803c-610ab32fd6cc" />

It's more important than it seems 😈

**The PCB In 3D**

<img width="951" height="638" alt="Screenshot 2026-06-28 at 4 34 43 PM" src="https://github.com/user-attachments/assets/c341c097-b693-4dd6-939e-758f17440d27" />

we have expanded into the THIRD dimension!

### Total Time Spent: 3.5 hours

