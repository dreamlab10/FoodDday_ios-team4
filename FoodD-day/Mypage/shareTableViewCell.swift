//
//  shareTableViewCell.swift
//  FoodD-day
//
//  Created by jiwon on 2021/07/30.
//

import UIKit

class shareTableViewCell: UITableViewCell {

    @IBOutlet weak var pImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUI() {
        pImage.image = UIImage(named: "")
        nameLabel.text = "이름"
        subLabel.text = "관계"
    }
    
    func initCell(image: String, name: String, relaiton: String) {
        pImage.image = UIImage(named: image)
        nameLabel.text = name
        subLabel.text = relaiton
    }
}
