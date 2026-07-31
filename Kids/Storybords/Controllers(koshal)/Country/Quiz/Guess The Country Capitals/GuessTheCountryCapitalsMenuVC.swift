//
//  GuessTheCountryCapitalsMenuVC.swift
//  KSchool
//
//  Created by Koshal Singh on 31/03/26.
//

import UIKit

class GuessTheCountryCapitalsMenuVC: BaseViewController {

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
    
    let planets1: [LearnPlanetsItem] = [
        .init(text: "Afghanistan’s capital is Kabul", imageName: "afghanistanNew"),
        .init(text: "Angola’s capital is Luanda", imageName: "angola"),
        .init(text: "Andorra’s capital is Andorra la Vella", imageName: "andorra"),
        .init(text: "Albania’s capital is Tirana", imageName: "albania"),
        .init(text: "Algeria’s capital is Algiers", imageName: "algeria"),
        .init(text: "Antigua and Barbuda’s capital is Saint John’s", imageName: "antigua and carbuda"),
        .init(text: "Argentina’s capital is Buenos Aires", imageName: "argentina"),
        .init(text: "Armenia’s capital is Yerevan", imageName: "armenia"),
        .init(text: "Australia’s capital is Canberra", imageName: "australiaNew"),
        .init(text: "Austria’s capital is Vienna", imageName: "austria")
    ]
    
    let planets2: [LearnPlanetsItem] = [
        .init(text: "Bahrain’s capital is Manama", imageName: "bahrain"),
        .init(text: "The Bahamas’ capital is Nassau", imageName: "bahamas"),
        .init(text: "Bangladesh’s capital is Dhaka", imageName: "bangladesh"),
        .init(text: "Azerbaijan’s capital is Baku", imageName: "azerbaijan"),
        .init(text: "Barbados’s capital is Bridgetown", imageName: "barbados"),
        .init(text: "Belarus’s capital is Minsk", imageName: "belarus"),
        .init(text: "Belgium’s capital is Brussels", imageName: "belgium"),
        .init(text: "Benin’s capital is Porto-Novo", imageName: "benin"),
        .init(text: "Belize’s capital is Belmopan", imageName: "belize"),
        .init(text: "Bhutan’s capital is Thimphu", imageName: "bhutan")
    ]
    
    let planets3: [LearnPlanetsItem] = [
        .init(text: "Bulgaria’s capital is Sofia", imageName: "bulgaria"),
        .init(text: "Bolivia’s capital is Sucre", imageName: "bolivia"),
        .init(text: "Brazil’s capital is Brasília", imageName: "Brazil"),
        .init(text: "Bosnia and Herzegovina’s capital is Sarajevo", imageName: "bosnia-and-herzegovina"),
        .init(text: "Brunei’s capital is Bandar Seri Begawan", imageName: "Brunei"),
        .init(text: "Botswana’s capital is Gaborone", imageName: "botswana"),
        .init(text: "Burkina Faso’s capital is Ouagadougou", imageName: "burkina-faso"),
        .init(text: "Burundi’s capital is Gitega", imageName: "burundi"),
        .init(text: "Cabo Verde’s capital is Praia", imageName: "CaboVerde"),
        .init(text: "Cambodia’s capital is Phnom Penh", imageName: "Cambodia")
    ]
    
    let planets4: [LearnPlanetsItem] = [
        .init(text: "Cameroon’s capital is Yaoundé", imageName: "cameroon"),
        .init(text: "Colombia’s capital is Bogotá", imageName: "colombia"),
        .init(text: "Comoros’s capital is Moroni", imageName: "comoros"),
        .init(text: "Canada’s capital is Ottawa", imageName: "Canada"),
        .init(text: "The Democratic Republic of the Congo’s capital is Kinshasa", imageName: "democratic-republic-of-congo"),
        .init(text: "The Central African Republic’s capital is Bangui", imageName: "central-african-republic"),
        .init(text: "Chad’s capital is N'Djamena", imageName: "chad"),
        .init(text: "Chile’s capital is Santiago", imageName: "chile"),
        .init(text: "China’s capital is Beijing", imageName: "China"),
        .init(text: "The Republic of the Congo’s capital is Brazzaville", imageName: "republic-of-the-congo")
    ]
    
