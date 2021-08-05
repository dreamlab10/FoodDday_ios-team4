//
//  introViewController.swift
//  FoodD-day
//
//  Created by jiwon on 2021/07/31.
//

import UIKit
import SwiftyGif

class introViewController:UIViewController {
    
    @IBOutlet weak var intro_image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let gif = try UIImage(gifName: "splash.gif")
            self.intro_image.setGifImage(gif, loopCount: 1)
            self.intro_image.delegate = self
        } catch {
            NSLog("재생불가")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
            self.goOnboardingView()
        }
    }
}

extension introViewController:SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        print("gifDidStop")
    }
    
    func goOnboardingView() {
        
//        guard let dvc = UIStoryboard(name: "onboarding", bundle:  nil).instantiateViewController(identifier: "NaviController") as? NaviController else {
//            return
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "onboarding") {
                    vc.modalPresentationStyle = .fullScreen
                    vc.modalTransitionStyle = .crossDissolve
                    self.present(vc, animated: true, completion: nil)
        }

    }
}
