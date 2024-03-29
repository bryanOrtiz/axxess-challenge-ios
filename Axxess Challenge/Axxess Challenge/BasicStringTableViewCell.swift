//
//  BasicStringTableViewCell.swift
//  Axxess Challenge
//
//  Created by Bryan Ortiz on 4/6/17.
//  Copyright © 2017 Ortiz. All rights reserved.
//

import UIKit
import SnapKit

/// This class should display every field from the parsed JSON object in String format
class BasicStringTableViewCell: UITableViewCell {

    // MARK: Properties
    
    fileprivate let idTitleLabel = UILabel() // some properties are fileprivate because they need to be access only by this class
    let idDetailLabel = UILabel()
    fileprivate let typeTitleLabel = UILabel()
    let typeDetailLabel = UILabel()
    fileprivate let dateTitleLabel = UILabel()
    let dateDetailLabel = UILabel()
    fileprivate let dataTitleLabel = UILabel()
    let dataDetailLabel = UILabel()
    
    // MARK: Initializers
    
    /// We overrided initWithStyle:resuseIdentifier so that we can programmatically set the UI
    ///
    /// - Parameters:
    ///   - style: see superclass
    ///   - reuseIdentifier: see superclass
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViewHierarchy()
        setTitleLabelDefaults()
        setDetailLabelDefaults()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// We overrided awakeFromNib so that we can programmatically set the UI
    override func awakeFromNib() {
        super.awakeFromNib()
        
        createViewHierarchy()
        setTitleLabelDefaults()
        setDetailLabelDefaults()
    }

    // MARK: Class Methods
    
    func setTitleLabelDefaults() -> Void {
        idTitleLabel.text = "Id"
        idTitleLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
        typeTitleLabel.text = "Type"
        typeTitleLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
        dateTitleLabel.text = "Date"
        dateTitleLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
        dataTitleLabel.text = "Data"
        dataTitleLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
    }
    
    func setDetailLabelDefaults() -> Void {
        idDetailLabel.font = UIFont.systemFont(ofSize: 17.0)
        typeDetailLabel.font = UIFont.systemFont(ofSize: 17.0)
        dateDetailLabel.font = UIFont.systemFont(ofSize: 17.0)
        dataDetailLabel.font = UIFont.systemFont(ofSize: 17.0)
        
        idDetailLabel.numberOfLines = 1
        idDetailLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        typeDetailLabel.numberOfLines = 1
        typeDetailLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        dateDetailLabel.numberOfLines = 1
        dateDetailLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        dataDetailLabel.numberOfLines = 1
        dataDetailLabel.lineBreakMode = .byTruncatingTail
    }
    
    /// Create Snapkit constraints
    func createViewHierarchy() -> Void {
        
        self.contentView.addSubview(idTitleLabel)
        idTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16.0)
            make.trailing.equalTo(self.contentView).offset(-16.0)
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
