//
//  BallDownNatureViewController.swift
//  Day08_HomeWork
//
//  Created by Vu Nam Ha on 18/06/2022.
//

import UIKit

class BallDownNatureViewController: UIViewController {
    
    var ballView: UIView = {        // thêm UIView ballView
        let view = UIView()
        print()
        print()
        return view
        
    }()
    
    var v: CGFloat = 0
    var g: CGFloat = 9.8
    var t: CGFloat = 0.01
    var checkDown: Bool = true
    var height: CGFloat = 0
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        creatBallView()         // gọi trong viewDidAppear thì tọa độ chuẩn hơn
        
        // cho ball rơi tự do
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(t), target: self, selector: #selector(BallDown), userInfo: nil, repeats: true)
        // tạo gesture để di chuyển ball
        let panGestureBallView = UIPanGestureRecognizer(target: self, action: #selector(panBallView(gesture:)))
        ballView.addGestureRecognizer(panGestureBallView)
        // tạo tap gesture đổi màu ball
        let tapGestureBallView = UITapGestureRecognizer(target: self, action: #selector(tapBallView))
        ballView.addGestureRecognizer(tapGestureBallView)
        // tạo pichGesture
        let pinchGestureBallView = UIPinchGestureRecognizer(target: self, action: #selector(pinchBallView(gesture:)))
        ballView.addGestureRecognizer(pinchGestureBallView)
        // khi ball đang rơi thì ko nhận gesture
        ballView.isUserInteractionEnabled = false
    }
    
    func creatBallView() {
        ballView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        ballView.backgroundColor = .brown
        ballView.clipsToBounds = true
        ballView.layer.cornerRadius = 50
        ballView.center.x = view.center.x
        view.addSubview(ballView)
    }
    
    @objc func BallDown() {
        if checkDown == true {
            v += g*t
            self.ballView.frame.origin.y += v*t*400
            if self.ballView.frame.maxY >= self.view.frame.maxY {
                checkDown = !checkDown
            }
            if height >= self.view.frame.maxY {
                timer.invalidate()
                ballView.isUserInteractionEnabled = true
            }
        } else {
            v -= g*t*1.5
            self.ballView.frame.origin.y -= v*t*400
            if v<=0 {
                checkDown = !checkDown
                height = self.ballView.frame.maxY
            }
        }
    }
    
    @objc func panBallView(gesture: UIPanGestureRecognizer) {
        
        let point = gesture.location(in: view)
        ballView.center = point
        
        if (gesture.state == .ended) {
            ballView.isUserInteractionEnabled = false
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(t), target: self, selector: #selector(BallDown), userInfo: nil, repeats: true)
        }
    }
    func getRandomColor() -> UIColor {
         //Generate between 0 to 1
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())

         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    @objc func tapBallView() {
        self.ballView.backgroundColor = getRandomColor()
    }
    
    @objc func pinchBallView(gesture: UIPinchGestureRecognizer) {
        ballView.transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
    }
}
