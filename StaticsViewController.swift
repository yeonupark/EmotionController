//
//  StaticsViewController.swift
//  EmotionController
//
//  Created by 마르 on 2023/07/25.
//

import UIKit

class StaticsViewController: UIViewController {

    @IBOutlet var happyView: UIView!
    @IBOutlet var goodView: UIView!
    @IBOutlet var okView: UIView!
    @IBOutlet var notOkView: UIView!
    @IBOutlet var sadView: UIView!
    
    
    @IBOutlet var happyCount: UILabel!
    @IBOutlet var goodCount: UILabel!
    @IBOutlet var okCount: UILabel!
    @IBOutlet var notOkCount: UILabel!
    @IBOutlet var sadCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        happyCount.tag = Emotion.happy.rawValue
        goodCount.tag = Emotion.good.rawValue
        okCount.tag = Emotion.ok.rawValue
        notOkCount.tag = Emotion.notOk.rawValue
        sadCount.tag = Emotion.sad.rawValue
        
        designView(happyView, color: Color.happy.rawValue)
        designView(goodView, color: Color.good.rawValue)
        designView(okView, color: Color.ok.rawValue)
        designView(notOkView, color: Color.notOk.rawValue)
        designView(sadView, color: Color.sad.rawValue)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showCount(happyCount)
        showCount(goodCount)
        showCount(okCount)
        showCount(notOkCount)
        showCount(sadCount)
    }
    
    func designView(_ sender: UIView, color: String) {
        sender.backgroundColor = UIColor(named: color)
    }
    
    func showCount(_ sender: UILabel) {
        
        guard let value = Emotion(rawValue: sender.tag) else {
            print("오류 발생")
            return
        }
        
        let count: Int
        switch value {
        case .happy: count = UserDefaults.standard.integer(forKey: "happy")
        case .good: count = UserDefaults.standard.integer(forKey: "good")
        case .ok: count = UserDefaults.standard.integer(forKey: "ok")
        case .notOk: count = UserDefaults.standard.integer(forKey: "notOk")
        case .sad: count = UserDefaults.standard.integer(forKey: "sad")
        }
        
        sender.text = String("\(count)점")
    }

}
