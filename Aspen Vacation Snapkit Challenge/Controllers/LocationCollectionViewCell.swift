//
//  LocationCollectionViewCell.swift
//  Aspen Vacation Snapkit Challenge
//
//  Created by Almat Alibekov on 01.11.2023.
//

import UIKit

class LocationCollectionViewCell: UICollectionViewCell {
    
    var backImage = UIImageView()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Montserrat", size: 12)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .center
        
        return label
    }()
    
    var ratingLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Montserrat", size: 12)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .center
        
        return label
    }()
    
    
    
    var labelView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.3, green: 0.34, blue: 0.32, alpha: 1)
        view.layer.cornerRadius = 12
    
        return view
    }()
    
    var ratingView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.3, green: 0.34, blue: 0.32, alpha: 1)
        view.layer.cornerRadius = 12
    
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(location: Location) {
        backImage.image = UIImage(named: "\(location.image)")
        nameLabel.text = location.name
        ratingLabel.text = String(location.rating)
    }
    
    func setupViews() {
        backImage.clipsToBounds = true
        labelView.addSubview(nameLabel)
        ratingView.addSubview(ratingLabel)
        contentView.addSubview(backImage)
        contentView.addSubview(labelView)
        contentView.addSubview(ratingView)
        
    }
    
    func setupConstraints() {
        backImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        labelView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(175)
            make.height.equalTo(23)
        }
        
        ratingView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.top.equalTo(labelView.snp.bottom).offset(6)
            make.height.equalTo(23)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(12)
            make.trailing.equalTo(-12)
            make.centerY.equalToSuperview()
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.leading.equalTo(12)
            make.trailing.equalTo(-12)
            make.centerY.equalToSuperview()
        }
    }
}
