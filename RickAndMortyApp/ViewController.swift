//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Cem Sertkaya on 23.06.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let navigationTitle : UILabel =
    {
        let titleLabel = UILabel()
        titleLabel.text = "Rick and Morty"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = UIColor.black
        titleLabel.sizeToFit()
        return titleLabel
    }()
    
    private let navigationButton : UIButton =
    {
        let navBarButton = UIButton(type: .custom)
        if let image = UIImage(named: "filterAsset"){navBarButton.setImage(image, for: .normal)}
        return navBarButton
    }()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init().UIColorFromHex(rgbValue: 0xE5E5E5, alpha: 1)
        
        self.view.addSubview(navigationTitle)
        navigationTitle.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(120)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(navigationButton)
        navigationButton.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(115)
            make.right.equalToSuperview().offset(-20)
        }
        
    }

    
   

}


