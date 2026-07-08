# TBP (Tennis Ball Picker)

Hey!

Check out my JOURNALS.MD [here](https://github.com/AAPythonCode/TBP/blob/main/JOURNALS.md)

It's summer break, and I want to create something cool! Since I play tennis on a daily basis, I thought of creating something related to it. Therefore, I thought of creating a tennis ball picker that could collect tennis balls for the user, without collecting other players'.


I brainstormed many ideas, but in the end I thought of using cones on each of the four corners of the court to track the bot. Each cone would have a DWM1000 and a ESP32-WROOM-32, a low-cost programmable chip. The bot would also have the same, slightly modified board, which would use the distance data from each of the cones to find where it would be in relation to them.

Here's a drawing I made (painfully, my hand was shaking lol, did this on a phone):

<img width="239" height="335" alt="image" src="https://github.com/user-attachments/assets/3ddf9586-d587-48ed-82f2-d75bfe6c964c" />

# Bill Of Materials
## BOM For LCSC Parts:
| Index | LCSC#     | MPN                | Manufacturer              | Package              | Customer # | Description                                                                              | RoHS | Quantity | MOQ | Multiple | Unit Price($) | Extended Price($) | Product Link                                       |
|-------|-----------|--------------------|---------------------------|----------------------|------------|------------------------------------------------------------------------------------------|------|----------|-----|----------|---------------|-------------------|----------------------------------------------------|
| 1     | C5241969  | DW1000-I-TR13      | Qorvo                     | QFN-48(6x6)          |            | 6.8Mbps -107dBm 3.244GHz~6.999GHz 2.8V~3.6V QFN-48(6x6) RF Transceiver ICs RoHS          | yes  | 5        | 1   | 1        | 7.1224        | 35.61             | https://www.lcsc.com/product-detail/C5241969.html  |
| 2     | C2907044  | FRC0603F5101TS     | FOJAN                     | 0603                 |            | 5.1kΩ ±1% 100mW 0603 Thick Film Resistor                                                 | yes  | 100      | 100 | 100      | 0.0028        | 0.28              | https://www.lcsc.com/product-detail/C2907044.html  |
| 3     | C717453   | S8050              | LGE                       | TO-92                |            | Bipolar (BJT) Transistor NPN 25V 500mA 150MHz 625mW Through Hole TO-92                   | yes  | 20       | 20  | 20       | 0.0273        | 0.55              | https://www.lcsc.com/product-detail/C717453.html   |
| 4     | C19273151 | YLED0603G          | YONGYUTAI                 | 0603                 |            | Emerald Green LED Indication - Discrete 2.7V~3.2V 0603                                   | yes  | 100      | 100 | 100      | 0.0059        | 0.59              | https://www.lcsc.com/product-detail/C19273151.html |
| 5     | C141517   | TB6612FNG,C,8,EL   | TOSHIBA                   | SSOP-24              |            | SSOP-24 Motor Drivers, Controllers RoHS                                                  | yes  | 1        | 1   | 1        | 1.1283        | 1.13              | https://www.lcsc.com/product-detail/C141517.html   |
| 6     | C695629   | DB301V-3.5-2P-GN-S | DORABO                    | Through Hole,P=3.5mm |            | 2 Position Wire to Board Terminal Block Through Hole 3.5mm                               | yes  | 5        | 5   | 5        | 0.0842        | 0.42              | https://www.lcsc.com/product-detail/C695629.html   |
| 7     | C91606    | GRM188R61E106MA73D | muRata                    | 0603                 |            | 10uF ±20% 25V Ceramic Capacitor X5R 0603                                                 | yes  | 5        | 5   | 5        | 0.1326        | 0.66              | https://www.lcsc.com/product-detail/C91606.html    |
| 8     | C2762594  | CL10A226MO7JZNC    | Samsung Electro-Mechanics | 0603                 |            | 22uF ±20% 16V Ceramic Capacitor X5R 0603                                                 | yes  | 5        | 5   | 5        | 0.1892        | 0.95              | https://www.lcsc.com/product-detail/C2762594.html  |
| 9     | C207830   | SLO0420H4R7MTT     | Sunltech                  | SMD,4.2x4.2mm        |            | 2.2A 4.7uH ±20% 3A 84mΩ Molded Inductor SMD,4.2x4.2mm Fixed Inductors RoHS               | yes  | 5        | 5   | 5        | 0.1370        | 0.69              | https://www.lcsc.com/product-detail/C207830.html   |
| 10    | C1590     | CL10B104KA8NNNC    | Samsung Electro-Mechanics | 0603                 |            | 100nF ±10% 25V Ceramic Capacitor X7R 0603                                                | yes  | 50       | 50  | 50       | 0.0135        | 0.68              | https://www.lcsc.com/product-detail/C1590.html     |
| 11    | C98220    | RC0603FR-0710KL    | YAGEO                     | 0603                 |            | 100mW 10kΩ 75V Thick Film Resistor ±100ppm/℃ ±1% 0603 Chip Resistor - Surface Mount RoHS | yes  | 100      | 100 | 100      | 0.0051        | 0.51              | https://www.lcsc.com/product-detail/C98220.html    |
| 12    | C328062   | ESP32-WROOM-32U-N4 | ESPRESSIF                 | SMD,19.2x18mm        |            | 2.4GHz ESP32-DOWD -97dBm SMD,19.2x18mm RF Transceiver Modules and Modems RoHS            | yes  | 5        | 1   | 1        | 4.0964        | 20.48             | https://www.lcsc.com/product-detail/C328062.html   |


## BOM For Everything Else:
| Product | Price | Manufacturer | Quantity | Link |
|---------|-------|--------------|----------|------|
Battery For Bot | $14.99 | Amazon | 1 | [Link](https://www.amazon.com/gp/product/B0CLP15SLC/ref=ox_sc_act_title_2?smid=A1V8BF11JVAS3U&psc=1)
Battery For Cone | $6.99 | Amazon | 4 | [Link](https://www.amazon.com/gp/product/B0GDQMKQ36/ref=ox_sc_act_title_1?smid=A3D73VGGFFG885&psc=1)
Caster Wheel (1 inch) | $6.89 | Amazon | 1 | [Link](https://www.amazon.com/Suiwotin-Casters-Replacement-Furniture-Cabinet/dp/B0C6JM7R2C/ref=sr_1_1?crid=G9WRSFY5IU30&dib=eyJ2IjoiMSJ9.7-JBT1HsoIndO6Nb_8mkSWVhn_iG1l5bbaN72kEroFq0E59IKfvyAlzAbGhL28Qy0klFiTsaZ9NMhDen2mC3Amcu-PpbKVTANfx0Uxh-y3oR3J0IiuYsMEy8AlGZf1hDu7_Nkn3xwIBqfYD3LpzfmKYA78j-cPIgqK75zkbXJZtpSlZKJ1o28_MMSl6raOjAua3VqijRvSrvi3kahNN8uuCBq-4MeWqScNZLNkaJBLk.mjZqq4LFhEt1wzEfHjUGeLU96UFfIbHFmp24r8qmJlg&dib_tag=se&keywords=caster%2Bwheel%2B2inch%2Bfor%2Bfurniture%2Bplate%2Bmount%2B2%2Bpcs&nsdOptOutParam=true&qid=1783467828&refinements=p_36%3A-800&rnid=2661611011&sprefix=caster%2Bwheel%2B2inch%2Bfor%2Bfurniture%2Bplate%2Bmount%2B2%2Bpc%2Caps%2C195&sr=8-1&th=1)
Wheels | $8.99 | Amazon | 1 | [Link](https://www.amazon.com/Treedix-Rubber-Wheels-Robots-Accessories/dp/B0C6JQ3SDV/ref=sr_1_5?crid=LT1E64SMK8DA&dib=eyJ2IjoiMSJ9.awoBanjzrgHl3tI0D77b5RNG2dffKAO0oo4yJrOc1kHzdrInb6ZoXKw90Ve8us4pWzeOlHGZ5KDfKYcSYEdhvtauqWzAx3lEpdDOfwfmiuDJwOUwvHS70jOGsrHv2CR0Y3m6yYTIKTFTdsv3E5NFkYRAi7DiMbMLsYx3pVtG5vuEl0EObCmxL1dkWiXQnaeznvMTgZPkgcO2iHjpmHHoLoXabOmE_3wApZIKlKuwjAIDr3xnKqFb0PQJwKi0dqToYY1tAby0jr_HiE8TZ5x1EXn7efFjrWkY5s63-5Wn0k4.AdklVtbXyX2xDFOpfSxznmwet_xxvoF58I6qsaLug7Y&dib_tag=se&keywords=wheel+for+robot&qid=1783490228&sprefix=wheel+for+robo%2Caps%2C368&sr=8-5)

### GRAND TOTAL: $375.58

# Images
Now for some images! Take it all in... :)

## The Schematic
<img width="534" height="368" alt="image" src="https://github.com/user-attachments/assets/c4bb2e26-4b95-4d66-b6ee-2cc1f76aa3eb" />

## The LED
<img width="104" height="48" alt="image" src="https://github.com/user-attachments/assets/9fee0226-673f-4b7c-bbf5-5f12aa8870fb" />

## The DWM1000 + ESP32-WROOM-32 (from left to right, respectively.)
<img width="661" height="395" alt="image" src="https://github.com/user-attachments/assets/581a50db-ebbe-4d9b-b74f-ec36e3bf7284" />

## Transistors
<img width="163" height="149" alt="image" src="https://github.com/user-attachments/assets/07925b15-eda8-4132-8d01-e52749eed335" />

## The Full PCB
<img width="912" height="806" alt="image" src="https://github.com/user-attachments/assets/e94c6be9-e666-4af1-bfdc-53490d2dfaea" />

## The PCB in 3D
<img width="634" height="425.333333333333333333333333333333333333333333333333333" alt="image" src="https://github.com/user-attachments/assets/d63b314e-e787-49ff-aa76-86967801fe52" />