    let planets5: [LearnPlanetsItem] = [
        .init(text: "Costa Rica’s capital is San José", imageName: "costa-rica"),
        .init(text: "Côte d'Ivoire’s capital is Yamoussoukro", imageName: "Côte d'Ivoire (Ivory Coast)"),
        .init(text: "Croatia’s capital is Zagreb", imageName: "Croatia"),
        .init(text: "Cuba’s capital is Havana", imageName: "cuba"),
        .init(text: "Cyprus’s capital is Nicosia", imageName: "cyprus"),
        .init(text: "The Czech Republic’s capital is Prague", imageName: "czech-republic"),
        .init(text: "Denmark’s capital is Copenhagen", imageName: "denmark"),
        .init(text: "Djibouti’s capital is Djibouti", imageName: "djibouti"),
        .init(text: "Dominica’s capital is Roseau", imageName: "Dominica"),
        .init(text: "The Dominican Republic’s capital is Santo Domingo", imageName: "Dominican Republic")
    ]
    
    let planets6: [LearnPlanetsItem] = [
        .init(text: "Ecuador’s capital is Quito", imageName: "Ecuador"),
        .init(text: "Egypt’s capital is Cairo", imageName: "Egypt"),
        .init(text: "El Salvador’s capital is San Salvador", imageName: "El Salvador"),
        .init(text: "Equatorial Guinea’s capital is Malabo", imageName: "equatorial-guinea"),
        .init(text: "Eritrea’s capital is Asmara", imageName: "Eritrea"),
        .init(text: "Estonia’s capital is Tallinn", imageName: "Estonia"),
        .init(text: "Eswatini’s capital is Mbabane", imageName: "Eswatini"),
        .init(text: "Ethiopia’s capital is Addis Ababa", imageName: "ethiopia"),
        .init(text: "Fiji’s capital is Suva", imageName: "Fiji"),
        .init(text: "Finland’s capital is Helsinki", imageName: "finland")
    ]
    
    let planets7: [LearnPlanetsItem] = [
        .init(text: "France’s capital is Paris", imageName: "franceFlagNew"),
        .init(text: "Gabon’s capital is Libreville", imageName: "gabon"),
        .init(text: "The Gambia’s capital is Banjul", imageName: "gambia"),
        .init(text: "Georgia’s capital is Tbilisi", imageName: "georgia"),
        .init(text: "Germany’s capital is Berlin", imageName: "germany"),
        .init(text: "Ghana’s capital is Accra", imageName: "ghana"),
        .init(text: "Guinea’s capital is Conakry", imageName: "Guinea"),
        .init(text: "Guatemala’s capital is Guatemala City", imageName: "guatemala"),
        .init(text: "Grenada’s capital is Saint George’s", imageName: "Grenada"),
        .init(text: "Greece’s capital is Athens", imageName: "greece")
    ]
    
    let planets8: [LearnPlanetsItem] = [
        .init(text: "Guinea-Bissau’s capital is Bissau", imageName: "Guinea-Bissau"),
        .init(text: "Guyana’s capital is Georgetown", imageName: "guyana"),
        .init(text: "Haiti’s capital is Port-au-Prince", imageName: "haiti"),
        .init(text: "Honduras’s capital is Tegucigalpa", imageName: "honduras"),
        .init(text: "Hungary’s capital is Budapest", imageName: "hungary"),
        .init(text: "Iceland’s capital is Reykjavik", imageName: "Iceland"),
        .init(text: "India’s capital is New Delhi", imageName: "India"),
        .init(text: "Indonesia’s capital is Jakarta", imageName: "Indonesia"),
        .init(text: "Iran’s capital is Tehran", imageName: "Iran"),
        .init(text: "Iraq’s capital is Baghdad", imageName: "Iraq")
    ]
    
    let planets9: [LearnPlanetsItem] = [
        .init(text: "Ireland’s capital is Dublin", imageName: "Ireland"),
        .init(text: "Israel’s capital is Jerusalem", imageName: "israel"),
        .init(text: "Kenya’s capital is Nairobi", imageName: "Kenya"),
        .init(text: "Kazakhstan’s capital is Astana", imageName: "Kazakhstan"),
        .init(text: "Jordan’s capital is Amman", imageName: "jordan"),
        .init(text: "Japan’s capital is Tokyo", imageName: "japanNew"),
        .init(text: "Jamaica’s capital is Kingston", imageName: "jamaica"),
        .init(text: "Italy’s capital is Rome", imageName: "Italy"),
        .init(text: "Kiribati’s capital is Tarawa", imageName: "kiribati"),
        .init(text: "Kuwait’s capital is Kuwait City", imageName: "Kuwait")
    ]
    
