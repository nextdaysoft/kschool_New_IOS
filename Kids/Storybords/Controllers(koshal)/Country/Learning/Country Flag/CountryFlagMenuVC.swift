//
//  CountryFlagMenuVC.swift
//  Kids
//
//  Created by Koshal Singh on 03/03/26.
//

import UIKit

class CountryFlagMenuVC: BaseViewController {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    @IBOutlet weak var image10: UIImageView!
    @IBOutlet weak var image11: UIImageView!
    @IBOutlet weak var image12: UIImageView!
    @IBOutlet weak var image13: UIImageView!
    @IBOutlet weak var image14: UIImageView!
    @IBOutlet weak var image15: UIImageView!
    @IBOutlet weak var image16: UIImageView!
    @IBOutlet weak var image17: UIImageView!
    @IBOutlet weak var image18: UIImageView!
    @IBOutlet weak var image19: UIImageView!
    @IBOutlet weak var image20: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!
    @IBOutlet weak var label13: UILabel!
    @IBOutlet weak var label14: UILabel!
    @IBOutlet weak var label15: UILabel!
    @IBOutlet weak var label16: UILabel!
    @IBOutlet weak var label17: UILabel!
    @IBOutlet weak var label18: UILabel!
    @IBOutlet weak var label19: UILabel!
    @IBOutlet weak var label20: UILabel!
 
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view9: UIView!
    @IBOutlet weak var view10: UIView!
    @IBOutlet weak var view11: UIView!
    @IBOutlet weak var view12: UIView!
    @IBOutlet weak var view13: UIView!
    @IBOutlet weak var view14: UIView!
    @IBOutlet weak var view15: UIView!
    @IBOutlet weak var view16: UIView!
    @IBOutlet weak var view17: UIView!
    @IBOutlet weak var view18: UIView!
    @IBOutlet weak var view19: UIView!
    @IBOutlet weak var view20: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBG4: UIView!
    @IBOutlet weak var viewBG5: UIView!
    @IBOutlet weak var viewBG6: UIView!
    @IBOutlet weak var viewBG7: UIView!
    @IBOutlet weak var viewBG8: UIView!
    @IBOutlet weak var viewBG9: UIView!
    @IBOutlet weak var viewBG10: UIView!
    @IBOutlet weak var viewBG11: UIView!
    @IBOutlet weak var viewBG12: UIView!
    @IBOutlet weak var viewBG13: UIView!
    @IBOutlet weak var viewBG14: UIView!
    @IBOutlet weak var viewBG15: UIView!
    @IBOutlet weak var viewBG16: UIView!
    @IBOutlet weak var viewBG17: UIView!
    @IBOutlet weak var viewBG18: UIView!
    @IBOutlet weak var viewBG19: UIView!
    @IBOutlet weak var viewBG20: UIView!
  
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var restBtn: UIButton!
    
    var didTapLockedLevel = false
    
