//
//  ProfileViewController.swift
//  Unsplash
//
//  Created by KimJaeYoun on 2021/12/22.
//

import UIKit

class ProfileViewController: UIViewController, TabBarImageInfo {
    //MARK: Properties
    var nomal = "person"
    var selected = "person.fill"
    var barTitle = "Profile"
    
    private let tableViewdataSource = ImageListDataSource()
    private let tableViewHeaderView = ProfileHeaderView()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProfileHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: ProfileHeaderView.identifier)
        tableView.register(ImageListTableViewCell.self,
                           forCellReuseIdentifier: ImageListTableViewCell.cellID)
        
        return tableView
    }()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        configureTableView()
    }
}

//MARK: - Setup View And Layout
extension ProfileViewController: HierarchySetupable {
    func setupViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - Configure Views
extension ProfileViewController {
    func configureTableView() {
        let headerViewHeight: CGFloat = 44
        
        tableView.sectionHeaderHeight = headerViewHeight
        tableView.tableHeaderView = tableViewHeaderView
        tableView.delegate = tableViewdataSource
        tableView.dataSource = tableViewdataSource
    }
}