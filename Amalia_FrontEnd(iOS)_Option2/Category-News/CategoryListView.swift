//
//  CategoryListView.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 28/08/23.
//

import UIKit

class CategoryListView: UITableViewController {
    var presenter: CategoryPresenterProtocol?
    var category: [CategoryItem] = [] {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        globalSearchSource = ""
        globalSearchArticles = ""
        title = "NEWS CATEGORY"
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }
    
    
    private func setupView() {
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let category = category[indexPath.row]
        cell.textLabel?.text = category.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = category[indexPath.row]
        presenter?.showSourceList(category)
    }
    
}


extension CategoryListView: CategoryViewProtocol {
    func showCategory(_ category: [CategoryItem]) {
        self.category = category
    }
    
}
