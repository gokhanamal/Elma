//
//  ServiceDetailsViewController.swift
//  Elma
//
//  Created by Gokhan Namal on 12.09.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

final class ServiceDetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ServiceDetailsViewModel! {
        didSet {
            viewModel.view = self
        }
    }
    
    private var infoCells = [InfoCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
        
        viewModel.viewDidLoad()
    }
    
    @objc func dismissModal() {
        dismiss(animated: true)
    }
    
    private func setupGradient() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.black.withAlphaComponent(0.1).cgColor, UIColor.black.withAlphaComponent(0.8).cgColor]
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: imageView.frame.size.width, height: imageView.frame.size.height)
        
        imageView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissModal))
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ServiceDetailsViewController: ServiceDetailsViewDelegate {
    func handleOutput(_ output: ServiceDetailsOutputs) {
        switch output {
        case .setLoading(let isLoading):
            handleSetLoading(isLoading: isLoading)
        case .showDetails(let serviceDetails, let cells):
            serviceNameLabel.text = serviceDetails.name
            
            imageView.downloadImage(string: serviceDetails.imageURL)
            imageView.contentMode = .scaleAspectFill
            setupGradient()
            
            infoCells = cells
            tableView.reloadData()
        case .showError(let error):
            showAlert(title: "Error!", message: error)
        }
    }
    
    private func handleSetLoading(isLoading: Bool) {
        if isLoading {
            activityIndicator.isHidden = false
            serviceNameLabel.isHidden = true
            tableView.isHidden = true
        } else {
            activityIndicator.isHidden = true
            serviceNameLabel.isHidden = false
            tableView.isHidden = false
        }
    }
}

extension ServiceDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") else { return UITableViewCell() }
        let info = infoCells[indexPath.row]
        cell.imageView?.image = UIImage(named: info.icon)
        cell.textLabel?.attributedText = info.text
        return cell
    }
}
