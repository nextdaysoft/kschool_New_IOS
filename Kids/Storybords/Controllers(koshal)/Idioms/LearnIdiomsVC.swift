//
//  LearnIdiomsVC.swift
//  KSchool
//
//  Created by Koshal Singh on 08/04/26.
//

struct LearnIdioms {
    let name: String
    let image: String
}

import UIKit
import AVFoundation

class LearnIdiomsVC: BaseViewController {

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
    @IBOutlet weak var viewBG21: UIView!
    @IBOutlet weak var viewBG22: UIView!
    @IBOutlet weak var viewBG23: UIView!
    @IBOutlet weak var viewBG24: UIView!
    @IBOutlet weak var viewBG25: UIView!
    @IBOutlet weak var viewBG26: UIView!
    @IBOutlet weak var viewBG27: UIView!
    @IBOutlet weak var viewBG28: UIView!
    @IBOutlet weak var viewBG29: UIView!
    @IBOutlet weak var viewBG30: UIView!
    @IBOutlet weak var viewBG31: UIView!
    @IBOutlet weak var viewBG32: UIView!
    @IBOutlet weak var viewBG33: UIView!
    @IBOutlet weak var viewBG34: UIView!
    @IBOutlet weak var viewBG35: UIView!
    @IBOutlet weak var viewBG36: UIView!
    @IBOutlet weak var viewBG37: UIView!
    @IBOutlet weak var viewBG38: UIView!
    @IBOutlet weak var viewBG39: UIView!
    @IBOutlet weak var viewBG40: UIView!
    @IBOutlet weak var viewBG41: UIView!
    @IBOutlet weak var viewBG42: UIView!
    @IBOutlet weak var viewBG43: UIView!
    @IBOutlet weak var viewBG44: UIView!
    @IBOutlet weak var viewBG45: UIView!
    @IBOutlet weak var viewBG46: UIView!
    @IBOutlet weak var viewBG47: UIView!
    @IBOutlet weak var viewBG48: UIView!
    @IBOutlet weak var viewBG49: UIView!
    @IBOutlet weak var viewBG50: UIView!
    
    
    @IBOutlet weak var barView1: UIView!
    @IBOutlet weak var barView2: UIView!
    @IBOutlet weak var barView3: UIView!
    @IBOutlet weak var barView4: UIView!
    @IBOutlet weak var barView5: UIView!
    @IBOutlet weak var barView6: UIView!
    @IBOutlet weak var barView7: UIView!
    @IBOutlet weak var barView8: UIView!
    @IBOutlet weak var barView9: UIView!
    @IBOutlet weak var barView10: UIView!
    @IBOutlet weak var barView11: UIView!
    @IBOutlet weak var barView12: UIView!
    @IBOutlet weak var barView13: UIView!
    @IBOutlet weak var barView14: UIView!
    @IBOutlet weak var barView15: UIView!
    @IBOutlet weak var barView16: UIView!
    @IBOutlet weak var barView17: UIView!
    @IBOutlet weak var barView18: UIView!
    @IBOutlet weak var barView19: UIView!
    @IBOutlet weak var barView20: UIView!
    @IBOutlet weak var barView21: UIView!
    @IBOutlet weak var barView22: UIView!
    @IBOutlet weak var barView23: UIView!
    @IBOutlet weak var barView24: UIView!
    @IBOutlet weak var barView25: UIView!
    @IBOutlet weak var barView26: UIView!
    @IBOutlet weak var barView27: UIView!
    @IBOutlet weak var barView28: UIView!
    @IBOutlet weak var barView29: UIView!
    @IBOutlet weak var barView30: UIView!
    @IBOutlet weak var barView31: UIView!
    @IBOutlet weak var barView32: UIView!
    @IBOutlet weak var barView33: UIView!
    @IBOutlet weak var barView34: UIView!
    @IBOutlet weak var barView35: UIView!
    @IBOutlet weak var barView36: UIView!
    @IBOutlet weak var barView37: UIView!
    @IBOutlet weak var barView38: UIView!
    @IBOutlet weak var barView39: UIView!
    @IBOutlet weak var barView40: UIView!
    @IBOutlet weak var barView41: UIView!
    @IBOutlet weak var barView42: UIView!
    @IBOutlet weak var barView43: UIView!
    @IBOutlet weak var barView44: UIView!
    @IBOutlet weak var barView45: UIView!
    @IBOutlet weak var barView46: UIView!
    @IBOutlet weak var barView47: UIView!
    @IBOutlet weak var barView48: UIView!
    @IBOutlet weak var barView49: UIView!
    @IBOutlet weak var barView50: UIView!
    
    
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
    @IBOutlet weak var label21: UILabel!
    @IBOutlet weak var label22: UILabel!
    @IBOutlet weak var label23: UILabel!
    @IBOutlet weak var label24: UILabel!
    @IBOutlet weak var label25: UILabel!
    @IBOutlet weak var label26: UILabel!
    @IBOutlet weak var label27: UILabel!
    @IBOutlet weak var label28: UILabel!
    @IBOutlet weak var label29: UILabel!
    @IBOutlet weak var label30: UILabel!
    @IBOutlet weak var label31: UILabel!
    @IBOutlet weak var label32: UILabel!
    @IBOutlet weak var label33: UILabel!
    @IBOutlet weak var label34: UILabel!
    @IBOutlet weak var label35: UILabel!
    @IBOutlet weak var label36: UILabel!
    @IBOutlet weak var label37: UILabel!
    @IBOutlet weak var label38: UILabel!
    @IBOutlet weak var label39: UILabel!
    @IBOutlet weak var label40: UILabel!
    @IBOutlet weak var label41: UILabel!
    @IBOutlet weak var label42: UILabel!
    @IBOutlet weak var label43: UILabel!
    @IBOutlet weak var label44: UILabel!
    @IBOutlet weak var label45: UILabel!
    @IBOutlet weak var label46: UILabel!
    @IBOutlet weak var label47: UILabel!
    @IBOutlet weak var label48: UILabel!
    @IBOutlet weak var label49: UILabel!
    @IBOutlet weak var label50: UILabel!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var imageView8: UIImageView!
    @IBOutlet weak var imageView9: UIImageView!
    @IBOutlet weak var imageView10: UIImageView!
    @IBOutlet weak var imageView11: UIImageView!
    @IBOutlet weak var imageView12: UIImageView!
    @IBOutlet weak var imageView13: UIImageView!
    @IBOutlet weak var imageView14: UIImageView!
    @IBOutlet weak var imageView15: UIImageView!
    @IBOutlet weak var imageView16: UIImageView!
    @IBOutlet weak var imageView17: UIImageView!
    @IBOutlet weak var imageView18: UIImageView!
    @IBOutlet weak var imageView19: UIImageView!
    @IBOutlet weak var imageView20: UIImageView!
    @IBOutlet weak var imageView21: UIImageView!
    @IBOutlet weak var imageView22: UIImageView!
    @IBOutlet weak var imageView23: UIImageView!
    @IBOutlet weak var imageView24: UIImageView!
    @IBOutlet weak var imageView25: UIImageView!
    @IBOutlet weak var imageView26: UIImageView!
    @IBOutlet weak var imageView27: UIImageView!
    @IBOutlet weak var imageView28: UIImageView!
    @IBOutlet weak var imageView29: UIImageView!
    @IBOutlet weak var imageView30: UIImageView!
    @IBOutlet weak var imageView31: UIImageView!
    @IBOutlet weak var imageView32: UIImageView!
    @IBOutlet weak var imageView33: UIImageView!
    @IBOutlet weak var imageView34: UIImageView!
    @IBOutlet weak var imageView35: UIImageView!
    @IBOutlet weak var imageView36: UIImageView!
    @IBOutlet weak var imageView37: UIImageView!
    @IBOutlet weak var imageView38: UIImageView!
    @IBOutlet weak var imageView39: UIImageView!
    @IBOutlet weak var imageView40: UIImageView!
    @IBOutlet weak var imageView41: UIImageView!
    @IBOutlet weak var imageView42: UIImageView!
    @IBOutlet weak var imageView43: UIImageView!
    @IBOutlet weak var imageView44: UIImageView!
    @IBOutlet weak var imageView45: UIImageView!
    @IBOutlet weak var imageView46: UIImageView!
    @IBOutlet weak var imageView47: UIImageView!
    @IBOutlet weak var imageView48: UIImageView!
    @IBOutlet weak var imageView49: UIImageView!
    @IBOutlet weak var imageView50: UIImageView!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var pdfBtn: UIButton!
    
