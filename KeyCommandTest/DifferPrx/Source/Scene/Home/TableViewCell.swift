//
//  TableViewCell.swift
//  KeyCommandTest
//
//  Created by 이숭인 on 2022/01/21.
//

import UIKit
import Then
import SnapKit

class TableViewCell: UITableViewCell {
    //MARK: - Properties
    static let identifier: String = "tableViewCell"
    
    //MARK: - UI Components
    let testLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    
    //MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        print("called table view cell init method")
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    func configure(title: String){
        self.testLabel.text = title
    }
    
    func setUI(){
        self.contentView.addSubview(testLabel)
        
        testLabel.snp.makeConstraints{
            $0.center.equalTo(self.contentView.safeAreaLayoutGuide)
        }
    }
 
}
