//
//  BallRunViewController.swift
//  Day08_HomeWork
//
//  Created by Vu Nam Ha on 17/06/2022.
//

import UIKit

class BallRunViewController: UIViewController {
    
    var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    var ballView: UIView = {
        let view = UIView()
        return view
    }()
    
    var timer1: Timer!
    var timer2: Timer!
    var timer3: Timer!
    var timer4: Timer!
    var luotDi: Bool = true
    var a: Float = 0.0      // biến tạm để tính quãng đường bóng chạy lên xuống
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(containerView)
        containerView.addSubview(ballView)
        setUpUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        goRight()
        
    }
    
    func setUpUI() {
        view.backgroundColor = .white
        containerView.backgroundColor = .clear
        containerView.frame = CGRect.init(x: 0, y: 0, width: 60, height: 60)
        ballView.backgroundColor = .red
        ballView.frame = containerView.bounds
        ballView.layer.cornerRadius = 30
        ballView.clipsToBounds = true
    }
    
    func goRight() {        // Nếu đang lượt đi thì goRight xong đi xuống
        timer1 = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { _ in
            self.containerView.frame.origin.x += 0.2
            if self.containerView.frame.maxX >= self.view.bounds.maxX {
                self.timer1.invalidate()
                if self.luotDi == true {
                    self.goDown()
                } else {
                    self.goUp()
                }
            }
        })
    }
    
    func goLeft() {             // Nếu đang lượt đi thì goLeft xong đi xuống, nếu chạm góc dưới trái màn hình thì đổi lượt đi = False
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { _ in
            self.containerView.frame.origin.x -= 0.2
            if self.containerView.frame.minX <= self.view.bounds.minX {
                self.timer2.invalidate()
                if self.containerView.frame.minX <= 0 && self.containerView.frame.maxY >= self.view.frame.maxY {
                    self.luotDi = false
                }
                if self.luotDi == true {
                    self.goDown()
                } else {
                    self.goUp()
                }
            }
        })
        
    }
    
    // goDown cho bóng chạy xuống 1/3 màn hình
    func goDown() {
        timer3 = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { _ in
            
            self.containerView.frame.origin.y += 0.2
            self.a += 0.2
            if self.a >= Float(self.view.frame.height/3-10) || self.containerView.frame.maxY >= self.view.frame.maxY {
                self.timer3.invalidate()
                self.a = 0.0
                if Int(self.containerView.frame.origin.x) < 100 {       // nếu bóng đang ở mép trái màn hình
                    self.goRight()
                } else {
                    self.goLeft()
                }
            }
        })
    }
    
    // goUp cho bóng chạy lên 1/3 màn hình
    func goUp() {
        timer4 = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { _ in
            
            self.containerView.frame.origin.y -= 0.2
            self.a += 0.2
            if self.a >= Float(self.view.frame.height/3-10) || self.containerView.frame.minY <= self.view.frame.minY {
                self.timer4.invalidate()
                self.a = 0.0
                if self.containerView.frame.minX <= 0 && self.containerView.frame.minY <= 0 {
                    self.luotDi = true
                }
                if self.containerView.frame.origin.x < 100 {        // nếu bóng đang ở mép trái màn hình
                    self.goRight()
                } else {
                    self.goLeft()
                }
            }
            
        })
    }
}