    @IBOutlet weak var btnBgView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    var speechSynthesizer = AVSpeechSynthesizer()

    var imageViews: [UIImageView] = []
    var labels: [UILabel] = []
    var barViews: [UIView] = []
    var bgViews: [UIView] = []
    
    var isShowingExample = false
    
    let learnIdioms: [LearnIdioms] = [
        
        // Screen 1
        LearnIdioms(name: "Piece of Cake", image: "idiom_piece_of_cake"),
        LearnIdioms(name: "Break a Leg", image: "idiom_break_a_leg"),
        LearnIdioms(name: "Under the Weather", image: "idiom_under_the_weather"),
        LearnIdioms(name: "Spill the Beans", image: "idiom_spill_the_beans"),
        LearnIdioms(name: "Hit the Sack", image: "idiom_hit_the_sack"),
        LearnIdioms(name: "Cry Over Spilled Milk", image: "idiom_cry_over_spilled_milk"),
        
        // Screen 2
        LearnIdioms(name: "Cold Feet", image: "idiom_cold_feet"),
        LearnIdioms(name: "Once in a Blue Moon", image: "idiom_once_in_a_blue_moon"),
        LearnIdioms(name: "Speak Your Mind", image: "idiom_a_piece_of_mind"), // UI में यही दिख रहा
        LearnIdioms(name: "See Eye to Eye", image: "idiom_see_eye_to_eye"),
        
        // Screen 3
        LearnIdioms(name: "Raining Cats and Dogs", image: "idiom_raining_cats_dogs"),
        LearnIdioms(name: "Hold Your Horses", image: "idiom_hold_your_horses"),
        LearnIdioms(name: "The Ball is in Your Court", image: "idiom_ball_is_in_your_court"),
        LearnIdioms(name: "A Fish Out of Water", image: "idiom_fish_out_of_water"),
        LearnIdioms(name: "Let the Cat Out of the Bag", image: "idiom_cat_out_of_the_bag"),
        LearnIdioms(name: "Butterflies in My Stomach", image: "idiom_butterflies_in_stomach"),
        
        // Screen 4
        LearnIdioms(name: "A Blessing in Disguise", image: "idiom_blessing_in_disguise"),
        LearnIdioms(name: "On Cloud Nine", image: "idiom_on_cloud_nine"),
        LearnIdioms(name: "The Early Bird Catches the Worm", image: "idiom_early_bird_catches_worm"),
        LearnIdioms(name: "When Pigs Fly", image: "idiom_when_pigs_fly"),
        LearnIdioms(name: "A Dime a Dozen", image: "idiom_a_dime_a_dozen"),
        LearnIdioms(name: "Hit the Nail on the Head", image: "idiom_hit_nail_on_head"),
        
        // Screen 5
        LearnIdioms(name: "Cost an Arm and a Leg", image: "idiom_cost_arm_and_leg"),
        LearnIdioms(name: "In Hot Water", image: "idiom_in_hot_water"),
        LearnIdioms(name: "Keep an Eye On", image: "idiom_keep_an_eye"),
        LearnIdioms(name: "Bite the Bullet", image: "idiom_bite_the_bullet"),
        LearnIdioms(name: "Burn the Midnight Oil", image: "idiom_burn_the_midnight_oil"),
        LearnIdioms(name: "Call It a Day", image: "idiom_call_it_a_day"),
        
        // Screen 6
        LearnIdioms(name: "Caught Red-Handed", image: "idiom_caught_red_handed"),
        LearnIdioms(name: "Add Fuel to the Fire", image: "idiom_add_fuel_to_fire"),
        LearnIdioms(name: "Don't Judge a Book by Its Cover", image: "idiom_dont_judge_book_cover"),
        LearnIdioms(name: "Two Heads Are Better Than One", image: "idiom_two_heads_better"),
        LearnIdioms(name: "Kill Two Birds with One Stone", image: "idiom_kill_two_birds_one_stone"),
        LearnIdioms(name: "Let Sleeping Dogs Lie", image: "idiom_let_sleeping_dogs_lie"),
        
        // Screen 7
        LearnIdioms(name: "The Last Straw", image: "idiom_the_last_straw"),
        LearnIdioms(name: "Pull Someone's Leg", image: "idiom_pull_someones_leg"),
        LearnIdioms(name: "Speak of the Devil", image: "idiom_devil"),
        LearnIdioms(name: "Get the Ball Rolling", image: "idiom_the_ball_is_rolling"),
        LearnIdioms(name: "Actions Speak Louder Than Words", image: "idiom_actions_speak_louder"),
        LearnIdioms(name: "The Whole Nine Yards", image: "idiom_the_whole_nine_yards"),
        
        // Screen 8
        LearnIdioms(name: "Bite Off More Than You Can Chew", image: "idiom_bite_off_more_than_you_can_chew"),
        LearnIdioms(name: "Burn Bridges", image: "idiom_burn_bridges"),
        LearnIdioms(name: "By the Skin of Your Teeth", image: "idiom_by_the_skin_of_your_teeth"),
        LearnIdioms(name: "Every Cloud Has a Silver Lining", image: "idiom_every_cloud_has_a_silver_lining"),
        LearnIdioms(name: "Face the Music", image: "idiom_face_the_music"),
        LearnIdioms(name: "Go the Extra Mile", image: "idiom_go_the_extra_mile"),
        
        // Screen 9
        LearnIdioms(name: "Hit the Jackpot", image: "idiom_hit_the_jackpot"),
        LearnIdioms(name: "In the Blink of an Eye", image: "idiom_in_the_blink_of_an_eye"),
        LearnIdioms(name: "Jump on the Bandwagon", image: "idiom_jump_on_the_bandwagon"),
        LearnIdioms(name: "Make a Mountain out of a Molehill", image: "idiom_make_a_mountain_out_of_a_molehill")
    ]
    
