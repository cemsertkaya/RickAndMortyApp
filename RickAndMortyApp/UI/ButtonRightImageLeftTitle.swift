//
//  File.swift
//  RickAndMortyApp
//
//  Created by Cem Sertkaya on 26.06.2022.
//

import Foundation
import UIKit
class ButtonRightImageLeftTitle: UIButton {
    

    override func layoutSubviews() {
        super.layoutSubviews()

        guard imageView != nil else { return }

        imageEdgeInsets = UIEdgeInsets(top: 0, left: (bounds.width - 35), bottom: 0, right: 5)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -((imageView?.bounds.width)! + 10), bottom: 0, right: 0 )

    }
}
