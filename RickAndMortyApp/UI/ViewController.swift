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
    private let charachterListViewModel = CharactersListViewModel()
    
    private let backgroundBlurEffect : UIVisualEffectView =
    {
        let effect = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        effect.isHidden = true
        effect.translatesAutoresizingMaskIntoConstraints = false
        return effect
    }()
    
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
        if let image = UIImage(named: "filterAsset") {navBarButton.setImage(image, for: .normal)}
        return navBarButton
    }()
    
    private let tableView : UITableView =
    {
        let tableView = UITableView()
        return tableView
    }()
    
   
    
    lazy var mortyButton : ButtonRightImageLeftTitle = {
       var button = ButtonRightImageLeftTitle()
       button.setTitle("Morty", for: UIControl.State.normal)
       button.setImage(UIImage(named: "empySelection"), for: UIControl.State.normal)
       button.setTitleColor(UIColor.black, for: .normal)
       button.contentHorizontalAlignment = .left
       button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
       button.tag = 0
       button.addTarget(self, action: #selector(filterPressed(_:)), for: .touchUpInside)
       return button
   }()
    
    lazy var rickButton : ButtonRightImageLeftTitle = {
       var button = ButtonRightImageLeftTitle()
       button.setTitle("Rick", for: UIControl.State.normal)
       button.setTitleColor(UIColor.black, for: .normal)
       button.setImage(UIImage(named: "empySelection"), for: UIControl.State.normal)
       button.contentHorizontalAlignment = .left
       button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
       button.tag = 1
       button.addTarget(self, action: #selector(filterPressed(_:)), for: .touchUpInside)
       return button
   }()
    
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        uiSetup()
        tableViewSetup()
        backgroundBlurEffectSetup()
        filterViewSetup()
        charachterListViewModel.getInitialCharacters() {self.tableView.reloadData()}
    }
    
    @objc func buttonAction(sender: UIButton!)
    {
        self.filterView.isHidden.toggle()
        self.backgroundBlurEffect.isHidden.toggle()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        if self.backgroundBlurEffect.isHidden == false
        {
            self.backgroundBlurEffect.isHidden.toggle()
            self.filterView.isHidden.toggle()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = TableViewCell()
        cell.configure(charachterListViewModel.modelAt(indexPath.row, tableView: tableView))
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
         
        filterView.backgroundColor = UIColor.init().UIColorFromHex(rgbValue: 0xFFFFFF, alpha: 1)
        filterView.addSubview(filterLabel)
        filterView.addSubview(rickButton)
        filterView.addSubview(mortyButton)
        
        let lineView = UIView(frame: CGRect(x: 0, y: filterLabel.bounds.minY + 50, width: 5555, height: 0.7))
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor.black.cgColor
        filterView.addSubview(lineView)
        
        filterLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(10)
        }
    
        rickButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().offset(-65)
        }
        
        mortyButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(30)
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
    
    func backgroundBlurEffectSetup()
    {
        view.addSubview(backgroundBlurEffect)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        backgroundBlurEffect.addGestureRecognizer(tap)
        
        NSLayoutConstraint.activate([
          backgroundBlurEffect.topAnchor.constraint(equalTo: view.topAnchor),
          backgroundBlurEffect.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          backgroundBlurEffect.heightAnchor.constraint(equalTo: view.heightAnchor),
          backgroundBlurEffect.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    func updateButtonImage( )
    {
        if charachterListViewModel.characterFilterType == .none
        {
            rickButton.setImage(UIImage(named: "empySelection"),for: .normal)
            mortyButton.setImage(UIImage(named: "empySelection"), for: .normal)
        }
        else if charachterListViewModel.characterFilterType == .morty
        {
            rickButton.setImage(UIImage(named: "empySelection"),for: .normal)
            mortyButton.setImage(UIImage(named: "filledAsset"), for: .normal)
        }
        else
        {
            rickButton.setImage(UIImage(named: "filledAsset"), for: .normal)
            mortyButton.setImage(UIImage(named: "empySelection"), for: .normal)
        }
    }
    
    @objc func filterPressed(_ sender: UIButton?)
    {
        if sender!.tag == 0 //morty
        {
            if charachterListViewModel.characterFilterType == .morty {changeCharacterFilterType(changeTo: .none)}
            else {changeCharacterFilterType(changeTo: .morty)}
            updateButtonImage()
        }
        else
        {
            if charachterListViewModel.characterFilterType == .rick {changeCharacterFilterType(changeTo: .none)}
            else {changeCharacterFilterType(changeTo: .rick)}
            updateButtonImage()
        }
    }
    
    func changeCharacterFilterType(changeTo: CharacterFilterType) {charachterListViewModel.characterFilterType = changeTo}
}





public enum CharacterFilterType
{
    case none
    case rick
    case morty
}
