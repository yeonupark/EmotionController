//
//  ViewController.swift
//  EmotionController
//
//  Created by 마르 on 2023/07/25.
//

import UIKit

enum Emotion: Int {
    case happy
    case good
    case ok
    case notOk
    case sad
}

enum Color: String {
    case happy = "skyblue"
    case good = "green"
    case ok = "yellow"
    case notOk = "orange"
    case sad = "red"
}

enum Emoji: String {
    case happy = "😍"
    case good = "😀"
    case ok = "🙂"
    case notOk = "🙁"
    case sad = "🤯"
}


class ViewController: UIViewController {
    
    @IBOutlet var happyButton: UIButton!
    @IBOutlet var goodButton: UIButton!
    @IBOutlet var okButton: UIButton!
    @IBOutlet var notOkButton: UIButton!
    @IBOutlet var sadButton: UIButton!
    
    @IBOutlet var resetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        happyButton.tag = Emotion.happy.rawValue
        goodButton.tag = Emotion.good.rawValue
        okButton.tag = Emotion.ok.rawValue
        notOkButton.tag = Emotion.notOk.rawValue
        sadButton.tag = Emotion.sad.rawValue
        
        designButton(happyButton, emoji: Emoji.happy.rawValue, color: Color.happy.rawValue)
        designButton(goodButton, emoji: Emoji.good.rawValue, color: Color.good.rawValue)
        designButton(okButton, emoji: Emoji.ok.rawValue, color: Color.ok.rawValue)
        designButton(notOkButton, emoji: Emoji.notOk.rawValue, color: Color.notOk.rawValue)
        designButton(sadButton, emoji: Emoji.sad.rawValue, color: Color.sad.rawValue)
        designResetButton()
        
    }

    func designButton(_ sender: UIButton, emoji: String, color: String) {
        sender.setTitle(emoji, for: .normal)
        sender.backgroundColor = UIColor(named: color)
    }
    
    func designResetButton(){
        resetButton.backgroundColor = .gray
        resetButton.titleLabel?.font = .systemFont(ofSize: 18)
        resetButton.titleLabel?.textColor = .red
        resetButton.titleLabel?.tintColor = .red
    }
    
    @IBAction func ButtonClicked(_ sender: UIButton) {
        
        guard let value = Emotion(rawValue: sender.tag) else {
            print("오류 발생")
            return
        }
        
        switch value {
        case .happy: NumberUp(key: "happy")
        case .good: NumberUp(key: "good")
        case .ok: NumberUp(key: "ok")
        case .notOk: NumberUp(key: "notOk")
        case .sad: NumberUp(key: "sad")
        }
        
//        switch sender.tag {
//        case Emotion.happy.rawValue:
//            NumberUp(key: "happy")
//        case Emotion.good.rawValue:
//            NumberUp(key: "good")
//        case Emotion.ok.rawValue:
//            NumberUp(key: "ok")
//        case Emotion.notOk.rawValue:
//            NumberUp(key: "notOk")
//        case Emotion.sad.rawValue:
//            NumberUp(key: "sad")
//        default:
//            print("오류 발생")
//        }
    }
    
    func NumberUp(key: String){
        let value = UserDefaults.standard.integer(forKey: key)
        let num = value + 1
        UserDefaults.standard.set(num, forKey: key)
        print("\(key) : \(num)")
    }
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        UserDefaults.standard.set(0, forKey: "happy")
        UserDefaults.standard.set(0, forKey: "good")
        UserDefaults.standard.set(0, forKey: "ok")
        UserDefaults.standard.set(0, forKey: "notOk")
        UserDefaults.standard.set(0, forKey: "sad")
    }
}

