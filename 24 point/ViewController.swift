//
//  ViewController.swift
//  24 point
//
//  Created by earth on 2020/4/12.
//  Copyright © 2020 earth. All rights reserved.
//
/*
 修订历史：
 2020.04.23
 1）增加算法判断和提示，剔除无法计算的随机组合，确保生成的牌一定是可计算的；
 2）遗留问题：算法有部分重叠，使用标签显示计算公式提示存在显示q不全的问题，下一步计划去重和改为弹窗提示计算公式，实现去重后就可以进行难度分级了
 */
import UIKit

class ViewController: UIViewController {
    // MARK: properties
    
    @IBOutlet weak var poker1Image: UIImageView!
    @IBOutlet weak var poker2Image: UIImageView!
    @IBOutlet weak var poker3Image: UIImageView!
    @IBOutlet weak var poker4Image: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var helpLabel: UILabel!
    
    var calculateResult: String = ""


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        helpLabel.isHidden = true
        helpLabel.text = "The result is: \n"
        deal()
    }
    
    // MARK: func
    
    @IBAction func refreshButton(_ sender: Any) {
        // deal
        deal()
        
        // Clear the result label
        resultLabel.text = "24 Point"
        
    }
    
    
    @IBAction func binResult(_ sender: Any) {
        // Clear the result label
        resultLabel.text = "24 Point"
    }
    
    @IBAction func help(_ sender: UIButton) {
        if helpLabel.isHidden {
            helpLabel.text?.append(calculateResult)
            helpLabel.isHidden = false
        } else {
            helpLabel.text = "The result is: \n"
            helpLabel.isHidden = true
        }
        
    }
    //
    func deal() {
        var pokerList: [String] = [
            "1-clubs","1-diamonds", "1-hearts", "1-spades",
            "2-clubs","2-diamonds", "2-hearts", "2-spades",
            "3-clubs","3-diamonds", "3-hearts", "3-spades",
            "4-clubs","4-diamonds", "4-hearts", "4-spades",
            "5-clubs","5-diamonds", "5-hearts", "5-spades",
            "6-clubs","6-diamonds", "6-hearts", "6-spades",
            "7-clubs","7-diamonds", "7-hearts", "7-spades",
            "8-clubs","8-diamonds", "8-hearts", "8-spades",
            "9-clubs","9-diamonds", "9-hearts", "9-spades",
            "10-clubs","10-diamonds", "10-hearts", "10-spades",
            "11-clubs","11-diamonds", "11-hearts", "11-spades",
            "12-clubs","12-diamonds", "12-hearts", "12-spades",
            "13-clubs","13-diamonds", "13-hearts", "13-spades",
            ]
        
        // Get random poker number
        let poker1Number = Int.random(in: 0...51)
        let poker2Number = Int.random(in: 0...51)
        let poker3Number = Int.random(in: 0...51)
        let poker4Number = Int.random(in: 0...51)
        
        print("random: \(poker1Number), \(poker2Number), \(poker3Number), \(poker4Number)")
        /*
        poker1Number = 50
        poker2Number = 41
        poker3Number = 11
        poker4Number = 42
        */
        calculateResult = calculateAll(a: (poker1Number/4+1), b: (poker2Number/4+1), c: (poker3Number/4+1), d: (poker4Number/4+1))
        if calculateResult.isEmpty {
            deal()
        } else {
            // Set poker image
            poker1Image.image = UIImage(named: "\(pokerList[poker1Number])")
            poker2Image.image = UIImage(named: "\(pokerList[poker2Number])")
            poker3Image.image = UIImage(named: "\(pokerList[poker3Number])")
            poker4Image.image = UIImage(named: "\(pokerList[poker4Number])")
        }
        
        helpLabel.text = "The result is: \n"
        helpLabel.isHidden = true
    }
    
}

