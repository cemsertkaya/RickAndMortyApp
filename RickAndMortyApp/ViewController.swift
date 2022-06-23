//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Cem Sertkaya on 23.06.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
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
    
    private let tableView : UITableView =
    {
        return UITableView()
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        uiSetup()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "cem"
        cell.contentView.backgroundColor = UIColor.init().UIColorFromHex(rgbValue: 0xE5E5E5, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return 5}
    
    func uiSetup()
    {
        self.view.backgroundColor = UIColor.init().UIColorFromHex(rgbValue: 0xE5E5E5, alpha: 1)
        self.tableView.backgroundColor = UIColor.init().UIColorFromHex(rgbValue: 0xE5E5E5, alpha: 1)
        
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
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(120)
            make.bottom.equalToSuperview().offset(0)
        }
    }
   

}


