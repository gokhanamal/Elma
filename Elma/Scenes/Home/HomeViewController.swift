//
//  ViewController.swift
//  Elma
//
//  Created by Gokhan Namal on 10.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: HomeViewModelProtocol! {
        didSet {
            viewModel.view = self
        }
    }
    
    var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupNavigationBar()
        setupTableView()
        
        viewModel.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "🍎Elma"
        navigationController?.navigationBar.barTintColor = .white
    }
    
    private func setupSearchBar() {
        searchBar.placeholder = "Hangi hizmete ihtiyaciniz var?"
    }
}

extension HomeViewController: HomeViewDelegate {
    func handleOutput(_ output: HomeViewModelOutputs) {
        switch output {
        case .setLoading(let isLoading):
            if isLoading {
                activityIndicator.isHidden = false
                tableView.isHidden = true
            } else {
                activityIndicator.isHidden = true
                tableView.isHidden = false
            }
        case .showList(let sections):
            self.sections = sections
            tableView.reloadData()
        case .openURL(with: let url):
            UIApplication.shared.open(url, options: [:])
        case .showError(let error):
            showAlert(title: "Error!", message: error)
        }
    }
    
    func navigate(to route: HomeViewRoute) {
        switch route {
        case .serviceDetails(let viewModel):
            let viewController = ServiceDetailsBuilder.make(viewModel: viewModel)
            present(viewController, animated: true)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SectionCell.reuseIdentifier, for: indexPath) as! SectionCell
        cell.delegate = self
        cell.setupCell(section: sections[indexPath.section])
        return cell
    }
}
