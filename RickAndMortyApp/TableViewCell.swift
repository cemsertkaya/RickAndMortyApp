//
//  TableViewCell.swift
//  RickAndMortyApp
//
//  Created by Cem Sertkaya on 23.06.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    let textField = UITextField()
    
    private let parentView : UIView =
    {
        let parentView = UIView()
        parentView.backgroundColor = UIColor.init().UIColorFromHex(rgbValue: 0xFFFFFF, alpha: 1)
        parentView.layer.cornerRadius = 10
        return parentView
    }()
    
    private let photoView : UIView =
    {
       let photoView = UIView()
       photoView.roundCorners([.topLeft, .topRight], radius: 10)
       photoView.backgroundColor = UIColor.blue
       return photoView
    }()
    
    
    private let labelView1: UIView =
    {
       let labelView1 = UIView()
       labelView1.backgroundColor = UIColor.init().UIColorFromHex(rgbValue: 0xFFFFFF, alpha: 1)
       return labelView1
    }()
    
    private let labelView2: UIView =
    {
       let labelView2 = UIView()
       labelView2.backgroundColor = UIColor.init().UIColorFromHex(rgbValue: 0xFFFFFF, alpha: 1)
       return labelView2
    }()
    
    override func awakeFromNib() {super.awakeFromNib()}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = UIColor.init().UIColorFromHex(rgbValue: 0xE5E5E5, alpha: 1)
        
        contentView.addSubview(parentView)
        parentView.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(265)
            make.edges.equalToSuperview().inset(25)
            make.top.equalToSuperview().inset(0)
        }
        
        parentView.addSubview(photoView)
        photoView.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(168)
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        
        
        
        parentView.addSubview(labelView2)
        let locationLabel = UILabel()
        locationLabel.textColor = UIColor.black
        locationLabel.text = "Location:"
        labelView2.addSubview(locationLabel)
        
        let locationField = UILabel()
        locationField.textColor = UIColor.gray
        locationField.text = "Input"
        labelView2.addSubview(locationField)
        
        labelView2.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(25)
            make.bottom.equalToSuperview().inset(15)
            make.left.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)
        }
        
        locationLabel.snp.makeConstraints { (make) -> Void in make.leading.equalToSuperview().inset(10)}
        locationField.snp.makeConstraints { (make) -> Void in make.leading.equalToSuperview().offset(10 + locationLabel.intrinsicContentSize.width + 5)}
        
        parentView.addSubview(labelView1)
        let nameLabel = UILabel()
        nameLabel.textColor = UIColor.black
        nameLabel.text = "Name:"
        labelView1.addSubview(nameLabel)
        
        let nameField = UILabel()
        nameField.textColor = UIColor.gray
        nameField.text = "Input"
        labelView1.addSubview(nameField)
        
        
        labelView1.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(25)
            make.bottom.equalToSuperview().inset(45)
            make.left.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)

        }
        nameLabel.snp.makeConstraints { (make) -> Void in make.leading.equalToSuperview().inset(10)}
        nameField.snp.makeConstraints { (make) -> Void in make.leading.equalToSuperview().offset(10 + nameLabel.intrinsicContentSize.width + 5)}
        
        let numberIDLabel = UILabel()
        numberIDLabel.textColor = UIColor.black
        numberIDLabel.text = "#id:"
        parentView.addSubview(numberIDLabel)
        numberIDLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(168)
            make.trailing.equalToSuperview().inset(25)
            
        }
        
        let numberIDField = UILabel()
        numberIDField.textColor = UIColor.gray
        numberIDField.text = "1"
        parentView.addSubview(numberIDField)
        numberIDField.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(168)
            make.trailing.equalToSuperview().inset(10)
        }
        
        
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
