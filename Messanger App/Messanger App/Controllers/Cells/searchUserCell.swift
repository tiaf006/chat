//
//  searchUserCell.swift
//  Messanger App
//
//  Created by TAIF Al-zahrani on 08/06/1444 AH.
//

import UIKit

class searchUserCell: UITableViewCell {
    let nameLbl: UILabel = {
        let lable = UILabel(frame: .zero)
        return lable
    }()
    
    let emailLbl: UILabel = {
        let lable = UILabel(frame: .zero)
        lable.font = lable.font.withSize(14)
        lable.tintColor = .placeholderText
        return lable
    }()
    
    let imageProfile: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 2
        imageView.tintColor = .gray
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.RounedSmall()
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.isUserInteractionEnabled = false
        SetContentViewConstrants()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func SetContentViewConstrants(){
        self.contentView.addSubview(nameLbl)
        self.contentView.addSubview(emailLbl)
        self.contentView.addSubview(imageProfile)
        
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        nameLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
        nameLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -26).isActive = true
        nameLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        //nameLbl.backgroundColor = .green
        
        emailLbl.translatesAutoresizingMaskIntoConstraints = false
        emailLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 4).isActive = true
        emailLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 88).isActive = true
        emailLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        emailLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        //emailLbl.backgroundColor = .magenta
        
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        imageProfile.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        imageProfile.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        
    }
}
