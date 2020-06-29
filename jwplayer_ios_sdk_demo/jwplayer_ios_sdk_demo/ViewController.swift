//
//  ViewController.swift
//  jwplayer_ios_sdk_demo
//
//  Created by Kurt Bauer on 5/20/20.
//  Copyright © 2020 JWPlayer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var player: JWPlayerController?

    @IBOutlet weak var playerContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let config = JWConfig(contentURL: "https://content.jwplatform.com/videos/QmWTIFT5-tfQxWyVS.mp4")
        player = JWPlayerController(config: config)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let playerView = player?.view{
            playerContainerView.addSubview(playerView)
            // playerView.frame = playerContainerView.bounds
            
            playerView.constrainToSuperview()
        }
        
        title = "JWP SDK ver: \(JWPlayerController.sdkVersionToMinor())"
    }
}

extension ViewController: JWPlayerDelegate {
    func onError(_ event: JWEvent & JWErrorEvent) {
        print(#function, event.error.debugDescription)
    }
        
    func onSetupError(_ event: JWEvent & JWErrorEvent) {
        print(#function, event.error.debugDescription)
    }
}

enum MyEnum<T: Any> {
    case none
    case some(T)
}

extension UIView {
    /// Constrains the view to its superview, if it exists, using Autolayout.
    /// - precondition: For player instances, JWP SDK 3.3.0 or higher.
    @objc func constrainToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[thisView]|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: ["thisView": self])
        
        let verticalConstraints   = NSLayoutConstraint.constraints(withVisualFormat: "V:|[thisView]|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: ["thisView": self])
        
        NSLayoutConstraint.activate(horizontalConstraints + verticalConstraints)
    }

}
