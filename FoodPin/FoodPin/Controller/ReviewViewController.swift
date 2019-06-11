//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by 王珏 on 2019/6/11.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBAction func close(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backgroundImageView.image = UIImage(named: restaurant.image)
        
        // 模糊效果
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let moverRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        let scaleUpTransform = CGAffineTransform(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moverRightTransform)
        
        for rateButton in rateButtons {
            rateButton.transform = moveScaleTransform
            rateButton.alpha = 0
        }
        
        let moveTopTransform = CGAffineTransform(translationX: 0, y: -600)
        self.closeButton.transform = moveTopTransform
        self.closeButton.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 渐变动画
        for i in 0...4 {
            UIView.animate(withDuration: 0.4, delay: 0.05 * Double((i+2)), usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
                self.rateButtons[i].alpha = 1.0
                self.rateButtons[i].transform = .identity
            }, completion: nil)
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.25, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.closeButton.transform = .identity
            self.closeButton.alpha = 1.0
        }, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
