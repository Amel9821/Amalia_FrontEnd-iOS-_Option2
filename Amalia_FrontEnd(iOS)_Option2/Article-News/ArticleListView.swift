//
//  ArticleListView.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 25/08/23.
//
import UIKit
import Combine

final class ArticleListView: UIViewController, UISearchBarDelegate {
    
    private typealias DataSource = UITableViewDiffableDataSource<Int, ArticleResultEntity>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Int, ArticleResultEntity>
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = CGRectMake(25, 100, screenWidth - 18, 37)
        searchBar.searchBarStyle = .prominent
        searchBar.barStyle = .black
        searchBar.layer.cornerRadius = searchBar.frame.height / 2
        searchBar.searchTextField.textColor = .gray
        searchBar.searchTextField.leftView?.tintColor = .darkGray
        searchBar.barTintColor = .white
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.layer.cornerRadius = searchBar.frame.height / 2
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.tintColor = .white
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Search...."
        searchBar.layoutIfNeeded()
        return searchBar
    }()
    
    private var buttonSearch: UIButton = {
        let buttonSearch = UIButton()
        buttonSearch.setImage(UIImage(named: "IconSearchGray"), for: .normal)
        buttonSearch.frame = CGRectMake(340, 100, 30, 30)
        return buttonSearch
    }()
    
    private var dataSource: DataSource!
    private var disposables = Set<AnyCancellable>()
    var presenter: ArticleListViewToPresenterProtocol?
    let spinner = UIActivityIndicatorView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support Storyboard initializations")
    }
    
    override func loadView() {
        super.loadView()
        
        tableView.delegate = self
        tableView.register(ArticleListCell.self, forCellReuseIdentifier: ArticleListCell.REUSE_IDENTIFIER)
        view.addSubview(tableView)
        view.addSubview(searchBar)
        view.addSubview(buttonSearch)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(doneAction));
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.setItems([space, cancelButton], animated: false)
        
        searchBar.delegate = self
        searchBar.searchTextField.inputAccessoryView = toolbar
        buttonSearch.isUserInteractionEnabled = true
        buttonSearch.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didSearch)))
        
        spinner.color = .darkGray
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.tableView.bounds.width, height: CGFloat(44))
        tableView.tableFooterView = self.spinner
        
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListCell.REUSE_IDENTIFIER) as! ArticleListCell
            cell.setupContents(item)
            return cell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(globalSource) Articles".uppercased()
        globalPage = 1
        view.backgroundColor = .systemBackground
        spinner.startAnimating()
        presenter?.startFetchArticleList()
    }
    
    private func setupSnapshot(_ list: [ArticleResultEntity]) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(list)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
 
//Search function
    
    @objc func didSearch() {
        globalSearchArticles = searchBar.text ?? ""
        presenter?.startFetchArticleList()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        globalSearchArticles = searchBar.text ?? ""
        globalPage = 1
        presenter?.startFetchArticleList()
    }
    
    @objc func doneAction() {
        searchBar.resignFirstResponder()
    }
    
    
}

extension ArticleListView: ArticleListPresenterToViewProtocol {
    func observeArticleList(subject: CurrentValueSubject<ArticleListEntity?, NSError>) {
        subject.sink(receiveCompletion: { _ in
            print("Error received")
        }, receiveValue: { [weak self] value in
            if let value, let results = value.articles {
                self?.setupSnapshot(results)
            }
        }).store(in: &disposables)
    }
}

extension ArticleListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        globalSearchSource = ""
        globalSearchArticles = ""
        presenter?.showArticleDetail(indexPathRow: indexPath.row, navigationController: navigationController!)
    }
}

extension ArticleListView: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height) {
            globalPage += 1
            presenter?.startFetchArticleList()
            spinner.stopAnimating()
            tableView.tableFooterView?.isHidden = true
        }
    }
}