    let showExample: [LearnIdioms] = [
        
        // Screen 1
        LearnIdioms(name: "Something very easy", image: "idiom_easy_task"),
        LearnIdioms(name: "Good luck", image: "idiom_good_luck"),
        LearnIdioms(name: "feeling sick", image: "idiom_sick"),
        LearnIdioms(name: "tell a secret", image: "idiom_secret"),
        LearnIdioms(name: "Go to sleep", image: "idiom_sleep"),
        LearnIdioms(name: "Be sad about something that cannot be fixed", image: "idiom_no_use_crying"),
        
        // Screen 2
        LearnIdioms(name: "Feeling nervous or scared", image: "idiom_scared"),
        LearnIdioms(name: "Something that happens rarely", image: "idiom_rare"),
        LearnIdioms(name: "Say what you are really thinking", image: "idiom_say_thoughts"),
        LearnIdioms(name: "Agree with someone", image: "idiom_agree"),
        
        // Screen 3
        LearnIdioms(name: "Rain is very heavy", image: "idiom_heavy_rain"),
        LearnIdioms(name: "Wait a moment, be patient", image: "idiom_be_patient"),
        LearnIdioms(name: "It’s your turn to decide or act", image: "idiom_your_turn_to_decide"),
        LearnIdioms(name: "Feeling uncomfortable in a new place", image: "idiom_feeling_uncomfortable"),
        LearnIdioms(name: "Reveal a secret accidentally", image: "idiom_reveal_a_secret"),
        LearnIdioms(name: "Feeling nervous", image: "idiom_feeling_nervous"),
        
        // Screen 4
        LearnIdioms(name: "Something that seems bad but turns out good", image: "idiom_something_seems_bad"),
        LearnIdioms(name: "Very happy", image: "idiom_very_happy"),
        LearnIdioms(name: "Pepale who start early have an advantage", image: "idiom_early_have_an_advantage"),
        LearnIdioms(name: "Something that will never happen", image: "idiom_something_never_happen"),
        LearnIdioms(name: "Something very common", image: "idiom_something_very_comman"),
        LearnIdioms(name: "Say exactly right thing", image: "idiom_say_exactly_right_thing"),
        
        // Screen 5
        LearnIdioms(name: "Very Expensive", image: "idiom_very_expensive"),
        LearnIdioms(name: "In trouble", image: "idiom_in_trouble"),
        LearnIdioms(name: "Watch carefully", image: "idiom_watch_carefully"),
        LearnIdioms(name: "Face a difficult situation bravely", image: "idiom_face_difficulty"),
        LearnIdioms(name: "Work let into the night", image: "idiom_burn_the_midnight_oil"),
        LearnIdioms(name: "Stop working for today", image: "idiom_stop_working"),
        
        // Screen 6
        LearnIdioms(name: "Caught while doing something wrong", image: "idiom_caught_doing_wrong"),
        LearnIdioms(name: "Make a bad situation worse", image: "idiom_make_problem_worse"),
        LearnIdioms(name: "Do not judge someone by how they look", image: "idiom_not_judge_by_appearance"),
        LearnIdioms(name: "Working together gives better results", image: "idiom_work_together"),
        LearnIdioms(name: "Complete two tasks with one action", image: "idiom_two_tasks_one_action"),
        LearnIdioms(name: "Avoid creating problems", image: "idiom_avoid_trouble"),
        
        // Screen 7
        LearnIdioms(name: "The final problem that causes anger", image: "idiom_final_problem"),
        LearnIdioms(name: "Joking or teasing someone", image: "idiom_joking"),
        LearnIdioms(name: "The Person you were talking about appears", image: "idiom_person_appears"),
        LearnIdioms(name: "Start something", image: "idiom_start_something"),
        LearnIdioms(name: "What you do is more important than what you say", image: "idiom_do_not_just_say"),
        LearnIdioms(name: "Everything or the entire amount", image: "idiom_everything"),
        
        // Screen 8
        LearnIdioms(name: "Take on a task that is too big", image: "idiom_too_much_work"),
        LearnIdioms(name: "Destroy a relationship or opportunity", image: "idiom_destroy_relationship"),
        LearnIdioms(name: "Just barely succeed", image: "idiom_just_barely"),
        LearnIdioms(name: "There is something good in every bad situation", image: "idiom_look_for_positive"),
        LearnIdioms(name: "Accept the consequences of your actions", image: "idiom_accept_consequences"),
        LearnIdioms(name: "Put in more effort than required", image: "idiom_put_extra_effort"),
        
        // Screen 9
        LearnIdioms(name: "Have great success or luck", image: "idiom_have_luck"),
        LearnIdioms(name: "Happen very quickly", image: "idiom_very_quickly"),
        LearnIdioms(name: "Join a popular trend or activity", image: "idiom_join_trend"),
        LearnIdioms(name: "Exaggerate a small problem", image: "idiom_exaggerate_problem")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        bgViews = [
            viewBG1,viewBG2,viewBG3,viewBG4,viewBG5,
            viewBG6,viewBG7,viewBG8,viewBG9,viewBG10,
            viewBG11,viewBG12,viewBG13,viewBG14,viewBG15,
            viewBG16,viewBG17,viewBG18,viewBG19,viewBG20,
            viewBG21,viewBG22,viewBG23,viewBG24,viewBG25,
            viewBG26,viewBG27,viewBG28,viewBG29,viewBG30,
            viewBG31,viewBG32,viewBG33,viewBG34,viewBG35,
            viewBG36,viewBG37,viewBG38,viewBG39,viewBG40,
            viewBG41,viewBG42,viewBG43,viewBG44,viewBG45,
            viewBG46,viewBG47,viewBG48,viewBG49,viewBG50
        ]
        
        for view in bgViews {
               view.layer.cornerRadius = 10
               view.clipsToBounds = true
           }
        
        imageViews = [
               imageView1,imageView2,imageView3,imageView4,imageView5,
               imageView6,imageView7,imageView8,imageView9,imageView10,
               imageView11,imageView12,imageView13,imageView14,imageView15,
               imageView16,imageView17,imageView18,imageView19,imageView20,
               imageView21,imageView22,imageView23,imageView24,imageView25,
               imageView26,imageView27,imageView28,imageView29,imageView30,
               imageView31,imageView32,imageView33,imageView34,imageView35,
               imageView36,imageView37,imageView38,imageView39,imageView40,
               imageView41,imageView42,imageView43,imageView44,imageView45,
               imageView46,imageView47,imageView48,imageView49,imageView50
           ]

           labels = [
               label1,label2,label3,label4,label5,
               label6,label7,label8,label9,label10,
               label11,label12,label13,label14,label15,
               label16,label17,label18,label19,label20,
               label21,label22,label23,label24,label25,
               label26,label27,label28,label29,label30,
               label31,label32,label33,label34,label35,
               label36,label37,label38,label39,label40,
               label41,label42,label43,label44,label45,
               label46,label47,label48,label49,label50
           ]

           barViews = [
               barView1,barView2,barView3,barView4,barView5,
               barView6,barView7,barView8,barView9,barView10,
               barView11,barView12,barView13,barView14,barView15,
               barView16,barView17,barView18,barView19,barView20,
               barView21,barView22,barView23,barView24,barView25,
               barView26,barView27,barView28,barView29,barView30,
               barView31,barView32,barView33,barView34,barView35,
               barView36,barView37,barView38,barView39,barView40,
               barView41,barView42,barView43,barView44,barView45,
               barView46,barView47,barView48,barView49,barView50
           ]

           loadData(data: learnIdioms)
    }
    