    let planets10: [LearnPlanetsItem] = [
        .init(text: "Kyrgyzstan’s capital is Bishkek", imageName: "Kyrgyzstan"),
        .init(text: "Laos’s capital is Vientiane", imageName: "Laos"),
        .init(text: "Latvia’s capital is Riga", imageName: "Latvia"),
        .init(text: "Lebanon’s capital is Beirut", imageName: "Lebanon"),
        .init(text: "Lesotho’s capital is Maseru", imageName: "lesotho"),
        .init(text: "Liberia’s capital is Monrovia", imageName: "Liberia"),
        .init(text: "Libya’s capital is Tripoli", imageName: "Libya"),
        .init(text: "Liechtenstein’s capital is Vaduz", imageName: "liechtenstein"),
        .init(text: "Luxembourg’s capital is Luxembourg", imageName: "luxembourg"),
        .init(text: "Lithuania’s capital is Vilnius", imageName: "lithuania")
    ]

    let planets11: [LearnPlanetsItem] = [
        .init(text: "Madagascar’s capital is Antananarivo", imageName: "madagascar"),
        .init(text: "Malawi’s capital is Lilongwe", imageName: "malawi"),
        .init(text: "Mauritania’s capital is Nouakchott", imageName: "mauritania"),
        .init(text: "The Marshall Islands’ capital is Majuro", imageName: "Marshall Islands"),
        .init(text: "Malta’s capital is Valletta", imageName: "malta"),
        .init(text: "Mali’s capital is Bamako", imageName: "Mali"),
        .init(text: "Maldives’s capital is Malé", imageName: "maldives"),
        .init(text: "Malaysia’s capital is Kuala Lumpur", imageName: "Malaysia"),
        .init(text: "Mauritius’s capital is Port Louis", imageName: "mauritius"),
        .init(text: "Mexico’s capital is Mexico City", imageName: "Mexico")
    ]
    
    let planets12: [LearnPlanetsItem] = [
        .init(text: "Micronesia’s capital is Palikir", imageName: "Micronesia"),
        .init(text: "Moldova’s capital is Chișinău", imageName: "moldova"),
        .init(text: "Myanmar’s capital is Naypyidaw", imageName: "myanmar"),
        .init(text: "Mozambique’s capital is Maputo", imageName: "mozambique"),
        .init(text: "Morocco’s capital is Rabat", imageName: "morocco"),
        .init(text: "Montenegro’s capital is Podgorica", imageName: "Montenegro"),
        .init(text: "Mongolia’s capital is Ulaanbaatar", imageName: "Mongolia"),
        .init(text: "Monaco’s capital is Monaco", imageName: "monaco"),
        .init(text: "Namibia’s capital is Windhoek", imageName: "Namibia"),
        .init(text: "Nauru’s capital is Yaren", imageName: "Nauru")
    ]
    
    let planets13: [LearnPlanetsItem] = [
        .init(text: "Nepal’s capital is Kathmandu", imageName: "Nepal"),
        .init(text: "The Netherlands’ capital is Amsterdam", imageName: "Netherlands"),
        .init(text: "North Macedonia’s capital is Skopje", imageName: "North Macedonia"),
        .init(text: "North Korea’s capital is Pyongyang", imageName: "North Korea"),
        .init(text: "Nigeria’s capital is Abuja", imageName: "Nigeria"),
        .init(text: "Niger’s capital is Niamey", imageName: "Niger"),
        .init(text: "Nicaragua’s capital is Managua", imageName: "Nicaragua"),
        .init(text: "New Zealand’s capital is Wellington", imageName: "New Zealand"),
        .init(text: "Norway’s capital is Oslo", imageName: "Norway"),
        .init(text: "Oman’s capital is Muscat", imageName: "Oman")
    ]
   
    let planets14: [LearnPlanetsItem] = [
        .init(text: "Pakistan’s capital is Islamabad", imageName: "Pakistan"),
        .init(text: "Palau’s capital is Ngerulmud", imageName: "Palau"),
        .init(text: "The Philippines’ capital is Manila", imageName: "Philippines"),
        .init(text: "Peru’s capital is Lima", imageName: "Peru"),
        .init(text: "Paraguay’s capital is Asunción", imageName: "Paraguay"),
        .init(text: "Papua New Guinea’s capital is Port Moresby", imageName: "Papua New Guinea"),
        .init(text: "Panama’s capital is Panama City", imageName: "Panama"),
        .init(text: "Palestine’s capital is Ramallah", imageName: "Palestine"),
        .init(text: "Poland’s capital is Warsaw", imageName: "Poland"),
        .init(text: "Portugal’s capital is Lisbon", imageName: "Portugal")
    ]
    
