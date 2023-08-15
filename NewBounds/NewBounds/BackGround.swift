//
//  BackGround.swift
//  NewBounds
//
//  Created by Артем on 31.05.2023.
//

import Foundation
import UIKit
import AVFoundation

struct Random {
    var random = Int.random(in: 100...300)
}
class BackGround : UIViewController {
 
    var numSheets = Int.random(in: 2...3)
    var questLevel = 1
    var num = 0
    var numL = 0
    var isFishCatched = false
    var numbers = 0
    var timer = Timer()
    var timer2 = Timer()
    var time = 10
    var timer3 = Timer()
    var mass = [UIImageView]()
    var sl = Sheet()
    
    lazy var life:[UIImageView] = {
        return   [self.sl.sheeet , self.sl.sheeet2 , self.sl.sheeet3 , self.sl.sheeet4, self.sl.sheeet5 , self.sl.sheeet6, self.sl.sheeet7, self.sl.sheeet8, self.sl.sheeet9, self.sl.sheeet10, self.sl.sheeet11, self.sl.sheeet12, self.sl.sheeet13,  self.sl.sheeet14 , self.sl.sheeet15 , self.sl.sheeet16 , self.sl.sheeet17 , self.sl.sheeet18 , self.sl.sheeet19 , self.sl.sheeet20 , self.sl.sheeet21,  self.sl.sheeet22,  self.sl.sheeet23 , self.sl.sheeet24 , self.sl.sheeet25 , self.sl.sheeet26,  self.sl.sheeet27,  self.sl.sheeet28,  self.sl.sheeet29 ,  self.sl.sheeet30,  self.sl.sheeet31 ,  self.sl.sheeet32 ,  self.sl.sheeet33]
        
        
    }()
    lazy var puping = [UIImageView]()
        
  
   
    var list: UIImageView {
        return sl.sheeet
    }
    
