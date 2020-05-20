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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let config = JWConfig(contentURL: "https://cdn.jwplayer.com/manifests/F8gmWibY.m3u8")
        player = JWPlayerController(config: config)
    }


}