    let planets15: [LearnPlanetsItem] = [
        .init(text: "Qatar’s capital is Doha", imageName: "Qatar"),
        .init(text: "Romania’s capital is Bucharest", imageName: "Romania"),
        .init(text: "Russia’s capital is Moscow", imageName: "russiaNew"),
        .init(text: "Rwanda’s capital is Kigali", imageName: "Rwanda"),
        .init(text: "Saint Kitts and Nevis’s capital is Basseterre", imageName: "Saint Kitts and Nevis"),
        .init(text: "Saint Lucia’s capital is Castries", imageName: "Saint Lucia"),
        .init(text: "Saint Vincent and the Grenadines’s capital is Kingstown", imageName: "Saint Vincent and the Grenadines"),
        .init(text: "Samoa’s capital is Apia", imageName: "Samoa"),
        .init(text: "San Marino’s capital is San Marino", imageName: "San Marino"),
        .init(text: "São Tomé and Príncipe’s capital is São Tomé", imageName: "São Tomé and Príncipe")
    ]
    
    let planets16: [LearnPlanetsItem] = [
        .init(text: "Somalia’s capital is Mogadishu", imageName: "Somalia"),
        .init(text: "The Solomon Islands’ capital is Honiara", imageName: "Solomon Islands"),
        .init(text: "Serbia’s capital is Belgrade", imageName: "Serbia"),
        .init(text: "Seychelles’s capital is Victoria", imageName: "Seychelles"),
        .init(text: "Sierra Leone’s capital is Freetown", imageName: "Sierra Leone"),
        .init(text: "Singapore’s capital is Singapore", imageName: "Singapore"),
        .init(text: "Slovakia’s capital is Bratislava", imageName: "Slovakia"),
        .init(text: "Slovenia’s capital is Ljubljana", imageName: "Slovenia"),
        .init(text: "Senegal’s capital is Dakar", imageName: "Senegal"),
        .init(text: "Saudi Arabia’s capital is Riyadh", imageName: "Saudi Arabia")
    ]
    
    let planets17: [LearnPlanetsItem] = [
        .init(text: "South Africa’s capital is Pretoria", imageName: "South Africa"),
        .init(text: "South Korea’s capital is Seoul", imageName: "South Korea (Republic of Korea)"),
        .init(text: "Sweden’s capital is Stockholm", imageName: "Sweden"),
        .init(text: "Suriname’s capital is Paramaribo", imageName: "Suriname"),
        .init(text: "Sudan’s capital is Khartoum", imageName: "Sudan"),
        .init(text: "Sri Lanka’s capital is Sri Jayawardenepura Kotte", imageName: "Sri Lanka"),
        .init(text: "Spain’s capital is Madrid", imageName: "Spain"),
        .init(text: "South Sudan’s capital is Juba", imageName: "South Sudan"),
        .init(text: "Switzerland’s capital is Bern", imageName: "Switzerland"),
        .init(text: "Syria’s capital is Damascus", imageName: "Syria")
    ]
    
    let planets18: [LearnPlanetsItem] = [
        .init(text: "Tajikistan’s capital is Dushanbe", imageName: "Tajikistan"),
        .init(text: "Tanzania’s capital is Dodoma", imageName: "Tanzania"),
        .init(text: "Tunisia’s capital is Tunis", imageName: "Tunisia"),
        .init(text: "Trinidad and Tobago’s capital is Port of Spain", imageName: "Trinidad and Tobago"),
        .init(text: "Tonga’s capital is Nukuʻalofa", imageName: "Tonga"),
        .init(text: "Togo’s capital is Lomé", imageName: "Togo"),
        .init(text: "Timor-Leste’s capital is Dili", imageName: "Timor-Leste"),
        .init(text: "Thailand’s capital is Bangkok", imageName: "Thailand"),
        .init(text: "Turkey’s capital is Ankara", imageName: "Turkey"),
        .init(text: "Turkmenistan’s capital is Ashgabat", imageName: "Turkmenistan")
    ]
    
    let planets19: [LearnPlanetsItem] = [
        .init(text: "Tuvalu’s capital is Funafuti", imageName: "Tuvalu"),
        .init(text: "Uganda’s capital is Kampala", imageName: "Uganda"),
        .init(text: "Uzbekistan’s capital is Tashkent", imageName: "Uzbekistan"),
        .init(text: "Uruguay’s capital is Montevideo", imageName: "Uruguay"),
        .init(text: "The United Arab Emirates’ capital is Abu Dhabi", imageName: "united-arab-emirates"),
        .init(text: "The United States of America’s capital is Washington, D.C.", imageName: "United States of America"),
        .init(text: "The United Kingdom’s capital is London", imageName: "United Kingdom"),
        .init(text: "Ukraine’s capital is Kyiv", imageName: "Ukraine"),
        .init(text: "Vanuatu’s capital is Port Vila", imageName: "Vanuatu"),
        .init(text: "Vatican City’s capital is Vatican City", imageName: "Vatican City")
    ]
    
