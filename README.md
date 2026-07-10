# TBP (Tennis Ball Picker)

Hey!

Check out my JOURNALS.MD [here](https://github.com/AAPythonCode/TBP/blob/main/JOURNALS.md)

It's summer break, and I want to create something cool! Since I play tennis on a daily basis, I thought of creating something related to it. Therefore, I thought of creating a tennis ball picker that could collect tennis balls for the user, without collecting other players'.


I brainstormed many ideas, but in the end I thought of using cones on each of the four corners of the court to track the bot. Each cone would have a DWM1000 and a ESP32-WROOM-32, a low-cost programmable chip. The bot would also have the same, slightly modified board, which would use the distance data from each of the cones to find where it would be in relation to them.

Here's a drawing I made (painfully, my hand was shaking lol, did this on a phone):

<img width="239" height="335" alt="image" src="https://github.com/user-attachments/assets/3ddf9586-d587-48ed-82f2-d75bfe6c964c" />

# Bill of Materials (BOM)

### LCSC BOM:
| # | LCSC Part # | MPN | Manufacturer | Package | Quantity | Description |
|---:|-------------|-----|--------------|---------|---------:|-------------|
| 1 | C5241969 | DW1000-I-TR13 | Qorvo | QFN-48 (6×6 mm) | 5 | RF Transceiver IC, 3.244–6.999 GHz, 6.8 Mbps, −107 dBm, 2.8–3.6 V |
| 2 | C2907044 | FRC0603F5101TS | FOJAN | 0603 | 100 | 5.1 kΩ ±1%, 100 mW Thick Film Resistor |
| 3 | C717453 | S8050 | LGE | TO-92 | 20 | NPN BJT Transistor, 25 V, 500 mA, 150 MHz |
| 4 | C19273151 | YLED0603G | YONGYUTAI | 0603 | 100 | Emerald Green Indicator LED, 2.7–3.2 V |
| 5 | C141517 | TB6612FNG,C,8,EL | Toshiba | SSOP-24 | 1 | Dual H-Bridge Motor Driver |
| 6 | C695629 | DB301V-3.5-2P-GN-S | DORABO | Through Hole, 3.5 mm Pitch | 5 | 2-Position Wire-to-Board Terminal Block |
| 7 | C91606 | GRM188R61E106MA73D | Murata | 0603 | 5 | 10 µF ±20%, 25 V X5R Ceramic Capacitor |
| 8 | C2762594 | CL10A226MO7JZNC | Samsung Electro-Mechanics | 0603 | 5 | 22 µF ±20%, 16 V X5R Ceramic Capacitor |
| 9 | C207830 | SLO0420H4R7MTT | Sunltech | 4.2 × 4.2 mm SMD | 5 | 4.7 µH Molded Inductor, 2.2 A, 84 mΩ |
| 10 | C1590 | CL10B104KA8NNNC | Samsung Electro-Mechanics | 0603 | 50 | 100 nF ±10%, 25 V X7R Ceramic Capacitor |
| 11 | C98220 | RC0603FR-0710KL | YAGEO | 0603 | 100 | 10 kΩ ±1%, 100 mW Thick Film Resistor |
| 12 | C328062 | ESP32-WROOM-32U-N4 | Espressif | SMD, 19.2 × 18 mm | 5 | ESP32-WROOM-32U Wi-Fi/Bluetooth Module (External Antenna) |

## BOM For Everything Else:
| Product | Price | Manufacturer | Quantity | Link |
|---------|-------|--------------|----------|------|
Battery For Bot | $14.99 | Amazon | 1 | [Link](https://www.amazon.com/gp/product/B0CLP15SLC/ref=ox_sc_act_title_2?smid=A1V8BF11JVAS3U&psc=1)
Battery For Cone | $6.99 | Amazon | 4 | [Link](https://www.amazon.com/gp/product/B0GDQMKQ36/ref=ox_sc_act_title_1?smid=A3D73VGGFFG885&psc=1)
Caster Wheel (1 inch) | $6.89 | Amazon | 1 | [Link](https://www.amazon.com/Suiwotin-Casters-Replacement-Furniture-Cabinet/dp/B0C6JM7R2C/ref=sr_1_1?crid=G9WRSFY5IU30&dib=eyJ2IjoiMSJ9.7-JBT1HsoIndO6Nb_8mkSWVhn_iG1l5bbaN72kEroFq0E59IKfvyAlzAbGhL28Qy0klFiTsaZ9NMhDen2mC3Amcu-PpbKVTANfx0Uxh-y3oR3J0IiuYsMEy8AlGZf1hDu7_Nkn3xwIBqfYD3LpzfmKYA78j-cPIgqK75zkbXJZtpSlZKJ1o28_MMSl6raOjAua3VqijRvSrvi3kahNN8uuCBq-4MeWqScNZLNkaJBLk.mjZqq4LFhEt1wzEfHjUGeLU96UFfIbHFmp24r8qmJlg&dib_tag=se&keywords=caster%2Bwheel%2B2inch%2Bfor%2Bfurniture%2Bplate%2Bmount%2B2%2Bpcs&nsdOptOutParam=true&qid=1783467828&refinements=p_36%3A-800&rnid=2661611011&sprefix=caster%2Bwheel%2B2inch%2Bfor%2Bfurniture%2Bplate%2Bmount%2B2%2Bpc%2Caps%2C195&sr=8-1&th=1)
Wheels | $0.99 | AliExpress | 1 | [Link]([https://www.amazon.com/Treedix-Rubber-Wheels-Robots-Accessories/dp/B0C6JQ3SDV/ref=sr_1_5?crid=LT1E64SMK8DA&dib=eyJ2IjoiMSJ9.awoBanjzrgHl3tI0D77b5RNG2dffKAO0oo4yJrOc1kHzdrInb6ZoXKw90Ve8us4pWzeOlHGZ5KDfKYcSYEdhvtauqWzAx3lEpdDOfwfmiuDJwOUwvHS70jOGsrHv2CR0Y3m6yYTIKTFTdsv3E5NFkYRAi7DiMbMLsYx3pVtG5vuEl0EObCmxL1dkWiXQnaeznvMTgZPkgcO2iHjpmHHoLoXabOmE_3wApZIKlKuwjAIDr3xnKqFb0PQJwKi0dqToYY1tAby0jr_HiE8TZ5x1EXn7efFjrWkY5s63-5Wn0k4.AdklVtbXyX2xDFOpfSxznmwet_xxvoF58I6qsaLug7Y&dib_tag=se&keywords=wheel+for+robot&qid=1783490228&sprefix=wheel+for+robo%2Caps%2C368&sr=8-5](https://www.aliexpress.us/item/3256806316654821.html?spm=a2g0o.cart.0.0.771438dahKxQ5U&mp=1&pdp_npi=6%40dis%21USD%21USD+3.23%21USD+0.99%21%21USD+0.99%21%21%21%402101e56817836519046186348e0fdc%2112000045656283979%21ct%21US%21-1%21%211%210%21&_gl=1*1ysif6e*_gcl_au*MTM5NjU0MTYyNC4xNzgyMTg1MjIw*_ga*OTg3MTQ2MjQ4LjE3ODM2NDk2ODY.*_ga_VED1YSGNC7*czE3ODM2NTE3ODgkbzIkZzEkdDE3ODM2NTE5MDUkajE2JGwwJGgw&gatewayAdapt=glo2usa))
Motors | $4.34 | Amazon | 4 | [Link](https://www.amazon.com/gp/product/B0GXY1Y1XM/ref=ox_sc_act_title_2?smid=A3PMRUDTUKMNJ1&psc=1&s=bazaar)
DWM1000 | $0.80 | Alibaba | 5 | [Link](https://www.alibaba.com/product-detail/Electronic-components-integrated-circuits-semiconductor-New_1601393696798.html?spm=a2756.trade-order-standard.0.0.e08265aaEoXY4F)
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

## The Full Bot PCB
<img width="780" height="525" alt="Screenshot 2026-07-08 at 1 22 33 PM" src="https://github.com/user-attachments/assets/45e86d21-c604-4788-8ba2-a1fe44a6051e" />

## The Bot PCB in 3D
<img width="587" height="341" alt="Screenshot 2026-07-08 at 1 22 50 PM" src="https://github.com/user-attachments/assets/10adc530-dd62-4937-ad81-843e14ef2cb9" />

## The Full Cone PCB
<img width="942" height="640" alt="Screenshot 2026-07-08 at 1 27 51 PM" src="https://github.com/user-attachments/assets/9cb4b9d0-233c-4800-9bcb-6eb157ca194a" />

## The Cone PCB in 3D
<img width="550" height="406" alt="Screenshot 2026-07-08 at 1 28 04 PM" src="https://github.com/user-attachments/assets/5244d8ca-7d28-4caa-af42-a493a9c9464d" />

## The Fully Assembled Bot
<img width="649" height="484" alt="Screenshot 2026-07-08 at 1 30 25 PM" src="https://github.com/user-attachments/assets/d6287272-8a0f-4e0a-8de7-0e1ece439d7f" />

## The Fully Assembled Cone
<img width="255" height="312" alt="Screenshot 2026-07-08 at 1 31 08 PM" src="https://github.com/user-attachments/assets/78c6c070-2ea9-4482-8aad-b5211d9d2f37" />


