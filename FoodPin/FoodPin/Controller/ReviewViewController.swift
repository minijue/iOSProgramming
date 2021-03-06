//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by 王珏 on 2020/6/13.
//  Copyright © 2020 王珏. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]!
    
    @IBOutlet var closeButton: UIButton!
    
    
//    var restaurant = Restaurant()
    var restaurant: RestaurantMO!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let restaurantImage = restaurant.image {
            backgroundImageView.image = UIImage(data: restaurantImage as Data)
        }
        
        // 毛玻璃特效
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        
        for rateButton in rateButtons {
            rateButton.transform = moveScaleTransform
            rateButton.alpha = 0
        }
        
        let moveTopTransform = CGAffineTransform(translationX: 0, y: -600)
        closeButton.transform = moveTopTransform
        closeButton.alpha = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        var delay = 0.1
        for rateButton in self.rateButtons {
            UIView.animate(withDuration: 0.8, delay: delay, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
                rateButton.alpha = 1.0
                rateButton.transform = .identity
            }, completion: nil)
            delay += 0.05
        }
        
        UIView.animate(withDuration: 0.8, delay: 0.5, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2, options: [], animations: {
            self.closeButton.alpha = 1.0
            self.closeButton.transform = .identity
        }, completion: nil)
    }

}
