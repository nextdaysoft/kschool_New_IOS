//
//  AnimalPuzzleMenuCell.swift
//  KSchool
//
//  Created by Koshal Singh on 16/03/26.
//

import UIKit
import LanguageManager_iOS

class AnimalPuzzleMenuCell: UITableViewCell {

    @IBOutlet weak var cellBGView: UIView!
    @IBOutlet weak var titelImg: UIImageView!
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
         
         cellBGView.isUserInteractionEnabled = false
         titelImg.isUserInteractionEnabled = false
         titelLabel.isUserInteractionEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
let animalImages = [
"lion_and_cub",
"elephant_and_calf",
"horse_and_foal",
"leopard_and_baby",
"black_bear_and_baby",
"water_buffalo",
"water_monitor",
"eagle_and_baby",
"wild_boar_and_baby",
"chimpanzee_and_baby",
"cheetah_and_baby",
"antelope_and_baby",
"hyena_and_baby",
"moose_and_baby",
"kangaroo_and_joey",
"painted_turtle",
"panther_and_baby",
"pig_and_piglet",
"sheep_and_lamb",
"gray_wolf_and_baby",
"african_wild_dog",
"anaconda",
"arctic_fox_and_baby",
"argali_and_baby",
"bat_eared_fox_and_baby",
"bharal_and_baby",
"gorilla_and_baby",
"cow_and_calf",
"crocodile_semi",
"emu_and_baby",
"goat_and_kid",
"hen_and_chick",
"macaw_and_baby",
"marine_iguana",
"octopus",
"penguin_baby",
"polar_bear_and_baby",
"raccoon_dog_and_baby",
"walrus",
"wildebeest_and_baby",
"zorilla_and_baby",
"beaver",
"binturong_and_baby",
"bushbaby_and_baby",
"canadian_lynx_and_baby",
"cat_and_kitten",
"coati_and_baby",
"dog_and_puppy",
"electric_eel",
"elephant_seal",
"gold_fish"
]

let animalTitles = [
    "Lion".localiz(),
    "Elephant".localiz(),
    "Horse".localiz(),
    "Leopard".localiz(),
    "Black Bear".localiz(),
    "Water Buffalo".localiz(),
    "Water Monitor".localiz(),
    "Eagle".localiz(),
    "Wild Boar".localiz(),

    "Chimpanzee".localiz(),
    "Cheetah".localiz(),
    "Antelope".localiz(),
    "Hyena".localiz(),
    "Moose".localiz(),
    "Kangaroo".localiz(),
    "Painted Turtle".localiz(),
    "Panther".localiz(),
    "Pig".localiz(),

    "Sheep".localiz(),
    "Tibetan Wolf".localiz(),
    "African Wild Dog".localiz(),
    "Anaconda".localiz(),
    "Arctic Fox".localiz(),
    "Argali".localiz(),
    "Bat-eared Fox".localiz(),
    "Bharal (Blue Sheep)".localiz(),
    "Gorilla".localiz(),

    "Cow".localiz(),
    "Crocodile".localiz(),
    "Emu".localiz(),
    "Goat".localiz(),
    "Hen".localiz(),
    "Macaw".localiz(),
    "Marine Iguana".localiz(),
    "Octopus".localiz(),
    "Penguin".localiz(),

    "Polar Bear".localiz(),
    "Raccoon Dog".localiz(),
    "Walrus".localiz(),
    "Wildebeest".localiz(),
    "Zorilla".localiz(),
    "Beaver".localiz(),
    "Binturong".localiz(),
    "Bushbaby".localiz(),
    "Canadian Lynx".localiz(),

    "Cat".localiz(),
    "Coati".localiz(),
    "Dog".localiz(),
    "Electric Eel".localiz(),
    "Elephant Seal".localiz(),
    "Gold Fish".localiz()
]

let animalPuzzleImages = [
"lion_with_white_bg",
"elephant_with_white_bg",
"horse_with_white_bg",
"leopard_with_white_bg",
"black_bear_with_white_bg",
"water_buffalo_with_white_bg",
"water_monitor_with_white_bg",
"eagle_with_white_bg",
"wild_boar_with_white_bg",
"chimpanzee_with_white_bg",
"cheetah_with_white_bg",
"antelope_with_white_bg",
"hyena_with_white_bg",
"moose_with_white_bg",
"kangaroo_with_white_bg",
"painted_turtle_with_white_bg",
"panther_with_white_bg",
"pig_with_white_bg",
"sheep_with_white_bg",
"gray_wolf_with_white_bg",
"african_wild_dog_with_white_bg",
"anaconda_with_white_bg",
"arctic_fox_with_white_bg",
"argali_with_white_bg",
"bat_eared_fox_with_white_bg",
"bharal_with_white_bg",
"gorilla_with_white_bg",
"cow_with_white_bg",
"crocodile_with_white_bg",
"emu_with_white_bg",
"goat_with_white_bg",
"hen_with_white_bg",
"macaw_with_white_bg",
"marine_iguana_with_white_bg",
"octopus_with_white_bg",
"penguin_with_white_bg",
"polar_bear_with_white_bg",
"raccoon_dog_with_white_bg",
"walrus_with_white_bg",
"wildebeest_with_white_bg",
"zorilla_with_white_bg",
"beaver_with_white_bg",
"binturong_with_white_bg",
"bushbaby_with_white_bg",
"canadian_lynx_with_white_bg",
"cat_with_white_bg",
"coati_with_white_bg",
"dog_with_white_bg",
"electric_eel_with_white_bg",
"elephant_seal_with_white_bg",
"gold_fish_with_white_bg"
]


let continentImages = [
    "asia",
    "africa",
    "europe",
    "north_america",
    "south_america",
    "australia",
    "antarctica"
]

let continentTitles = [
    "Asia".localiz(),
    "Africa".localiz(),
    "Europe".localiz(),
    "North America".localiz(),
    "South America".localiz(),
    "Australia".localiz(),
    "Antarctica".localiz()
]

let countryFlagImages = [
    "indiaFlag",
    "chinaFlag",
    "usaFlag",
    "russiaFlag",
    "australiaFlag",
    "brazilFlag",
    "canadaFlag",
    "mexicoFlag",
    "unitedKingdomFlag",

    "southAfricaFlag",
    "saudiArabiaFlag",
    "japanFlag",
    "southKoreaFlag",
    "northKoreaFlag",
    "indonesiaFlag",
    "pakistanFlag",
    "bangladeshFlag",

    "sriLankaFlag",
    "nepalFlag",
    "thailandFlag",
    "vietnamFlag",
    "franceFlag",
    "italyFlag",
    "spainFlag",
    "germanyFlag",
    "iraqFlag",

    "egyptFlag",
    "iranFlag",
    "turkeyFlag",
    "malaysiaFlag",
    "netherlandsFlag",
    "switzerlandFlag",
    "afghanistanFlag",
    "singaporeFlag"
]


let countryNames = [
    "India".localiz(),
    "China".localiz(),
    "United States of America".localiz(),
    "Russia".localiz(),
    "Australia".localiz(),
    "Brazil".localiz(),
    "Canada".localiz(),
    "Mexico".localiz(),
    "United Kingdom".localiz(),

    "South Africa".localiz(),
    "Saudi Arabia".localiz(),
    "Japan".localiz(),
    "South Korea".localiz(),
    "North Korea".localiz(),
    "Indonesia".localiz(),
    "Pakistan".localiz(),
    "Bangladesh".localiz(),

    "Sri Lanka".localiz(),
    "Nepal".localiz(),
    "Thailand".localiz(),
    "Vietnam".localiz(),
    "France".localiz(),
    "Italy".localiz(),
    "Spain".localiz(),
    "Germany".localiz(),
    "Iraq".localiz(),

    "Egypt".localiz(),
    "Iran".localiz(),
    "Turkey".localiz(),
    "Malaysia".localiz(),
    "Netherlands".localiz(),
    "Switzerland".localiz(),
    "Afghanistan".localiz(),
    "Singapore".localiz()
]

let countrysMap = [
    // First 10
    "india",
    "china",
    "united_states",
    "russia",
    "australia",
    "brazil",
    "canada",
    "mexico",
    "united_kingdom",
    "south_africa",

    // Next 10
    "saudi_arabia",
    "japan",
    "south_korea",
    "north_korea",
    "indonesia",
    "pakistan",
    "bangladesh",
    "sri_lanka",
    "nepal",
    "thailand",

    // Next 10
    "vietnam",
    "france",
    "italy",
    "spain",
    "germany",
    "Iraq",
    "egypt",
    "iran",
    "turkey",
    "malaysia",

    // Last 4
    "netherlands",
    "switzerland",
    "afghanistan",
    "singapore"
]