    var pups : UIImageView {
        return list
    }
    
    
    @objc func timeMinus () {
        if time != 0 {
            time -= 1
        } else {
            timer2.invalidate()
            time = 10
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
            timer3 = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(life1), userInfo: nil, repeats: true)
        }
    }
    
    @objc func tick() {
        var random = Random()
       
    
        UIView.animate(withDuration: 2) { [weak self] in
            guard let self = self else { return }
            
            self.bull.transform = CGAffineTransform(translationX: CGFloat(random.random), y: CGFloat(Int.random(in: 0...20)))
            
            
        }
        
        if numSheets == numbers {
            questLevel += 1
            numSheets = Int.random(in: 2...10)
            numbers = 0
        
            quest.text = "Уровень \(questLevel). Нужно собрать \(numSheets) удобрения."
        
        }
        //        let seconds = 2.0
        //        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [self] in
        //            life1()
        //        }
    }
    var player : AVAudioPlayer!
    
    @objc func life1() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: { [self] in
            num += 1
            
            puping.append(life[num])
            
            for i in puping {
                
                // Put your code which should be executed with a delay here
                
                // Put your code which should be executed with a delay here
                
                self.view.addSubview(i)
                
                numL += 1
                print(num)
                
                mass.append(life[num])
                if mass .isEmpty {
                    print("-")
                }else {
                    //                puping[num].transform = CGAffineTransform(translationX: CGFloat(random - 50), y: CGFloat(Int.random(in: 0...50)))
                }
            }
            
            
            // Put your code which should be executed with a delay here
            
            //        self.life[Int.random(in: 0...32)].transform = CGAffineTransform(translationX: CGFloat(random - 50), y: CGFloat(Int.random(in: 0...50)))
        })
    }
    
    func play() {
        let url = Bundle.main.url(forResource: "sound_01", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
    
    static var score = 3

    
    
    
    lazy var frozen : UIButton = {
       
        let view = UIButton(frame: CGRect(x:300, y: 50, width: 100, height: 50))
        
        view.backgroundColor = .blue
        
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.addTarget(self, action: #selector(clickButtonFrozen), for: .touchUpInside)
        return view
    }()
    
    @objc func clickButtonFrozen() {
        
        pups.frame = CGRect(x: 100, y: 550, width: 50, height: 50)
        timer.invalidate()
        timer3.invalidate()
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeMinus), userInfo: nil, repeats: true)
        
        guard BackGround.score != 0 else {
            print("Заморозка закончилась.Купить их можно на нашем сайте")
            return
        }
        BackGround.score -= 1
        textSnow.text = "Осталось : \(BackGround.score) шт."
        print("\(BackGround.score)")
        
        if BackGround.score == 0 {
            print("Заморозка закончилась.Купить их можно на нашем сайте")
        }
        
    }
    
    lazy var frozenSnow : UIImageView = {
        
        
        let pups = UIImage(named: "image4")
        let pups2 = UIImageView(image: pups!)
        pups2.frame = CGRect(x: 325, y: 50, width: 50, height: 50)
        return pups2
    }()
    
    lazy var textSnow : UILabel = {
        
        let pups = UILabel(frame: CGRect(x: 270, y: 120, width: 150, height: 15))
        pups.text = "Осталось : \(BackGround.score) шт."
        pups.backgroundColor = .red
        pups.textColor = .green
        return pups
    }()
    
    lazy var smile : UIImageView = {
        
        let pups = UIImage(named: "Image5")
        let pups2 = UIImageView(image: pups!)
        pups2.frame = CGRect(x: 0, y: 50, width: 150, height: 150)
        return pups2
    }()
    
    lazy var sheetCount : UILabel =  {
        
        let pups = UILabel()
        pups.text = "Удобрения собрано : \(numbers)"
        pups.frame = CGRect(x: 0, y: 200, width: 200, height: 50)
        pups.textColor = .blue
        pups.backgroundColor = .yellow
        return pups
    }()
    
    lazy var quest : UILabel =  {
        
        let pups = UILabel()
        pups.text = "Уровень \(questLevel). Нужно собрать \(numSheets) удобрения."
        pups.frame = CGRect(x: 0, y: 400, width: 400, height: 50)
        pups.textColor = .green
        pups.backgroundColor = .red
        return pups
    }()
    
    
//    lazy var sheeet : UIImageView = {
//        
//        let pups = UIImage(named: "sheet")
//        let pups2 = UIImageView(image: pups!)
//        pups2.frame = CGRect(x: 100, y: 550, width: 50, height: 50)
//        return pups2
//    }()
//    
    
    
    
    
    
    lazy var bull : UIImageView = {
        let view = UIImage(named: "image3")
        let imageView = UIImageView(image: view!)
        imageView.frame = CGRect(x: 0, y: 750, width: 100, height: 100)
        return imageView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var random = Random()
        random.random = Int.random(in: 100...300)
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        view.addGestureRecognizer(tap)
        
        let derevnya = UIImage(named: "image2") ?? UIImage()
        let im = UIImageView(image: derevnya)
        im.frame = CGRect(x: 0, y: 0, width: 414, height: 896)
//        im.contentMode = .scaleToFill
     
        view.addSubview(im)
        
//        view.backgroundColor = UIColor(patternImage: derevnya)
        view.addSubview(bull)
        view.addSubview(frozen)
        view.addSubview(frozenSnow)
        view.addSubview(smile)
        view.isUserInteractionEnabled = true
        view.addSubview(textSnow)
        view.addSubview(sheetCount)
        view.addSubview(quest)
        play()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        timer3 = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(life1), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func didTap(_ gesture: UITapGestureRecognizer) {
      
       

        if numbers > 5 {
            smile.image = UIImage(named: "smile")
        }
        for i in puping{
           
                let tapLocation = gesture.location(in: i.superview)
                if ((i.layer.presentation()?.frame.contains(tapLocation))!) {
                    if let index = puping.index(of: i) {
                        puping.remove(at: index)
                    }
                    numbers += 1
                    sheetCount.text = "Удобрения собрано \(numbers)"
                    UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
                        i.alpha = 0.0
                    }).startAnimation()
                    print("fish tapped!")
                    if isFishCatched { return }
                    isFishCatched = true
                }
                
            
            
        }
        
        
    }
}
