//
//  FilterCollectionViewCell.swift
//  Aspen Vacation Snapkit Challenge
//
//  Created by Almat Alibekov on 03.11.2023.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    var locationName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat", size: 12)
        label.textColor = UIColor(red: 0.10, green: 0.43, blue: 0.93, alpha: 1.00)
        label.textAlignment = .center
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.backgroundColor = UIColor(red: 0.95, green: 0.97, blue: 1, alpha: 1)
        contentView.layer.cornerRadius = 16
        contentView.addSubview(locationName)
    }
    
    func setupConstraints() {
        locationName.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.centerY.equalToSuperview()
        }
    }
    
    func setupData(options: String) {
        locationName.text = options
    }
    
}
