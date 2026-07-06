# TBP (Tennis Ball Picker)

Hey!

Check out my JOURNALS.MD [here](https://github.com/AAPythonCode/TBP/blob/main/JOURNALS.md)

It's summer break, and I want to create something cool! Since I play tennis on a daily basis, I thought of creating something related to it. Therefore, I thought of creating a tennis ball picker that could collect tennis balls for the user, without collecting other players'.


I brainstormed many ideas, but in the end I thought of using cones on each of the four corners of the court to track the bot. Each cone would have a DWM1000 and a ESP32-WROOM-32, a low-cost programmable chip. The bot would also have the same, slightly modified board, which would use the distance data from each of the cones to find where it would be in relation to them.

Here's a drawing I made (painfully, my hand was shaking lol, did this on a phone):

<img width="239" height="335" alt="image" src="https://github.com/user-attachments/assets/3ddf9586-d587-48ed-82f2-d75bfe6c964c" />

BOM:
| Index | LCSC# | MPN | Manufacturer | Package | Customer # | Description | RoHS | Quantity | MOQ | Multiple | Unit Price ($) | Extended Price ($) | Product Link |
|------:|-------|-----|--------------|---------|------------|-------------|:----:|---------:|----:|---------:|---------------:|-------------------:|--------------|
| 1 | C5241969 | DW1000-I-TR13 | Qorvo | QFN-48 (6x6) | - | 6.8Mbps -107dBm 3.244GHz~6.999GHz 2.8V~3.6V QFN-48 (6x6) RF Transceiver ICs | Yes | 5 | 1 | 1 | $7.1224 | $35.61 | https://www.lcsc.com/product-detail/C5241969.html |
| 2 | - | ESP32-S32Mb | Ai-Thinker | - | - | - | - | 5 | 1 | 1 | $2.8780 | $14.39 | - |
| 3 | C2907044 | FRC0603F5101TS | FOJAN | 0603 | - | 5.1kΩ ±1% 100mW 0603 Thick Film Resistor | Yes | 100 | 100 | 100 | $0.0028 | $0.28 | https://www.lcsc.com/product-detail/C2907044.html |
| 4 | C717453 | S8050 | LGE | TO-92 | - | Bipolar (BJT) Transistor NPN 25V 500mA 150MHz 625mW Through Hole TO-92 | Yes | 20 | 20 | 20 | $0.0273 | $0.55 | https://www.lcsc.com/product-detail/C717453.html |
| 5 | C41361550 | CT4-0805-2X1-50V-0.1uF-K-Y | TORCH | Through Hole, P=5.08mm | - | 100nF ±10% 50V Through Hole, P=5.08mm Ceramic Capacitor | Yes | 5 | 5 | 5 | $0.0904 | $0.45 | https://www.lcsc.com/product-detail/C41361550.html |
| 6 | C95204 | RT0603BRD0710KL | YAGEO | 0603 | - | 100mW 10kΩ 75V Thin Film Resistor ±25ppm/℃ ±0.1% 0603 Chip Resistor | Yes | 20 | 20 | 20 | $0.0299 | $0.60 | https://www.lcsc.com/product-detail/C95204.html |
| 7 | C19273151 | YLED0603G | YONGYUTAI | 0603 | - | Emerald Green LED Indication – Discrete 2.7V~3.2V 0603 | Yes | 100 | 100 | 100 | $0.0059 | $0.59 | https://www.lcsc.com/product-detail/C19273151.html |
| 8 | C141517 | TB6612FNG,C,8,EL | TOSHIBA | SSOP-24 | - | SSOP-24 Motor Driver / Controller | Yes | 1 | 1 | 1 | $1.1283 | $1.13 | https://www.lcsc.com/product-detail/C141517.html |
| 9 | C695629 | DB301V-3.5-2P-GN-S | DORABO | Through Hole, P=3.5mm | - | 2 Position Wire-to-Board Terminal Block Through Hole 3.5mm | Yes | 5 | 5 | 5 | $0.0842 | $0.42 | https://www.lcsc.com/product-detail/C695629.html |
| 10 | C91606 | GRM188R61E106MA73D | muRata | 0603 | - | 10uF ±20% 25V Ceramic Capacitor X5R 0603 | Yes | 5 | 5 | 5 | $0.1716 | $0.86 | https://www.lcsc.com/product-detail/C91606.html |
| 11 | C2762594 | CL10A226MO7JZNC | Samsung Electro-Mechanics | 0603 | - | 22uF ±20% 16V Ceramic Capacitor X5R 0603 | Yes | 5 | 5 | 5 | $0.1906 | $0.95 | https://www.lcsc.com/product-detail/C2762594.html |


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


