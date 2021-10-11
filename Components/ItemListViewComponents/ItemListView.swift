//
//  ItemListView.swift
//  UIComponents
//
//  Created by Bengi on 6.10.2021.
//

import UIKit

class ItemListView: BaseView {
    
    deinit {
        print("DEINIT: ItemListView")
    }
    
    // To manage ItemListView with delegation
    weak var delegate: ItemListProtocol?
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.estimatedRowHeight = UITableView.automaticDimension
        view.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.identifier )
        return view
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addTableView()
    }
    
    func addTableView() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            print("ReloadData is done.")
        }
    }
}

extension ItemListView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return delegate?.getNumberOfSection() ?? 0
        // ?? 0 means, there is no delegation and no data, so if its not exist, return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.getNumberOfItem(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = delegate?.getData(at: indexPath.row) else { fatalError("Please provide data.") }
        
        // We check for data is exist
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        
        cell.setData(by: data)
        return cell
    }
}