    let planets1: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Afghanistan",
            imageName: "afghanistanNew"
        ),
        
        LearnPlanetsItem(
            text: "Angola",
            imageName: "angola"
        ),
        
        LearnPlanetsItem(
            text: "Andorra",
            imageName: "andorra"
        ),
        
        LearnPlanetsItem(
            text: "Albania",
            imageName: "albania"
        ),
        
        LearnPlanetsItem(
            text: "Algeria",
            imageName: "algeria"
        ),
        
        LearnPlanetsItem(
            text: "Antigua and Barbuda",
            imageName: "antigua and carbuda"
        ),
        
        LearnPlanetsItem(
            text: "Argentina",
            imageName: "argentina"
        ),
        
        LearnPlanetsItem(
            text: "Armenia",
            imageName: "armenia"
        ),
        
        LearnPlanetsItem(
            text: "Australia",
            imageName: "australiaNew"
        ),
        
        LearnPlanetsItem(
            text: "Austria",
            imageName: "austria"
        )
    ]
    
    let planets2: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Bahrain",
            imageName: "bahrain"
        ),
        
        LearnPlanetsItem(
            text: "Bahamas",
            imageName: "bahamas"
        ),
        
        LearnPlanetsItem(
            text: "Bangladesh",
            imageName: "bangladesh"
        ),
        
        LearnPlanetsItem(
            text: "Azerbaijan",
            imageName: "azerbaijan"
        ),
        
        LearnPlanetsItem(
            text: "Barbados",
            imageName: "barbados"
        ),
        
        LearnPlanetsItem(
            text: "Belarus",
            imageName: "belarus"
        ),
        
        LearnPlanetsItem(
            text: "Belgium",
            imageName: "belgium"
        ),
        
        LearnPlanetsItem(
            text: "Benin",
            imageName: "benin"
        ),
        
        LearnPlanetsItem(
            text: "Belize",
            imageName: "belize"
        ),
        
        LearnPlanetsItem(
            text: "Bhutan",
            imageName: "bhutan"
        )
    ]
    
    let planets3: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
             text: "Bulgaria",
             imageName: "bulgaria"
         ),
         
         LearnPlanetsItem(
             text: "Bolivia",
             imageName: "bolivia"
         ),
         
         LearnPlanetsItem(
             text: "Brazil",
             imageName: "Brazil"
         ),
         
         LearnPlanetsItem(
             text: "Bosnia and Herzegovina",
             imageName: "bosnia-and-herzegovina"
         ),
         
         LearnPlanetsItem(
             text: "Brunei",
             imageName: "Brunei"
         ),
         
         LearnPlanetsItem(
             text: "Botswana",
             imageName: "botswana"
         ),
         
         LearnPlanetsItem(
             text: "Burkina Faso",
             imageName: "burkina-faso"
         ),
         
         LearnPlanetsItem(
             text: "Burundi",
             imageName: "burundi"
         ),
         
         LearnPlanetsItem(
             text: "Cabo Verde",
             imageName: "CaboVerde"
         ),
         
         LearnPlanetsItem(
             text: "Cambodia",
             imageName: "Cambodia"
         )
    ]
    
    let planets4: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Cameroon",
            imageName: "cameroon"
        ),
        
        LearnPlanetsItem(
            text: "Colombia",
            imageName: "colombia"
        ),
        
        LearnPlanetsItem(
            text: "Comoros",
            imageName: "comoros"
        ),
        
        LearnPlanetsItem(
            text: "Canada",
            imageName: "Canada"
        ),
        
        LearnPlanetsItem(
            text: "Democratic Republic of Congo",
            imageName: "democratic-republic-of-congo"
        ),
        
        LearnPlanetsItem(
            text: "Central African Republic",
            imageName: "central-african-republic"
        ),
        
        LearnPlanetsItem(
            text: "Chad",
            imageName: "chad"
        ),
        
        LearnPlanetsItem(
            text: "Chile",
            imageName: "chile"
        ),
        
        LearnPlanetsItem(
            text: "China",
            imageName: "China"
        ),
        
        LearnPlanetsItem(
            text: "Republic of the Congo",
            imageName: "republic-of-the-congo"
        )
    ]
    
    let planets5: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Costa Rica",
            imageName: "costa-rica"
        ),
        
        LearnPlanetsItem(
            text: "Côte d'Ivoire",
            imageName: "Côte d'Ivoire (Ivory Coast)"
        ),
        
        LearnPlanetsItem(
            text: "Croatia",
            imageName: "Croatia"
        ),
        
        LearnPlanetsItem(
            text: "Cuba",
            imageName: "cuba"
        ),
        
        LearnPlanetsItem(
            text: "Cyprus",
            imageName: "cyprus"
        ),
        
        LearnPlanetsItem(
            text: "Czech Republic",
            imageName: "czech-republic"
        ),
        
        LearnPlanetsItem(
            text: "Denmark",
            imageName: "denmark"
        ),
        
        LearnPlanetsItem(
            text: "Djibouti",
            imageName: "djibouti"
        ),
        
        LearnPlanetsItem(
            text: "Dominica",
            imageName: "Dominica"
        ),
        
        LearnPlanetsItem(
            text: "Dominican Republic",
            imageName: "Dominican Republic"
        )
    ]
    
    let planets6: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Ecuador",
            imageName: "Ecuador"
        ),
        
        LearnPlanetsItem(
            text: "Egypt",
            imageName: "Egypt"
        ),
        
        LearnPlanetsItem(
            text: "El Salvador",
            imageName: "El Salvador"
        ),
        
        LearnPlanetsItem(
            text: "Equatorial Guinea",
            imageName: "equatorial-guinea"
        ),
        
        LearnPlanetsItem(
            text: "Eritrea",
            imageName: "Eritrea"
        ),
        
        LearnPlanetsItem(
            text: "Estonia",
            imageName: "Estonia"
        ),
        
        LearnPlanetsItem(
            text: "Eswatini",
            imageName: "Eswatini"
        ),
        
        LearnPlanetsItem(
            text: "Ethiopia",
            imageName: "ethiopia"
        ),
        
        LearnPlanetsItem(
            text: "Fiji",
            imageName: "Fiji"
        ),
        
        LearnPlanetsItem(
            text: "Finland",
            imageName: "finland"
        )
    ]
    
    let planets7: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "France",
            imageName: "franceFlagNew"
        ),
        
        LearnPlanetsItem(
            text: "Gabon",
            imageName: "gabon"
        ),
        
        LearnPlanetsItem(
            text: "Gambia",
            imageName: "gambia"
        ),
        
        LearnPlanetsItem(
            text: "Georgia",
            imageName: "georgia"
        ),
        
        LearnPlanetsItem(
            text: "Germany",
            imageName: "germany"
        ),
        
        LearnPlanetsItem(
            text: "Ghana",
            imageName: "ghana"
        ),
        
        LearnPlanetsItem(
            text: "Guinea",
            imageName: "Guinea"
        ),
        
        LearnPlanetsItem(
            text: "Guatemala",
            imageName: "guatemala"
        ),
        
        LearnPlanetsItem(
            text: "Grenada",
            imageName: "Grenada"
        ),
        
        LearnPlanetsItem(
            text: "Greece",
            imageName: "greece"
        )
    ]
    
    let planets8: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Guinea-Bissau",
            imageName: "Guinea-Bissau"
        ),
        
        LearnPlanetsItem(
            text: "Guyana",
            imageName: "guyana"
        ),
        
        LearnPlanetsItem(
            text: "Haiti",
            imageName: "haiti"
        ),
        
        LearnPlanetsItem(
            text: "Honduras",
            imageName: "honduras"
        ),
        
        LearnPlanetsItem(
            text: "Hungary",
            imageName: "hungary"
        ),
        
        LearnPlanetsItem(
            text: "Iceland",
            imageName: "Iceland"
        ),
        
        LearnPlanetsItem(
            text: "India",
            imageName: "India"
        ),
        
        LearnPlanetsItem(
            text: "Indonesia",
            imageName: "Indonesia"
        ),
        
        LearnPlanetsItem(
            text: "Iran",
            imageName: "Iran"
        ),
        
        LearnPlanetsItem(
            text: "Iraq",
            imageName: "Iraq"
        )
    ]
    
    let planets9: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Ireland",
            imageName: "Ireland"
        ),
        
        LearnPlanetsItem(
            text: "Israel",
            imageName: "israel"
        ),
        
        LearnPlanetsItem(
            text: "Kenya",
            imageName: "Kenya"
        ),
        
        LearnPlanetsItem(
            text: "Kazakhstan",
            imageName: "Kazakhstan"
        ),
        
        LearnPlanetsItem(
            text: "Jordan",
            imageName: "jordan"
        ),
        
        LearnPlanetsItem(
            text: "Japan",
            imageName: "japanNew"
        ),
        
        LearnPlanetsItem(
            text: "Jamaica",
            imageName: "jamaica"
        ),
        
        LearnPlanetsItem(
            text: "Italy",
            imageName: "Italy"
        ),
        
        LearnPlanetsItem(
            text: "Kiribati",
            imageName: "kiribati"
        ),
        
        LearnPlanetsItem(
            text: "Kuwait",
            imageName: "Kuwait"
        )
    ]
    
    let planets10: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
             text: "Kyrgyzstan",
             imageName: "Kyrgyzstan"
         ),
         
         LearnPlanetsItem(
             text: "Laos",
             imageName: "Laos"
         ),
         
         LearnPlanetsItem(
             text: "Latvia",
             imageName: "Latvia"
         ),
         
         LearnPlanetsItem(
             text: "Lebanon",
             imageName: "Lebanon"
         ),
         
         LearnPlanetsItem(
             text: "Lesotho",
             imageName: "lesotho"
         ),
         
         LearnPlanetsItem(
             text: "Liberia",
             imageName: "Liberia"
         ),
         
         LearnPlanetsItem(
             text: "Libya",
             imageName: "Libya"
         ),
         
         LearnPlanetsItem(
             text: "Liechtenstein",
             imageName: "liechtenstein"
         ),
         
         LearnPlanetsItem(
             text: "Luxembourg",
             imageName: "luxembourg"
         ),
         
         LearnPlanetsItem(
             text: "Lithuania",
             imageName: "lithuania"
         )
    ]

    let planets11: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
             text: "Madagascar",
             imageName: "madagascar"
         ),
         
         LearnPlanetsItem(
             text: "Malawi",
             imageName: "malawi"
         ),
         
         LearnPlanetsItem(
             text: "Mauritania",
             imageName: "mauritania"
         ),
         
         LearnPlanetsItem(
             text: "Marshall Islands",
             imageName: "Marshall Islands"
         ),
         
         LearnPlanetsItem(
             text: "Malta",
             imageName: "malta"
         ),
         
         LearnPlanetsItem(
             text: "Mali",
             imageName: "Mali"
         ),
         
         LearnPlanetsItem(
             text: "Maldives",
             imageName: "maldives"
         ),
         
         LearnPlanetsItem(
             text: "Malaysia",
             imageName: "Malaysia"
         ),
         
         LearnPlanetsItem(
             text: "Mauritius",
             imageName: "mauritius"
         ),
         
         LearnPlanetsItem(
             text: "Mexico",
             imageName: "Mexico"
         )
    ]
    
    let planets12: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
             text: "Micronesia",
             imageName: "Micronesia"
         ),
         
         LearnPlanetsItem(
             text: "Moldova",
             imageName: "moldova"
         ),
         
         LearnPlanetsItem(
             text: "Myanmar",
             imageName: "myanmar"
         ),
         
         LearnPlanetsItem(
             text: "Mozambique",
             imageName: "mozambique"
         ),
         
         LearnPlanetsItem(
             text: "Morocco",
             imageName: "morocco"
         ),
         
         LearnPlanetsItem(
             text: "Montenegro",
             imageName: "Montenegro"
         ),
         
         LearnPlanetsItem(
             text: "Mongolia",
             imageName: "Mongolia"
         ),
         
         LearnPlanetsItem(
             text: "Monaco",
             imageName: "monaco"
         ),
         
         LearnPlanetsItem(
             text: "Namibia",
             imageName: "Namibia"
         ),
         
         LearnPlanetsItem(
             text: "Nauru",
             imageName: "Nauru"
         )
    ]
    
    let planets13: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
                text: "Nepal",
                imageName: "Nepal"
            ),
            
            LearnPlanetsItem(
                text: "Netherlands",
                imageName: "Netherlands"
            ),
            
            LearnPlanetsItem(
                text: "North Macedonia",
                imageName: "North Macedonia"
            ),
            
            LearnPlanetsItem(
                text: "North Korea",
                imageName: "North Korea"
            ),
            
            LearnPlanetsItem(
                text: "Nigeria",
                imageName: "Nigeria"
            ),
            
            LearnPlanetsItem(
                text: "Niger",
                imageName: "Niger"
            ),
            
            LearnPlanetsItem(
                text: "Nicaragua",
                imageName: "Nicaragua"
            ),
            
            LearnPlanetsItem(
                text: "New Zealand",
                imageName: "New Zealand"
            ),
            
            LearnPlanetsItem(
                text: "Norway",
                imageName: "Norway"
            ),
            
            LearnPlanetsItem(
                text: "Oman",
                imageName: "Oman"
            )
    ]
   
    let planets14: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
                text: "Pakistan",
                imageName: "Pakistan"
            ),
            
            LearnPlanetsItem(
                text: "Palau",
                imageName: "Palau"
            ),
            
            LearnPlanetsItem(
                text: "Philippines",
                imageName: "Philippines"
            ),
            
            LearnPlanetsItem(
                text: "Peru",
                imageName: "Peru"
            ),
            
            LearnPlanetsItem(
                text: "Paraguay",
                imageName: "Paraguay"
            ),
            
            LearnPlanetsItem(
                text: "Papua New Guinea",
                imageName: "Papua New Guinea"
            ),
            
            LearnPlanetsItem(
                text: "Panama",
                imageName: "Panama"
            ),
            
            LearnPlanetsItem(
                text: "Palestine",
                imageName: "Palestine"
            ),
            
            LearnPlanetsItem(
                text: "Poland",
                imageName: "Poland"
            ),
            
            LearnPlanetsItem(
                text: "Portugal",
                imageName: "Portugal"
            )
    ]
    
    let planets15: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Qatar",
            imageName: "Qatar"
        ),
        
        LearnPlanetsItem(
            text: "Romania",
            imageName: "Romania"
        ),
        
        LearnPlanetsItem(
            text: "Russia",
            imageName: "russiaNew"
        ),
        
        LearnPlanetsItem(
            text: "Rwanda",
            imageName: "Rwanda"
        ),
        
        LearnPlanetsItem(
            text: "Saint Kitts and Nevis",
            imageName: "Saint Kitts and Nevis"
        ),
        
        LearnPlanetsItem(
            text: "Saint Lucia",
            imageName: "Saint Lucia"
        ),
        
        LearnPlanetsItem(
            text: "Saint Vincent and the Grenadines",
            imageName: "Saint Vincent and the Grenadines"
        ),
        
        LearnPlanetsItem(
            text: "Samoa",
            imageName: "Samoa"
        ),
        
        LearnPlanetsItem(
            text: "San Marino",
            imageName: "San Marino"
        ),
        
        LearnPlanetsItem(
            text: "São Tomé and Príncipe",
            imageName: "São Tomé and Príncipe"
        )
    ]
    
    let planets16: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Somalia",
            imageName: "Somalia"
        ),
        
        LearnPlanetsItem(
            text: "Solomon Islands",
            imageName: "Solomon Islands"
        ),
        
        LearnPlanetsItem(
            text: "Serbia",
            imageName: "Serbia"
        ),
        
        LearnPlanetsItem(
            text: "Seychelles",
            imageName: "Seychelles"
        ),
        
        LearnPlanetsItem(
            text: "Sierra Leone",
            imageName: "Sierra Leone"
        ),
        
        LearnPlanetsItem(
            text: "Singapore",
            imageName: "Singapore"
        ),
        
        LearnPlanetsItem(
            text: "Slovakia",
            imageName: "Slovakia"
        ),
        
        LearnPlanetsItem(
            text: "Slovenia",
            imageName: "Slovenia"
        ),
        
        LearnPlanetsItem(
            text: "Senegal",
            imageName: "Senegal"
        ),
        
        LearnPlanetsItem(
            text: "Saudi Arabia",
            imageName: "Saudi Arabia"
        )
    ]
    
    let planets17: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "South Africa",
            imageName: "South Africa"
        ),
        
        LearnPlanetsItem(
            text: "South Korea (Republic of Korea)",
            imageName: "South Korea (Republic of Korea)"
        ),
        
        LearnPlanetsItem(
            text: "Sweden",
            imageName: "Sweden"
        ),
        
        LearnPlanetsItem(
            text: "Suriname",
            imageName: "Suriname"
        ),
        
        LearnPlanetsItem(
            text: "Sudan",
            imageName: "Sudan"
        ),
        
        LearnPlanetsItem(
            text: "Sri Lanka",
            imageName: "Sri Lanka"
        ),
        
        LearnPlanetsItem(
            text: "Spain",
            imageName: "Spain"
        ),
        
        LearnPlanetsItem(
            text: "South Sudan",
            imageName: "South Sudan"
        ),
        
        LearnPlanetsItem(
            text: "Switzerland",
            imageName: "Switzerland"
        ),
        
        LearnPlanetsItem(
            text: "Syria",
            imageName: "Syria"
        )
    ]
    
    let planets18: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Tajikistan",
            imageName: "Tajikistan"
        ),
        
        LearnPlanetsItem(
            text: "Tanzania",
            imageName: "Tanzania"
        ),
        
        LearnPlanetsItem(
            text: "Tunisia",
            imageName: "Tunisia"
        ),
        
        LearnPlanetsItem(
            text: "Trinidad and Tobago",
            imageName: "Trinidad and Tobago"
        ),
        
        LearnPlanetsItem(
            text: "Tonga",
            imageName: "Tonga"
        ),
        
        LearnPlanetsItem(
            text: "Togo",
            imageName: "Togo"
        ),
        
        LearnPlanetsItem(
            text: "Timor-Leste",
            imageName: "Timor-Leste"
        ),
        
        LearnPlanetsItem(
            text: "Thailand",
            imageName: "Thailand"
        ),
        
        LearnPlanetsItem(
            text: "Turkey",
            imageName: "Turkey"
        ),
        
        LearnPlanetsItem(
            text: "Turkmenistan",
            imageName: "Turkmenistan"
        )
    ]
    
    let planets19: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Tuvalu",
            imageName: "Tuvalu"
        ),
        
        LearnPlanetsItem(
            text: "Uganda",
            imageName: "Uganda"
        ),
        
        LearnPlanetsItem(
            text: "Uzbekistan",
            imageName: "Uzbekistan"
        ),
        
        LearnPlanetsItem(
            text: "Uruguay",
            imageName: "Uruguay"
        ),
        
        LearnPlanetsItem(
            text: "United Arab Emirates",
            imageName: "united-arab-emirates"
        ),
        
        LearnPlanetsItem(
            text: "United States of America",
            imageName: "United States of America"
        ),
        
        LearnPlanetsItem(
            text: "United Kingdom",
            imageName: "United Kingdom"
        ),
        
        LearnPlanetsItem(
            text: "Ukraine",
            imageName: "Ukraine"
        ),
        
        LearnPlanetsItem(
            text: "Vanuatu",
            imageName: "Vanuatu"
        ),
        
        LearnPlanetsItem(
            text: "Vatican City",
            imageName: "Vatican City"
        )
    ]
    
    let planets20: [LearnPlanetsItem] = [
        
        LearnPlanetsItem(
            text: "Venezuela",
            imageName: "Venezuela"
        ),
        
        LearnPlanetsItem(
            text: "Vietnam",
            imageName: "Vietnam"
        ),
        
        LearnPlanetsItem(
            text: "Yemen",
            imageName: "Yemen"
        ),
        
        LearnPlanetsItem(
            text: "Zambia",
            imageName: "Zambia"
        ),
        
        LearnPlanetsItem(
            text: "Zimbabwe",
            imageName: "Zimbabwe"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupForRestBtn()
       
        
        view1.layer.borderColor = UIColor.black.cgColor
        view1.layer.borderWidth = 1
        view1.layer.cornerRadius = 20
        view1.clipsToBounds = true

        view2.layer.borderColor = UIColor.black.cgColor
        view2.layer.borderWidth = 1
        view2.layer.cornerRadius = 20
        view2.clipsToBounds = true

        view3.layer.borderColor = UIColor.black.cgColor
        view3.layer.borderWidth = 1
        view3.layer.cornerRadius = 20
        view3.clipsToBounds = true

        view4.layer.borderColor = UIColor.black.cgColor
        view4.layer.borderWidth = 1
        view4.layer.cornerRadius = 20
        view4.clipsToBounds = true

        view5.layer.borderColor = UIColor.black.cgColor
        view5.layer.borderWidth = 1
        view5.layer.cornerRadius = 20
        view5.clipsToBounds = true

        view6.layer.borderColor = UIColor.black.cgColor
        view6.layer.borderWidth = 1
        view6.layer.cornerRadius = 20
        view6.clipsToBounds = true

        view7.layer.borderColor = UIColor.black.cgColor
        view7.layer.borderWidth = 1
        view7.layer.cornerRadius = 20
        view7.clipsToBounds = true

        view8.layer.borderColor = UIColor.black.cgColor
        view8.layer.borderWidth = 1
        view8.layer.cornerRadius = 20
        view8.clipsToBounds = true

        view9.layer.borderColor = UIColor.black.cgColor
        view9.layer.borderWidth = 1
        view9.layer.cornerRadius = 20
        view9.clipsToBounds = true

        view10.layer.borderColor = UIColor.black.cgColor
        view10.layer.borderWidth = 1
        view10.layer.cornerRadius = 20
        view10.clipsToBounds = true

        view11.layer.borderColor = UIColor.black.cgColor
        view11.layer.borderWidth = 1
        view11.layer.cornerRadius = 20
        view11.clipsToBounds = true

        view12.layer.borderColor = UIColor.black.cgColor
        view12.layer.borderWidth = 1
        view12.layer.cornerRadius = 20
        view12.clipsToBounds = true

        view13.layer.borderColor = UIColor.black.cgColor
        view13.layer.borderWidth = 1
        view13.layer.cornerRadius = 20
        view13.clipsToBounds = true

        view14.layer.borderColor = UIColor.black.cgColor
        view14.layer.borderWidth = 1
        view14.layer.cornerRadius = 20
        view14.clipsToBounds = true

        view15.layer.borderColor = UIColor.black.cgColor
        view15.layer.borderWidth = 1
        view15.layer.cornerRadius = 20
        view15.clipsToBounds = true

        view16.layer.borderColor = UIColor.black.cgColor
        view16.layer.borderWidth = 1
        view16.layer.cornerRadius = 20
        view16.clipsToBounds = true

        view17.layer.borderColor = UIColor.black.cgColor
        view17.layer.borderWidth = 1
        view17.layer.cornerRadius = 20
        view17.clipsToBounds = true

        view18.layer.borderColor = UIColor.black.cgColor
        view18.layer.borderWidth = 1
        view18.layer.cornerRadius = 20
        view18.clipsToBounds = true

        view19.layer.borderColor = UIColor.black.cgColor
        view19.layer.borderWidth = 1
        view19.layer.cornerRadius = 20
        view19.clipsToBounds = true

        view20.layer.borderColor = UIColor.black.cgColor
        view20.layer.borderWidth = 1
        view20.layer.cornerRadius = 20
        view20.clipsToBounds = true

        
        
        
        
        viewBG1.layer.cornerRadius = 10
        viewBG1.backgroundColor = ColorManager.randomColor()
        viewBG1.layer.borderColor = UIColor.black.cgColor

        viewBG2.layer.cornerRadius = 10
        viewBG2.backgroundColor = ColorManager.randomColor()
        viewBG2.layer.borderColor = UIColor.black.cgColor

        viewBG3.layer.cornerRadius = 10
        viewBG3.backgroundColor = ColorManager.randomColor()
        viewBG3.layer.borderColor = UIColor.black.cgColor

        viewBG4.layer.cornerRadius = 10
        viewBG4.backgroundColor = ColorManager.randomColor()
        viewBG4.layer.borderColor = UIColor.black.cgColor

        viewBG5.layer.cornerRadius = 10
        viewBG5.backgroundColor = ColorManager.randomColor()
        viewBG5.layer.borderColor = UIColor.black.cgColor

        viewBG6.layer.cornerRadius = 10
        viewBG6.backgroundColor = ColorManager.randomColor()
        viewBG6.layer.borderColor = UIColor.black.cgColor

        viewBG7.layer.cornerRadius = 10
        viewBG7.backgroundColor = ColorManager.randomColor()
        viewBG7.layer.borderColor = UIColor.black.cgColor

        viewBG8.layer.cornerRadius = 10
        viewBG8.backgroundColor = ColorManager.randomColor()
        viewBG8.layer.borderColor = UIColor.black.cgColor

        viewBG9.layer.cornerRadius = 10
        viewBG9.backgroundColor = ColorManager.randomColor()
        viewBG9.layer.borderColor = UIColor.black.cgColor

        viewBG10.layer.cornerRadius = 10
        viewBG10.backgroundColor = ColorManager.randomColor()
        viewBG10.layer.borderColor = UIColor.black.cgColor

        viewBG11.layer.cornerRadius = 10
        viewBG11.backgroundColor = ColorManager.randomColor()
        viewBG11.layer.borderColor = UIColor.black.cgColor

        viewBG12.layer.cornerRadius = 10
        viewBG12.backgroundColor = ColorManager.randomColor()
        viewBG12.layer.borderColor = UIColor.black.cgColor

        viewBG13.layer.cornerRadius = 10
        viewBG13.backgroundColor = ColorManager.randomColor()
        viewBG13.layer.borderColor = UIColor.black.cgColor

        viewBG14.layer.cornerRadius = 10
        viewBG14.backgroundColor = ColorManager.randomColor()
        viewBG14.layer.borderColor = UIColor.black.cgColor
   

        viewBG15.layer.cornerRadius = 10
        viewBG15.backgroundColor = ColorManager.randomColor()
        viewBG15.layer.borderColor = UIColor.black.cgColor
       

        viewBG16.layer.cornerRadius = 10
        viewBG16.backgroundColor = ColorManager.randomColor()
        viewBG16.layer.borderColor = UIColor.black.cgColor
       

        viewBG17.layer.cornerRadius = 10
        viewBG17.backgroundColor = ColorManager.randomColor()
        viewBG17.layer.borderColor = UIColor.black.cgColor
 

        viewBG18.layer.cornerRadius = 10
        viewBG18.backgroundColor = ColorManager.randomColor()
        viewBG18.layer.borderColor = UIColor.black.cgColor
        

        viewBG19.layer.cornerRadius = 10
        viewBG19.backgroundColor = ColorManager.randomColor()
        viewBG19.layer.borderColor = UIColor.black.cgColor
        

        viewBG20.layer.cornerRadius = 10
        viewBG20.backgroundColor = ColorManager.randomColor()
        viewBG20.layer.borderColor = UIColor.black.cgColor
     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLevelImages()
        updateResetVisibility()
        setupSubscriptionLock()
    }
    
    
    func updateResetVisibility() {
        
        let isAnyCompleted =
            UserDefaults.standard.bool(forKey: "countryFlagLevel1Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel2Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel3Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel4Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel5Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel6Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel7Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel8Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel9Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel10Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel11Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel12Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel13Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel14Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel15Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel16Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel17Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel18Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel19Completed") ||
            UserDefaults.standard.bool(forKey: "countryFlagLevel20Completed")
           
        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }
    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1)
        updateLevelUI(level: 2, imageView: image2)
        updateLevelUI(level: 3, imageView: image3)
        updateLevelUI(level: 4, imageView: image4)
        updateLevelUI(level: 5, imageView: image5)
        updateLevelUI(level: 6, imageView: image6)
        updateLevelUI(level: 7, imageView: image7)
        updateLevelUI(level: 8, imageView: image8)
        updateLevelUI(level: 9, imageView: image9)
        updateLevelUI(level: 10, imageView: image10)
        updateLevelUI(level: 11, imageView: image11)
        updateLevelUI(level: 12, imageView: image12)
        updateLevelUI(level: 13, imageView: image13)
        updateLevelUI(level: 14, imageView: image14)
        updateLevelUI(level: 15, imageView: image15)
        updateLevelUI(level: 16, imageView: image16)
        updateLevelUI(level: 17, imageView: image17)
        updateLevelUI(level: 18, imageView: image18)
        updateLevelUI(level: 19, imageView: image19)
        updateLevelUI(level: 20, imageView: image20)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView) {

        let completedKey =
        "countryFlagLevel\(level)Completed"

        if UserDefaults.standard.bool(
            forKey: completedKey
        ) {
            imageView.image = UIImage(named: "done")
        }
    }
    
    func setup(){
        let color = ColorManager.randomColor()
        let config = UIImage.SymbolConfiguration(pointSize: 26, weight: .medium)
        let img = UIImage(systemName: "arrow.backward.circle", withConfiguration: config)
        backBtn.setImage(img, for: .normal)
        backBtn.tintColor = #colorLiteral(red: 0.1718951762, green: 0.212508589, blue: 0.3281655014, alpha: 1)
        HeaderView.backgroundColor = color
        statusView.backgroundColor = color
    }

    
    func setupForRestBtn() {
        
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .medium)
        
        
        let img = UIImage(systemName: "arrow.clockwise.circle", withConfiguration: config)
        
        restBtn.setImage(img, for: .normal)
        
        restBtn.tintColor = UIColor(
            red: 0.17,
            green: 0.21,
            blue: 0.33,
            alpha: 1
        )
        
        // Text right side + icon right
        restBtn.semanticContentAttribute = .forceRightToLeft
        restBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }
    
    func checkSubscription() -> Bool {

        if SubscriptionManager.shared.isSubscribed() {
            return true
        }

        goToSubscription()
        return false
    }

    func goToSubscription() {

        let storyboard = UIStoryboard(
            name: "Main",
            bundle: nil
        )

        let vc = storyboard.instantiateViewController(
            withIdentifier: "SubscriptionVC"
        ) as! SubscriptionVC

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    func setupSubscriptionLock() {

        let subscribed = SubscriptionManager.shared.isSubscribed()
        let lock = UIImage(named: "lock")

        let levels: [(Int, UIImageView?, UIView?)] = [

            (3,image3,viewBG3),
            (4,image4,viewBG4),
            (5,image5,viewBG5),
            (6,image6,viewBG6),
            (7,image7,viewBG7),
            (8,image8,viewBG8),
            (9,image9,viewBG9),
            (10,image10,viewBG10),
            (11,image11,viewBG11),
            (12,image12,viewBG12),
            (13,image13,viewBG13),
            (14,image14,viewBG14),
            (15,image15,viewBG15),
            (16,image16,viewBG16),
            (17,image17,viewBG17),
            (18,image18,viewBG18),
            (19,image19,viewBG19),
            (20,image20,viewBG20)
        ]

        for (level,image,bg) in levels {

            let completed =
            UserDefaults.standard.bool(
                forKey: "countryFlagLevel\(level)Completed"
            )

            if completed {

                image?.image = UIImage(named:"done")

                bg?.backgroundColor =
                    ColorManager.randomColor()

            } else {

                image?.image =
                    subscribed ? nil : lock

                bg?.backgroundColor =
                    subscribed
                    ? ColorManager.randomColor()
                    : .systemGray4
            }
        }
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets3
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level4TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets4
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets5
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level6TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets6
        vc.levelNumber = 6
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level7TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets7
        vc.levelNumber = 7
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level8TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets8
        vc.levelNumber = 8
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level9TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets9
        vc.levelNumber = 9
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level10TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets10
        vc.levelNumber = 10
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level11TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets11
        vc.levelNumber = 11
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level12TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets12
        vc.levelNumber = 12
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level13TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets13
        vc.levelNumber = 13
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level14TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets14
        vc.levelNumber = 14
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level15TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets15
        vc.levelNumber = 15
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level16TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets16
        vc.levelNumber = 16
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level17TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets17
        vc.levelNumber = 17
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level18TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets18
        vc.levelNumber = 18
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level19TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets19
        vc.levelNumber = 19
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level20TapBtn(_ sender: UIButton) {
        guard checkSubscription() else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "CountryFlagShowVC") as! CountryFlagShowVC
        vc.planets = planets20
        vc.levelNumber = 20
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {

        let defaults = UserDefaults.standard

        for i in 1...20 {
            defaults.removeObject(
                forKey: "countryFlagLevel\(i)Completed"
            )
        }

        defaults.synchronize()

        // level1-2 free hai
        image1.image = nil
        image2.image = nil

        updateResetVisibility()
        setupSubscriptionLock()
    }
    
}
