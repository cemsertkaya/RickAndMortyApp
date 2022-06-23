//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Cem Sertkaya on 23.06.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController
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
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        uiSetup()
        tableViewSetup()
    }
    

    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = TableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return 5}
}

extension ViewController
{
    func uiSetup()
    {
        view.backgroundColor = UIColor.init().UIColorFromHex(rgbValue: 0xE5E5E5, alpha: 1)
        
        view.addSubview(navigationTitle)
        navigationTitle.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(120)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(navigationButton)
        navigationButton.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(115)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    func tableViewSetup()
    {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = UIColor.init().UIColorFromHex(rgbValue: 0xE5E5E5, alpha: 1)
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(120)
            make.bottom.equalToSuperview().offset(0)
        }
        
        tableView.estimatedRowHeight = 265
    }
}
