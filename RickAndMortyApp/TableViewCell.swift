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
       photoView.layer.cornerRadius = 10
       photoView.backgroundColor = UIColor.blue
       return photoView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

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
            make.top.equalToSuperview().inset(0)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