    let planets20: [LearnPlanetsItem] = [
        .init(text: "Venezuela’s capital is Caracas", imageName: "Venezuela"),
        .init(text: "Vietnam’s capital is Hanoi", imageName: "Vietnam"),
        .init(text: "Yemen’s capital is Sana'a", imageName: "Yemen"),
        .init(text: "Zambia’s capital is Lusaka", imageName: "Zambia"),
        .init(text: "Zimbabwe’s capital is Harare", imageName: "Zimbabwe")
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
        
        
        for i in 1...20 {
            print("Level \(i) Completed:",
                  UserDefaults.standard.bool(forKey: "guessTheCountryCapitalsLevel\(i)Completed"))
        }

        updateLevelImages()
        updateResetVisibility()
    }
    
    
    func updateResetVisibility() {

        let levelData = UserDefaults.standard.dictionary(forKey: "guessTheCountryCapitalsLevelData") as? [String: Int]

        let isAnyCompleted = !(levelData?.isEmpty ?? true)

        restBtn.isHidden = !isAnyCompleted
        restLabel.isHidden = !isAnyCompleted
    }

    
    func updateLevelImages() {

        updateLevelUI(level: 1, imageView: image1, label: label1)
        updateLevelUI(level: 2, imageView: image2, label: label2)
        updateLevelUI(level: 3, imageView: image3, label: label3)
        updateLevelUI(level: 4, imageView: image4, label: label4)
        updateLevelUI(level: 5, imageView: image5, label: label5)
        updateLevelUI(level: 6, imageView: image6, label: label6)
        updateLevelUI(level: 7, imageView: image7, label: label7)
        updateLevelUI(level: 8, imageView: image8, label: label8)
        updateLevelUI(level: 9, imageView: image9, label: label9)
        updateLevelUI(level: 10, imageView: image10, label: label10)
        updateLevelUI(level: 11, imageView: image11, label: label11)
        updateLevelUI(level: 12, imageView: image12, label: label12)
        updateLevelUI(level: 13, imageView: image13, label: label13)
        updateLevelUI(level: 14, imageView: image14, label: label14)
        updateLevelUI(level: 15, imageView: image15, label: label15)
        updateLevelUI(level: 16, imageView: image16, label: label16)
        updateLevelUI(level: 17, imageView: image17, label: label17)
        updateLevelUI(level: 18, imageView: image18, label: label18)
        updateLevelUI(level: 19, imageView: image19, label: label19)
        updateLevelUI(level: 20, imageView: image20, label: label20)
    }
    
    func updateLevelUI(level: Int, imageView: UIImageView, label: UILabel) {

        let levelData = UserDefaults.standard.dictionary(forKey: "guessTheCountryCapitalsLevelData") as? [String: Int] ?? [:]

        if let percentage = levelData["\(level)"] {
            imageView.image = UIImage(named: "done")
            label.text = "\(percentage)%"
        } else {
            imageView.image = nil
            label.text = ""
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
    
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func level1TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets1
        vc.levelNumber = 1
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level2TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets2
        vc.levelNumber = 2
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level3TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets3
        vc.levelNumber = 3
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level4TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets4
        vc.levelNumber = 4
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level5TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets5
        vc.levelNumber = 5
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level6TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets6
        vc.levelNumber = 6
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level7TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets7
        vc.levelNumber = 7
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level8TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets8
        vc.levelNumber = 8
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level9TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets9
        vc.levelNumber = 9
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level10TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets10
        vc.levelNumber = 10
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level11TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets11
        vc.levelNumber = 11
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level12TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets12
        vc.levelNumber = 12
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level13TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets13
        vc.levelNumber = 13
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level14TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets14
        vc.levelNumber = 14
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level15TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets15
        vc.levelNumber = 15
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level16TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets16
        vc.levelNumber = 16
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level17TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets17
        vc.levelNumber = 17
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level18TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets18
        vc.levelNumber = 18
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level19TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets19
        vc.levelNumber = 19
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func level20TapBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuessTheCountryCapitalsShowVC") as! GuessTheCountryCapitalsShowVC
        vc.planets = planets20
        vc.levelNumber = 20
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func restTapBtn(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "guessTheCountryCapitalsLevelData")
        updateLevelImages()
        updateResetVisibility()
    }
    
    
}
