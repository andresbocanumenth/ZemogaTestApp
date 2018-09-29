//
//  PostDetailViewController.swift
//  ZemogaTestApp
//
//  Created by Andres on 9/28/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    private let viewModel = PostDetailViewModel()
    var post: Post!
    
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        configBindings()
        viewModel.loadUserInfo(by: post.userId)
        viewModel.loadComments(by: post.id)
    }
    
    func setupView() {
        bodyLabel.text = post.body
        tableView.estimatedRowHeight = 67.0
        tableView.rowHeight = UITableViewAutomaticDimension
        configRightButton()
    }
    func configRightButton() {
        navigationItem.rightBarButtonItem = nil
        let imageName = post.isFavorite ? "favorite" :"addFavorites"
        let img = UIImage(named: imageName)
        let favButton = UIBarButtonItem(image: img, style: .plain, target: self, action: #selector(favAction))
        navigationItem.setRightBarButton(favButton, animated: true)
    }
    func configBindings() {
        viewModel.onDidLoadUserInfo = {
            self.loadUserInfo()
        }
        viewModel.onDidLoadComments = {
            self.tableView.reloadData()
        }
    }
    
    func loadUserInfo() {
        nameLabel.text = viewModel.userInfo?.name
        emailLabel.text = viewModel.userInfo?.email
        phoneLabel.text = viewModel.userInfo?.phone
        websiteLabel.text = viewModel.userInfo?.website
    }
    
    @objc func favAction() {
        viewModel.setFavorite(this: post, isFavorite: !post.isFavorite)
        configRightButton()
    }
}

extension PostDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier) as! CommentTableViewCell
        cell.configure(with: viewModel.comments[indexPath.row])
        return cell
    }
}
