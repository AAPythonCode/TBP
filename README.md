# TBP (Tennis Ball Picker)

Hey!

It's summer break, and I want to create something cool! Since I play tennis on a daily basis, I thought of creating something related to it. Therefore, I thought of creating a tennis ball picker that could collect tennis balls for the user, without collecting other players'.


I brainstormed many ideas, but in the end I thought of using cones on each of the four corners of the court to track the bot. Each cone would have a DWM1000 and a ESP32-WROOM-32, a low-cost programmable chip. The bot would also have the same, slightly modified board, which would use the distance data from each of the cones to find where it would be in relation to them. Here's a drawing I made:

The white dots are the cones, the arrows are the UWB signals, and the blue rectangle is the bot.
