//
//  ItemTableViewCell.swift
//  UIComponents
//
//  Created by Bengi on 6.10.2021.
//

import UIKit

// custom cell
class ItemTableViewCell: BaseTableViewCell {
    
    private var containerView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageViewComponent, cellInfoComponent])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var imageViewComponent: CustomImageViewComponentContainer = {
        
        let view = CustomImageViewComponentContainer()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.widthAnchor.constraint(equalToConstant: 50).isActive = true
        view.layer.cornerRadius = 4
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.6
        return view
    }()
    
    private lazy var cellInfoComponent: LabelPackComponent = {
        
        let label = LabelPackComponent()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addUserComponents()
    }
    
    private func addUserComponents(){

        contentView.addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        ])
    }
    
    // To set data to cell
    func setData(by value: GenericDataProtocol) {
        // Type Casting
        // If data is an ItemTableViewCellData type, we print it; if not, its not our task
        guard let data = value as? ItemTableViewCellData else { return }
        imageViewComponent.setData(by: data.imageData)
        cellInfoComponent.setData(by: data.cellInfo)
    }
    
    
}
