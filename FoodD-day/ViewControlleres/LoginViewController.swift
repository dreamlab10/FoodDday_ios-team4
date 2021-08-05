//
//  LoginViewController.swift
//  FoodD-day
//
//  Created by Apple on 2021/08/02.
//

import UIKit
import FirebaseUI


class LoginViewController: UIViewController, FUIAuthDelegate {
    
    var handle:AuthStateDidChangeListenerHandle!
    let authUI = FUIAuth.defaultAuthUI()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        authUI!.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let currentUser = auth.currentUser {
                // 로그인 된 상태
                NSLog("loged in")
                if let displayName = currentUser.displayName {
                    let alertController = UIAlertController(title: "welcome", message: "\(displayName)! welcome!", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alertController, animated: false, completion: nil)
                }
                
            } else {
                // 로그아웃 된 상태
                NSLog("loged out")
                let providers: [FUIAuthProvider] = [
                  FUIEmailAuth(),
                    FUIGoogleAuth(),
                    FUIFacebookAuth()
                ]
                self.authUI!.providers = providers
                let authVC = self.authUI!.authViewController()
                authVC.modalPresentationStyle = .fullScreen
                //authVC.setNavigationBarHidden(true, animated: false)
                //authVC.setToolbarHidden(true, animated: false)
                self.present(authVC, animated: false, completion: nil)
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        print("sign in")
        print(authDataResult)
    }
    
    @IBAction func doSignOut(_ sender: Any) {
        try? authUI?.signOut()
    }
}

extension FUIAuthBaseViewController {
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = nil
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
