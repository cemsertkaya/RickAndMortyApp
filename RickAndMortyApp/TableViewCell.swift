//
//  TableViewCell.swift
//  RickAndMortyApp
//
//  Created by Cem Sertkaya on 23.06.2022.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell
{
    
    var label1 = UILabel()
    var label2 = UILabel()
    var id = UILabel()
    private let parentView : UIView =
    {
        let parentView = UIView()
        parentView.backgroundColor = UIColor.init().UIColorFromHex(rgbValue: 0xFFFFFF, alpha: 1)
        parentView.layer.cornerRadius = 10
        return parentView
    }()
    
    private let photoView : UIImageView =
    {
       let photoView = UIImageView()
       photoView.roundCorners([.topLeft, .topRight], radius: 10)
       photoView.backgroundColor = UIColor.init().UIColorFromHex(rgbValue: 0xE5E5E5, alpha: 1)
       return photoView
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
        
        createUILabel(label: UILabel(), parentView: parentView, labelText: "Location:", textColor:  UIColor.black, offset: -15, inset: 10, bottomLeading: true)
        createUILabel(label: label1,parentView: parentView, labelText: "Input", textColor:  UIColor.gray, offset: -15, inset: 85, bottomLeading: true)
        createUILabel(label: UILabel(),parentView: parentView, labelText: "Name:", textColor:  UIColor.black, offset: -45, inset: 10, bottomLeading: true)
        createUILabel(label: label2,parentView: parentView, labelText: "Input", textColor:  UIColor.gray, offset: -45, inset: 65, bottomLeading: true)
        createUILabel(label: UILabel(),parentView: parentView, labelText: "#id:", textColor:  UIColor.black, offset: 168, inset: 25, bottomLeading: false)
        createUILabel(label: id,parentView: parentView, labelText: "1", textColor:  UIColor.gray, offset: 168, inset: 10, bottomLeading: false)
        
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    
    func configure(_ vm: CharacterViewModel) {
        label1.text = vm.location
        label2.text = vm.name
        id.text = vm.id
        self.photoView.downloadImage(from: URL(string: vm.imageLink)!)
    }
    
    
    
    ///A method to create UI Labels, bottomLeading boolean determines whether func act for bottom and leading or top and trailing
    func createUILabel(label : UILabel,parentView: UIView, labelText: String,textColor: UIColor, offset: Int, inset: Int, bottomLeading : Bool)
    {
        label.textColor = textColor
        label.text = labelText
        parentView.addSubview(label)
        label.snp.makeConstraints { (make) -> Void in
            if bottomLeading
            {
                make.bottom.equalToSuperview().offset(offset)
                make.leading.equalToSuperview().inset(inset)
            }
            else
            {
                make.top.equalToSuperview().offset(offset)
                make.trailing.equalToSuperview().inset(inset)
            }
            
        }
    }
}


