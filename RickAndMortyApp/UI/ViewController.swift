//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Cem Sertkaya on 23.06.2022.
//

import UIKit
import SnapKit
import Apollo

class ViewController: UIViewController
{
    private var charachterListViewModel = CharactersListViewModel()
    private let navigationTitle : UILabel =
    {
        let titleLabel = UILabel()
        titleLabel.text = "Rick and Morty"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = UIColor.black
        titleLabel.sizeToFit()
        return titleLabel
    }()
    
    private let filterView : UIView =
    {
        let filterView = UIView()
        filterView.isHidden = true
        return filterView
    }()
    
    private let navigationButton : UIButton =
    {
        let navBarButton = UIButton(type: .custom)
        navBarButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
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
        filterViewSetup()
        charachterListViewModel.getAllCharacters {self.tableView.reloadData()}
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        self.filterView.isHidden = false
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = TableViewCell()
        cell.configure(charachterListViewModel.modelAt(indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return charachterListViewModel.numberOfRows(section)}
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
    
    func filterViewSetup()
    {
        filterView.roundCorners([.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 10)
        let filterLabel = UILabel(); filterLabel.text = "Filter"; filterLabel.textColor = UIColor.black; filterLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        let rickLabel = UILabel(); rickLabel.text = "Rick"; rickLabel.textColor = UIColor.black ; rickLabel.font = UIFont.systemFont(ofSize: 24)
        rickLabel.addTrailing(image: UIImage(named: "empySelection")!, text: "Rick")
        
        let mortyLabel = UILabel(); mortyLabel.text = "Morty"; mortyLabel.textColor = UIColor.black ; mortyLabel.font = UIFont.systemFont(ofSize: 24)
        mortyLabel.addTrailing(image: UIImage(named: "empySelection")!, text: "Morty")
        
        filterView.backgroundColor = UIColor.init().UIColorFromHex(rgbValue: 0xFFFFFF, alpha: 1)
        filterView.addSubview(filterLabel)
        filterView.addSubview(rickLabel)
        filterView.addSubview(mortyLabel)
        
        let lineView = UIView(frame: CGRect(x: 0, y: filterLabel.bounds.minY + 50, width: 5555, height: 0.7))
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor.black.cgColor
        filterView.addSubview(lineView)
        
        filterLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(10)
        }
    
        rickLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().offset(-65)
        }
        
        mortyLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().offset(-25)
        }
        
        view.addSubview(filterView)
        filterView.snp.makeConstraints { (make) -> Void in
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(164)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
