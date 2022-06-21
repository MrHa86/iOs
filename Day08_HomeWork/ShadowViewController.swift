//
//  ShadowViewController.swift
//  Day08_HomeWork
//
//  Created by Vu Nam Ha on 17/06/2022.
//

import UIKit

class ShadowViewController: UIViewController {
    
    var i = 100
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 50, y: 130, width: 350, height: 550)
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    } ()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 240, y: 700, width: 80, height: 40)
        return button
    } ()
    
    let prevButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 90, y: 700, width: 80, height: 40)
        return button
    } ()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 50, width: 150, height: 60)
        return label
    } ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(nextButton)
        view.addSubview(prevButton)
        view.addSubview(nameLabel)
        imageView.center.x = view.center.x
        nameLabel.center.x = view.center.x
        
        nameLabel.backgroundColor = .systemPink
        nameLabel.text = "Jisoo"
        nameLabel.textAlignment = .center
        nameLabel.font = .boldSystemFont(ofSize: 30)
        
        nextButton.backgroundColor = .blue
        nextButton.layer.cornerRadius = 5
        nextButton.setTitle("Next", for: .normal)
        
        prevButton.backgroundColor = .brown
        prevButton.layer.cornerRadius = 5
        prevButton.setTitle("Prev", for: .normal)
        prevButton.setTitleColor(.white, for: .normal)

        nextButton.addTarget(self, action: #selector(nextImage), for: .touchUpInside)
        prevButton.addTarget(self, action: #selector(prevImage), for: .touchUpInside)
        
        // shadow
        nameLabel.layer.masksToBounds = false
        nameLabel.layer.cornerRadius = 50
        nameLabel.layer.shadowColor = UIColor.red.cgColor
        nameLabel.layer.shadowOffset = .zero
        nameLabel.layer.shadowOpacity = 0.99
        nameLabel.layer.shadowRadius = 50
        
        let shadowLayer = CAShapeLayer()
        let shadowPath = UIBezierPath(roundedRect: nextButton.bounds, cornerRadius: 16)

        shadowLayer.fillColor = UIColor.green.cgColor
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shadowLayer.shadowRadius = 24
        shadowLayer.shadowColor = UIColor.blue.cgColor
        shadowLayer.shadowOpacity = 0.8
        shadowLayer.shadowPath = shadowPath.cgPath
        nextButton.layer.insertSublayer(shadowLayer, at: 0)

        
        let shadowLayer1 = CAShapeLayer()
        let shadowPath1 = UIBezierPath(ovalIn: CGRect(x: prevButton.bounds.minX, y: prevButton.bounds.maxY+5, width: prevButton.bounds.width, height: 15))
        shadowLayer1.shadowColor = UIColor.brown.cgColor
        shadowLayer1.shadowOpacity = 0.9
        shadowLayer1.shadowPath = shadowPath1.cgPath

        prevButton.layer.insertSublayer(shadowLayer1, at: 0)
        
    }
    
    @objc func nextImage() {
        i += 1
        imageView.image = UIImage(named: "\(i%15)")
    }
    
    @objc func prevImage() {
        i -= 1
        imageView.image = UIImage(named: "\(i%15)")
    }
    

}
