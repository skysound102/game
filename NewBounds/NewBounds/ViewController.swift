//
//  ViewController.swift
//  Bounds
//
//  Created by Артем on 29.05.2023.
//

import UIKit

class ViewController: UIViewController {


    var isAnimated = false

    let screen = UIScreen.main.bounds
    let square = UIView()
    let button = UIButton()
    let button2 = UIButton()
    lazy var topAncor =  square.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15)
    override func viewDidLoad() {
        super.viewDidLoad()
        let backImage = UIImage(named: "image")  ?? UIImage()

   
        view.backgroundColor = UIColor(patternImage: backImage)
  
//        let frame = CGRect(x: screen.width/2-50, y: screen.height/2-50, width: 100, height: 100)
//        // Do any additional setup after loading the view.
//        square.frame = frame
//        square.backgroundColor = .blue
hideNavigationBar()
//        view.addSubview(square)
//        view.translatesAutoresizingMaskIntoConstraints = false
        setupLayout()
        self.navigationItem.setHidesBackButton(true, animated: false)
    }

    func setupLayout() {
  
        configureButton()
    
    }
    func configureSquare() {
        view.addSubview(square)
        square.backgroundColor = .blue
        
        square.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([topAncor,
      
        square.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        square.widthAnchor.constraint(equalToConstant: 50),
       square.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureButton() {
        view.addSubview(button2)
        


        self.navigationItem.leftBarButtonItem?.isEnabled = false
        self.navigationItem.setHidesBackButton(true, animated: false)
        let stick = UIImage(named: "image") ?? UIImage()
        button2.backgroundColor = UIColor(patternImage: stick)
        button2.layer.cornerRadius = 20
        button2.translatesAutoresizingMaskIntoConstraints = false
    
        button2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        button2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 130).isActive = true
     
        button2.widthAnchor.constraint(equalToConstant: 130).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button2.setTitle("Начать играть", for: .normal)
        button2.setTitleColor(.green, for: .normal)
//        button2.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button2.addAction(UIAction(handler: { [weak self] _ in self?.navigationController?.pushViewController(BackGround(), animated: true)}), for: .touchUpInside)

       
    }
    
    

    
//    @objc func buttonPressed () {
//
//    }
}

extension UIViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
