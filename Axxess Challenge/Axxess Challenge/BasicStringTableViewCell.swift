//
//  BasicStringTableViewCell.swift
//  Axxess Challenge
//
//  Created by Bryan Ortiz on 4/6/17.
//  Copyright © 2017 Ortiz. All rights reserved.
//

import UIKit
import SnapKit

class BasicStringTableViewCell: UITableViewCell {

    // MARK: Properties
    
    fileprivate let idTitleLabel = UILabel()
    let idDetailLabel = UILabel()
    fileprivate let typeTitleLabel = UILabel()
    let typeDetailLabel = UILabel()
    fileprivate let dateTitleLabel = UILabel()
    let dateDetailLabel = UILabel()
    fileprivate let dataTitleLabel = UILabel()
    let dataDetailLabel = UILabel()
    
    // MARK: Initializers
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViewHierarchy()
        setTitleLabelDefaults()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        createViewHierarchy()
        setTitleLabelDefaults()
    }

    // MARK: Class Methods
    
    func setTitleLabelDefaults() -> Void {
        idTitleLabel.text = "Id Title"
        typeTitleLabel.text = "Type Title"
        dateTitleLabel.text = "Date Title"
        dataTitleLabel.text = "Data Title"
    }
    
    func createViewHierarchy() -> Void {
        
        self.contentView.addSubview(idTitleLabel)
        idTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.contentView).offset(16.0)
            make.top.equalTo(self.contentView).offset(8.0)
        }
        
        self.contentView.addSubview(idDetailLabel)
        idDetailLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(idTitleLabel)
            make.top.equalTo(idTitleLabel.snp.bottom).offset(8.0)
        }
        
        self.contentView.addSubview(typeTitleLabel)
        typeTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(idDetailLabel)
            make.top.equalTo(idDetailLabel.snp.bottom).offset(8.0)
        }
        
        self.contentView.addSubview(typeDetailLabel)
        typeDetailLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(typeTitleLabel)
            make.top.equalTo(typeTitleLabel.snp.bottom).offset(8.0)
        }
        
        self.contentView.addSubview(dateTitleLabel)
        dateTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(typeDetailLabel)
            make.top.equalTo(typeDetailLabel.snp.bottom).offset(8.0)
        }
        
        self.contentView.addSubview(dateDetailLabel)
        dateDetailLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(dateTitleLabel)
            make.top.equalTo(dateTitleLabel.snp.bottom).offset(8.0)
        }
        
        self.contentView.addSubview(dataTitleLabel)
        dataTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(dateDetailLabel)
            make.top.equalTo(dateDetailLabel.snp.bottom).offset(8.0)
        }
        
        self.contentView.addSubview(dataDetailLabel)
        dataDetailLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(dataTitleLabel)
            make.top.equalTo(dataTitleLabel.snp.bottom).offset(8.0)
            make.bottom.equalToSuperview().offset(-8.0)
        }
    }

}
