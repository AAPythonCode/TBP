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

Next, I made a drawing on how the DWM1000s would track the bot. I brainstormed many ideas, but in the end I thought of using cones on each of the four corners of the court to track the bot. Each cone would have a DWM1000 and a ESP32-WROOM-32, a low-cost programmable chip. The bot would also have the same, slightly modified board, which would use the distance data from each of the cones to find where it would be in relation to them. Here's a drawing I made:

<img width="358" height="502" alt="Screenshot 2026-06-28 at 3 50 48 PM" src="https://github.com/user-attachments/assets/089317ab-5a0b-4514-8526-0b18ad760e9f" />

The white dots are the cones, the arrows are the UWB signals, and the blue rectangle is the bot. 

Next, I'm planning to create the schematic for the custom boards!

### Total Time Spent: 6.5 hours