    func loadData(data: [LearnIdioms]) {
        for i in 0..<data.count {
            imageViews[i].image = UIImage(named: data[i].image)
            labels[i].text = data[i].name
        }

        // Random colors update
        for bar in barViews {
            bar.backgroundColor = ColorManager.randomColor()
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
    
    func speak(text: String) {

        // Agar pehle se bol raha hai to turant stop karo
        if speechSynthesizer.isSpeaking {
            speechSynthesizer.stopSpeaking(at: .immediate)
        }

        // Chhota sa delay taaki previous speech completely stop ho jaye
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {

            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            utterance.rate = 0.35
            utterance.pitchMultiplier = 1.2
            utterance.preUtteranceDelay = 0
            utterance.postUtteranceDelay = 0

            self.speechSynthesizer.speak(utterance)
        }
    }

    
    func captureView(_ view: UIView) -> UIImage {

        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)

        return renderer.image { context in
            view.layer.render(in: context.cgContext)
        }
    }
    
    func createPDF() -> URL? {

        let pdfURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("LearnIdioms.pdf")

        let pageWidth = mainView.bounds.width
        let pageHeight: CGFloat = 800

        let renderer = UIGraphicsPDFRenderer(
            bounds: CGRect(x: 0,
                           y: 0,
                           width: pageWidth,
                           height: pageHeight)
        )

        do {

            try renderer.writePDF(to: pdfURL) { context in

                let totalHeight = mainView.bounds.height

                var currentY: CGFloat = 0

                while currentY < totalHeight {

                    context.beginPage()

                    context.cgContext.saveGState()

                    context.cgContext.translateBy(
                        x: 0,
                        y: -currentY
                    )

                    mainView.layer.render(
                        in: context.cgContext
                    )

                    context.cgContext.restoreGState()

                    currentY += pageHeight
                }
            }

            return pdfURL

        } catch {

            print(error)
            return nil
        }
    }
    
    // MARK: Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pdfTapBtn(_ sender: UIButton) {

        guard let pdfURL = createPDF() else { return }

        let activityVC = UIActivityViewController(
            activityItems: [pdfURL],
            applicationActivities: nil
        )

        if let popover = activityVC.popoverPresentationController {
            popover.sourceView = sender
        }

        present(activityVC, animated: true)
    }
    
    
    @IBAction func bodyPartTapped(_ sender: UIButton) {
        let index = sender.tag
        
        if isShowingExample {
            speak(text: showExample[index].name)   // बोले: Something very easy
        } else {
            speak(text: learnIdioms[index].name)   // बोले: Piece of Cake
        }
    }
    
    @IBAction func showExampleTapBtn(_ sender: UISwitch) {
        isShowingExample = sender.isOn
        
        if isShowingExample {
            // Sirf images change karo
            for i in 0..<showExample.count {
                imageViews[i].image = UIImage(named: showExample[i].image)
            }
        } else {
            // Original images
            for i in 0..<learnIdioms.count {
                imageViews[i].image = UIImage(named: learnIdioms[i].image)
            }
        }
    }
}
