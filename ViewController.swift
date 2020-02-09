//
//  ViewController.swift
//  stopwatch
//
//  Created by yamagishi on 2020/01/12.
//  Copyright © 2020 yamagishi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageview: UIImageView!
    
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var stopButton: UIButton!
    
    var timer = Timer()
    
    var count = Int()
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 0
        
        for i in 0..<5 {

            print(i)
            
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
            }
        
        imageview.image = UIImage(named: "0")
        
        }
        

    func startTimer(){
        //0.2秒ごとに回す
        timer = Timer.scheduledTimer(timeInterval:0.2 , target:self, selector:#selector(timerUpdate), userInfo: nil, repeats: true)
        
    }
    
    //0.2秒ごとに呼び出し
    @objc func timerUpdate(){
        
        count = count + 1
        
        if count > 4{
            count = 0
        }
        imageview.image = imageArray[count]
        
    }

    @IBAction func start(_ sender: Any) {
        
        
        
        //ボタン操作可否
        startButton.isEnabled = false
        stopButton.isEnabled = true
        
        startTimer()
    }
    
    
    @IBAction func stop(_ sender: Any) {
        
        
        //ボタン操作可否
        startButton.isEnabled = true
        stopButton.isEnabled = false
        //タイマーストップ
        timer.invalidate()
        
    }
    
}
